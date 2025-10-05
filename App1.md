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
