# Applicazione per calcolare la differenza tra bande
L'interfaccia utente ha l'obiettivo di permettere all'utente di scegliere le due bande tra cui effettuare una differenza.

In questo modo, l'utente può scegliere la visualizzazione più adatta al proprio scopo, come la differenza tra NIR e red che permette di ottenere l'NDVI.

L'utente potrà quindi scegliere tra bande diverse di Sentinel-2 e selezionare il periodo di interesse.

## Bande e indici
NDWI serve per calcolare monitorare aridità e la gestione dell'irrigazione.

green + NIR lo uso per trovare i corpi di acqua. 

+ B8 NIR
+ B4 red
+ B3 green
+ B11 SWIR1
+ B12 SWIR2

|Indice	|Formula base	|Range teorico	|Range consigliato per visualizzazione |Visualizza
|--- |--- |--- |--- |---
| NDMI (Normalized Difference Moisture Index)	| (NIR - SWIR) / (NIR + SWIR)	| -1 a +1	| -0.5 a +1 (valori sotto 0 indicano terreno secco o assenza di umidità) |Umidità della vegetazione o del suolo
| NDBI (Normalized Difference Built-up Index)	|(SWIR - NIR) / (SWIR + NIR)	| -1 a +1	| -0.5 a +0.8 (valori positivi indicano built-up o aree urbanizzate) |Aree costruite |Aree ubranizzate o costruite
| NDVI (Normalized Difference Vegetation Index)	|(NIR - RED) / (NIR + RED)	| -1 a +1	| -0.2 a +1 (valori sotto 0 indicano acqua o suolo nudo; valori sopra 0.3 vegetazione) |Vegetazione
| NDWI (Normalized Difference Water Index)	|(NIR - SWIR) / (NIR + SWIR)	| -1 a +1	| -0.5 a +1 (valori elevati indicano presenza acqua) |Presenza di acqua o contenuto idrico nella vegetazione e nel suolo

``` js
// Creo la mia collezione, con un filtro nuvole e un filtro data
var Sentinel2 = ee.ImageCollection('COPERNICUS/S2_SR_HARMONIZED')
         .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE', 20))
         .filterDate("2024-06-01", "2024-08-01");

print(Sentinel2.first())        
Map.addLayer(Sentinel2, {bands:["B8", "B4"], min:0, max: 3000})

// Maschera per la nuvole
var maskClouds = function(img){
  var SCL = img.select("SCL");
  var mask = SCL.eq(5) //suolo nudo
            .or(SCL.eq(6)) //acqua
            .or(SCL.eq(4)) //vegetazione
return img.updateMask(mask);
}

// Creo un layer con la mappa filtrata dalle nuvole 
var S2masked = Sentinel2.map(maskClouds);
Map.addLayer(S2masked, {bands:["B8", "B4"], min:0, max: 3000})
```

