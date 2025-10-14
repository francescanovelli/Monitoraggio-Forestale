// Preparo i dati di riferiemnto
nfi_gsv = nfi_gsv.filterBounds(geometry); // filtro l'intero dataset ad un solo poligono
Map.addLayer(nfi_gsv)

// Preparo i predittori, in una cartella ho delle funzione che calcola il medoid usato per sentinel-2
var library = require("users/sfrancini/speciesClassification:library"); 

// Creo un medoid composite
var medoidVariables = library.medoidComposite("2018-06-15", "2018-08-15", "2018");
Map.addLayer(medoidVariables, {bands: ["2018red", "2018green", "2018blue"], min:0, max: 3000})

// Utilizzo la regressione lineare per capire se esiste una correlazione tra due variabili 
// Temperature, calcola la temperatra media in questi anni toglieno i 273.15 gradi kelvin per avere i °C
var temperature = c.filter(ee.Filter.calendarRange(2010, 2020, "year"))
.select("mean_2m_air_temperature").mean().subtract(273.15);
// Precipitation, mediana della media delle precipitazioni
var precipitation = c.filter(ee.Filter.calendarRange(2010, 2020, "year"))
.select("total_precipitation").median();

// Unisco le immagini creando i predittori contendendo tutte le mie variabili indipendenti
var predictors = ee.Image.cat([medoidVariables, dem.select(0).mean(),temperature,precipitation])
                               .addBands(ee.Image.pixelCoordinates('EPSG:4326')) // qui aggiungo le bande dove per ogni pixel mi da le coordinate
                               .float();


// STEP 1 *******************************************************************************************************

// Creo un dataset di training che combina le mie variabili indipendenti (predictors) 
// con quelle dipendente (nfi gsv)
// Qui gli dico che voglio solo dei predittori precisi per ogni regione
var trainingDataset = predictors.reduceRegions({
collection: nfi_gsv, // dataset da cui prendo i valori
reducer: ee.Reducer.first(), // riduttore
scale: 20 // scala di precisione (20m)
});

print(trainingDataset.first())

// Salvo il mio dataset, in questo caso ho una tabella
Export.table.toAsset({
collection: trainingDataset, 
description: "trainingDataset", 
assetId: "projects/planetunifi/assets/UNIBO/trainingDataset"
})


// STEP 2 *******************************************************************************************************

Map.addLayer(trainingDataset_loaded)
print(trainingDataset_loaded)

// Calcolo m and q
var fit = trainingDataset_loaded.reduceColumns({
  reducer: ee.Reducer.linearFit(),
  selectors: ['2018NDVI', 'Vapv_ha']});
print(fit)

var m = ee.Number(fit.get("scale"));
var q = ee.Number(fit.get("offset"));
print(m)
print(q)

// Faccio la predizione usando i coefficienti della regressione calcolati
var predictedGSVmap = medoidVariables.select("2018NDVI").multiply(m).add(q);
Map.addLayer(predictedGSVmap.clip(geometry), {min:0, max:500, palette: ["white", "yellow", "lightgreen", "green", "darkgreen"]})

// Calcolo la radice quadrata degli scarti quadratici (RMSE) e visualizzo
var trainingDataset_loaded_withPredictions = trainingDataset_loaded.map(function(f){
  var NDVI = ee.Number(f.get("2018NDVI"));
  var Vapv_ha = ee.Number(f.get("Vapv_ha"));
  var prediction = NDVI.multiply(m).add(q);
  var scarto = Vapv_ha.subtract(prediction) // scarto
  var scarto2 = scarto.pow(2) // scarto quadratico
  return f.set("prediction", prediction).set("scarto", scarto).set("scarto2", scarto2)})

print(trainingDataset_loaded_withPredictions)

// media degli scarti che deve essere zero o vicino
var mediaScarti = trainingDataset_loaded_withPredictions.aggregate_mean('scarto');
print('mediaScarti:', mediaScarti.round());

// Calcolo sia im MSE che il RMSE
var mse = trainingDataset_loaded_withPredictions.aggregate_mean('scarto2');
print('MSE:', mse);
var rmse = ee.Number(mse).sqrt();
print('RMSE:', rmse);


// Codici per dei grafici
// Scatterplot, Volume Vs. NDVI
var chart_NDVIvsVapv = ui.Chart.feature.byFeature({
  features: trainingDataset_loaded_withPredictions,
  xProperty: '2018NDVI',
  yProperties: ['Vapv_ha']})
.setChartType('ScatterChart')
.setOptions({
  title: 'Scatter plot tra x e y',
  hAxis: {title: 'NDVI'},
  vAxis: {title: 'Vapv_ha'},
  pointSize: 6,
  colors: ['#1f77b4']});

print(chart_NDVIvsVapv);

// Scatterplot, Volume misurato Vs. Volume predetto
var chart = ui.Chart.feature.byFeature({
  features: trainingDataset_loaded_withPredictions,
  xProperty: 'prediction',
  yProperties: ['Vapv_ha']})
.setChartType('ScatterChart')
.setOptions({
  title: 'Scatter plot tra x e y',
  hAxis: {title: 'prediction'},
  vAxis: {title: 'reference'},
  pointSize: 6,
  colors: ['#1f77b4']});

print(chart);

// Istogramma
var histogram = ui.Chart.feature.histogram({
  features: trainingDataset_loaded_withPredictions,
  property: 'scarto',
  minBucketWidth: 50  // ampiezza dei bin})
.setOptions({
  title: 'Distribuzione scarti',
  hAxis: {title: 'scarti'},
  vAxis: {title: 'Frequenza'},
  colors: ['#1b9e77']});

print(histogram);










