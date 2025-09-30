// link di cose utili
//  https://custom-scripts.sentinel-hub.com/custom-scripts/sentinel-2/composites/ 


// creare un interfaccia utente
var year = 2022; 
// var è la funzione year in nome della variabile e 2022 è il valore della variabile
var startDate = "06-01";
var endDate = "08-31";
var cloudsTh = 10;
var B1 = "B4";
var B2 = "B3";
var B3 = "B2";
var min = 0;
var max = 3000;
// sono i parametri di input che creano la nostra interfaccia

// codice per caricare una collezione di immagini, il secondo rigo serve per filtrare le immagini della collezione
var S2 = ee.ImageCollection('COPERNICUS/S2_SR_HARMONIZED')
        .filter(ee.Filter.lt('CLOUDY_PIXEL_PERCENTAGE', cloudsTh)) // 'cloudy-pixel-percentage è una funzione della mia collezione di immagini
        .filterDate("2025-06-01", "2025-08-01");


