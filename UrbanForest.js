var geometry = 
    /* color: #98ff00 */
    /* shown: false */
    ee.Geometry.Polygon(
        [[[11.355140785226325, 44.47883091320929],
          [11.362350563058357, 44.473931427514],
          [11.36526880646656, 44.467071456428634],
          [11.367328742989997, 44.46131335836362],
          [11.375396827706794, 44.469766541228324],
          [11.376426795968513, 44.47258399682832],
          [11.3757401504607, 44.48801634009572],
          [11.375911811837653, 44.495608534365395],
          [11.377971748361091, 44.505403453661664],
          [11.369388679513435, 44.5150743216545],
          [11.355312446603278, 44.52241821251077],
          [11.331451515206794, 44.52706886463324],
          [11.313427070626716, 44.513115794432366],
          [11.298492530831794, 44.51593115661628],
          [11.294715980538825, 44.51287097390149],
          [11.290424446114997, 44.5058931564312],
          [11.276348213204841, 44.49573098101262],
          [11.28396952078723, 44.48595958302883],
          [11.286372780064573, 44.48240793090109],
          [11.311607002476682, 44.48889871781812],
          [11.333236335972776, 44.48510230748526],
          [11.347827553013792, 44.481183173134035]]]),
    wc = ee.ImageCollection("ESA/WorldCover/v200");


// Definisco i parametri di input
var mmu = 5; // minimo numero di pixel che le aree verdi avranno
// se io metto un parametro molto piccolo evito che aree possano essere erronemante classificate come alberi
var pixelsDist = 100; // 1km, 10 metri è la mia risoluzione per 100 sono 1000m
var outFolder = "outputFolder"

// Maschera per la foresta
var forest = wc.first().eq(10); // do alla mia variabile il valore dei pixel
Map.addLayer(forest, {}, "forest");

//Rimuovo tutti gli oggetti più piccoli di mmu
var smallObj = forest.connectedPixelCount(mmu, false); // inserendo false quindi guardo solo i pixel a contatto con il mio pixel
Map.addLayer(smallObj, {}, "smallObj");

//Faccio una maschera per la vegetazione, in questo modo tolgo gli oggetti piccoli
var isNotSmall = smallObj.gte(mmu);
Map.addLayer(isNotSmall, {}, "isNotSmall");

var veg = forest.updateMask(isNotSmall).unmask(0);
Map.addLayer(veg, {}, "veg");

// Calcolo la distanza dalel zone verdi
var dist = veg.fastDistanceTransform(pixelsDist, "pixels",  'manhattan').unmask(pixelsDist); 
// primo argomento la distanza
// secondo argomento unità di misura
// terzo argomento tipo di distanza: euclidea o manhattan
dist = dist.multiply(10); // converto i pixel in metri
Map.addLayer(dist, {min:0, max:1000, palette: ["green", "white", "red"]}, "dist");

// in questo modo blocco la scala dei pixel
dist = dist.reproject({
crs: "EPSG:3035", 
scale: 10
});
Map.addLayer(dist, {min:0, max:1000, palette: ["green", "white", "red"]}, "dist reprojected");

// Applica un reducer nello spazio, quindi solo i pixel dentro una geometria
// in questo caso uso la media
var mean = dist.rename("mean").reduceRegion({
reducer: ee.Reducer.mean(), geometry: geometry,
scale: 10, maxPixels: 1e13, tileScale: 1});

// Posso usare anche altri parametri oltre alla media
var max = dist.rename("max").reduceRegion({
reducer: ee.Reducer.max(), geometry: geometry,
scale: 10, maxPixels: 1e13, tileScale: 1}); 

var sd = dist.rename("sd").reduceRegion({
reducer: ee.Reducer.stdDev(), geometry: geometry,
scale: 10, maxPixels: 1e13, tileScale: 1});

// Criterio 3-30-300, creo una maschera dove mi segna con 1 le zone </= segna con 0 le zone > di 300m
// Quindi sono quei pixel che non mi rispettano la regola 3-30-300
var tooFarPxs = dist.rename("tooFarPxs").gte(300).reduceRegion({
reducer: ee.Reducer.sum(), geometry: geometry,
scale: 10, maxPixels: 1e13, tileScale: 1});

// Posso fare una tabella con tutti questi parametri
var table = ee.Feature(null, {
                                'mean': mean.get("mean"),
                                'sd': sd.get("sd"),
                                'max': max.get("max"),
                                'tooFarPxs': tooFarPxs.get("tooFarPxs")
});

print(table)
