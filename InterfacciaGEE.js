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

print(S2.first()) // sto stampando così solo il primo elemento 


// mask clouds, funzioni che uso per crare una maschera per le nuvole
var maskClouds = function(img){  // tra tonde ci vanno gli argomenti della funzione. tra graffa ci vanno gli effetti
  var SCL = img.select("SCL");
  var vegetation = SCL.eq(4); // la funzione .eq() mi serve per far si che tutti i pixel della classe 4 siano uguali a 1 e gli altri 0
  var soil = SCL.eq(5);
  var water = SCL.eq(6);
  var mask = soil.or(water).or(vegetation); // la funzione .or() serve perchè in caso di acqua o vegetazione il pixel deve valere 1 in altro caso 0
  var maskedImage = img.updateMask(mask);
  return maskedImage;
};


// calculate median composite
var composite = S2_masked.median();

// mi serve per crare un layer, con molto meno rumore dei precedenti
Map.addLayer(composite, {min:min, max:max, bands:[B1, B2, B3]}, startDateWithYear+"/"+endDateWithYear+"_"+B1+"-"+B2+"-"+B3);

// serve per decidere l'output che deve avere la nostra funzione
return composite;

// per vedere se funziona devo usare:
var composite2025 = calculateComposite(2025, "06-01", "08-31", 70, "B4", "B3", "B2", 0, 3000);

