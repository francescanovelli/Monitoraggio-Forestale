// Creo i poligoni per una classificazione supervisionata
var polygons = ee.FeatureCollection([
 ee.Feature(Forest, {'class': 0}),
 ee.Feature(nonForest, {'class': 1})
]);
print(polygons);
Map.addLayer(polygons);

// Calcolo il BAP
var library = require("users/sfrancini/bap:library"); 
var BAPCS = library.BAP(null, "08-01", 30, 70, 0.7, 0.2, 0.3, 1500); // ingoro gli ultimi 4 parametri, avrò una collazione di immagini
var predictors = BAPCS.filter(ee.Filter.calendarRange(2022, 2022, "year")).first(); // filtro per creare un immagine di un solo anno
print(predictors);

// Uso queste bande per la predizzione
var bands = ["blue", "green", "red", "nir", "swir1", "swir2"];

// Dataset di training, questo associa a tutti i pixel dei valori
var training = predictors.sampleRegions({
collection: polygons, // Questo da i valori ad ogni poligono
properties: ['class'],
// Set the scale to get Landsat pixels in the polygons.
scale: 30
});

print(training.first());
print(training.size());

// Create an RF classifier with custom parameters.
var classifier = ee.Classifier.smileRandomForest({numberOfTrees:10})
// 
// Train the classifier.
var trained = classifier.train(training, 'class', bands);

// Classifico l'immagine
var classified = predictors.classify(trained);

// // Faccio la mia immagine classificata
Map.setCenter(-62.836, -9.2399, 11);
Map.addLayer(predictors, 
{bands: ['red', 'green', 'blue'], min:0, max:2500}, "RGB BAP");
// Map.addLayer(polygons, {}, 'training polygons');
Map.addLayer(classified,
           {min: 0, max: 1, palette: ['green', 'red']},
           'deforestation');







