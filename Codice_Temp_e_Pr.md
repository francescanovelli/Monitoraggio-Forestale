# TEMPERATURE E PRECIPITAZIONI DI 7 VALLI ALPINE

``` js
var TC = ee.ImageCollection("IDAHO_EPSCOR/TERRACLIMATE"),
    Valli = ee.FeatureCollection("users/novellifrancescaa/Valli_Alpine");

Map.addLayer(Valli, {}, 'Valli Alpine');
Map.centerObject(Valli, 7)

var periodo = ee.List.sequence(1958, 2024);

// Dataset precipitazioni (somma annuale)
var Dataset_pr = ee.ImageCollection(periodo.map(function(y){
                  var inizio = ee.Date.fromYMD(y, 1, 1);
                  var fine = inizio.advance(1, 'year');
                  var Annopr = TC.filterDate(inizio, fine).sum();
                  return Annopr.set('year', y);
})
);

// Dataset Temperatura (medie annuali)
var Dataset_t = ee.ImageCollection(periodo.map(function(y){
                  var inizio = ee.Date.fromYMD(y, 1, 1);
                  var fine = inizio.advance(1, 'year');
                  var Annot = TC.filterDate(inizio, fine).mean();
                  return Annot.set('year', y);
})
);
```





## ALTA VALLE TAGLIAMENTO 

``` js
// ALTA VAL TAGLIAMENTO
var tag= Valli.filter(ee.Filter.eq("id", 1))

// Calcolo media Alta Val Tagliamento precipitazioni annuali
var tagpr = Dataset_pr.map(function(img) {
            var valore_tagpr = img.reduceRegion({
                               reducer: ee.Reducer.mean(),
                               geometry: tag.geometry()
            }).get('pr');
            return ee.Feature(null,{'year' : img.get('year'), 'precip_mean_mm' : valore_tagpr});
});

// Grafico Precipitazioni
print(ui.Chart.feature.byFeature(tagpr, 'year', 'precip_mean_mm')
     .setOptions({
     title: 'Precipitazione annuale in Alta Val Tagliamento (1958–2024)',
     hAxis: {title: 'Anno'},
     vAxis: {title: 'Precipitazione (mm)'},
     lineWidth: 2,
     pointSize: 4
  })
);

// Calcolo media Temperature annuali Alta Val Tagliamento
var tagt = Dataset_t.map(function(img) {
           var valore_tagt = img.reduceRegion({
                             reducer: ee.Reducer.mean(),
                             geometry: tag.geometry()
});
var tmaxtag = ee.Number(valore_tagt.get("tmmx")).multiply(0.1);
var tmintag = ee.Number(valore_tagt.get("tmmn")).multiply(0.1);
    return ee.Feature(null,{
    'year' : img.get('year'),
    'temp_min' : tmintag,
    'temp_max' : tmaxtag
  });
});

// Grafico Temperature
print(ui.Chart.feature.byFeature(tagt, 'year', ['temp_min','temp_max'])
     .setOptions({
     title: 'Temperature minime e massime medie annuali in Alta Val Tagliamento (1958–2024)',
     hAxis: {title: 'Anno'},
     vAxis: {title: 'Temperatura (°C)'},
     lineWidth: 2,
     pointSize: 4
 })
);
```
## VALLE DI ZOLDO

``` js
//VAL DI ZOLDO
var zoldo = Valli.filter(ee.Filter.eq("id", 2))

// Calcolo media Val di Zoldo precipitazioni annuali
var zoldopr = Dataset_pr.map(function(img) {
              var valore_zoldopr = img.reduceRegion({
                                   reducer: ee.Reducer.mean(),
                                   geometry: zoldo.geometry()
              }).get('pr');
              return ee.Feature(null,{'year' : img.get('year'), 'precip_mean_mm' : valore_zoldopr});
});

// Grafico Precipitazioni
print(ui.Chart.feature.byFeature(zoldopr, 'year', 'precip_mean_mm')
     .setOptions({
     title: 'Precipitazione annuale in Val di Zoldo (1958–2024)',
     hAxis: {title: 'Anno'},
     vAxis: {title: 'Precipitazione (mm)'},
     lineWidth: 2,
     pointSize: 4
  })
);

// Calcolo media Temperature annuali Val di Zoldo 
var zoldot = Dataset_t.map(function(img) {
             var valore_zoldot = img.reduceRegion({
                                 reducer: ee.Reducer.mean(),
                                 geometry: zoldo.geometry()
});
var tmaxzoldo = ee.Number(valore_zoldot.get("tmmx")).multiply(0.1);
var tminzoldo = ee.Number(valore_zoldot.get("tmmn")).multiply(0.1);
    return ee.Feature(null,{
    'year' : img.get('year'),
    'temp_min' : tminzoldo,
    'temp_max' : tmaxzoldo
  });
});

// Grafico Temperature
print(ui.Chart.feature.byFeature(zoldot, 'year', ['temp_min','temp_max'])
     .setOptions({
     title: 'Temperature minime e massime medie annuali in Val di Zoldo (1958–2024)',
     hAxis: {title: 'Anno'},
     vAxis: {title: 'Temperatura (°C)'},
     lineWidth: 2,
     pointSize: 4
  })
);
```

## VAL DI NON

``` js
//VAL DI NON
var non = Valli.filter(ee.Filter.eq("id", 3))

// Calcolo media Val di Non precipitazioni annuali
var nonpr = Dataset_pr.map(function(img) {
            var valore_nonpr = img.reduceRegion({
                               reducer: ee.Reducer.mean(),
                               geometry: non.geometry()
            }).get('pr');
            return ee.Feature(null,{'year' : img.get('year'), 'precip_mean_mm' : valore_nonpr});
});

// Grafico Precipitazioni
print(ui.Chart.feature.byFeature(nonpr, 'year', 'precip_mean_mm')
     .setOptions({
     title: 'Precipitazione annuale in Val di Non (1958–2024)',
     hAxis: {title: 'Anno'},
     vAxis: {title: 'Precipitazione (mm)'},
     lineWidth: 2,
     pointSize: 4
  })
);

// Calcolo media Temperature annuali Val di Non 
var nont = Dataset_t.map(function(img) {
           var valore_nont = img.reduceRegion({
                             reducer: ee.Reducer.mean(),
                             geometry: non.geometry()
});
var tmaxnon = ee.Number(valore_nont.get("tmmx")).multiply(0.1);
var tminnon = ee.Number(valore_nont.get("tmmn")).multiply(0.1);
    return ee.Feature(null,{
    'year' : img.get('year'),
    'temp_min' : tminnon,
    'temp_max' : tmaxnon
  });
});

// Grafico Temperature
print(ui.Chart.feature.byFeature(nont, 'year', ['temp_min','temp_max'])
     .setOptions({
     title: 'Temperature minime e massime medie annuali in Val di Non (1958–2024)',
     hAxis: {title: 'Anno'},
     vAxis: {title: 'Temperatura (°C)'},
     lineWidth: 2,
     pointSize: 4
  })
);
```

## VAL CAMONICA

``` js
// VAL CAMONICA
var cam= Valli.filter(ee.Filter.eq("id", 4))

// Calcolo media Val Camonica precipitazioni annuali
var campr = Dataset_pr.map(function(img) {
            var valore_campr = img.reduceRegion({
                               reducer: ee.Reducer.mean(),
                               geometry: cam.geometry()
            }).get('pr');
            return ee.Feature(null,{'year' : img.get('year'), 'precip_mean_mm' : valore_campr});
});

// Grafico Precipitazioni
print(ui.Chart.feature.byFeature(campr, 'year', 'precip_mean_mm')
     .setOptions({
      title: 'Precipitazione annuale in Val Camonica (1958–2024)',
      hAxis: {title: 'Anno'},
      vAxis: {title: 'Precipitazione (mm)'},
      lineWidth: 2,
     pointSize: 4
  })
);

// Calcolo media Temperature annuali Val Camonica
var camt = Dataset_t.map(function(img) {
           var valore_camt = img.reduceRegion({
                             reducer: ee.Reducer.mean(),
                             geometry: cam.geometry()
});
var tmaxcam = ee.Number(valore_camt.get("tmmx")).multiply(0.1);
var tmincam = ee.Number(valore_camt.get("tmmn")).multiply(0.1);
    return ee.Feature(null,{
    'year' : img.get('year'),
    'temp_min' : tmincam,
    'temp_max' : tmaxcam
  });
});

// Grafico Temperature
print(ui.Chart.feature.byFeature(camt, 'year', ['temp_min','temp_max'])
     .setOptions({
     title: 'Temperature minime e massime medie annuali in Val Camonica (1958–2024)',
     hAxis: {title: 'Anno'},
     vAxis: {title: 'Temperatura (°C)'},
     lineWidth: 2,
     pointSize: 4
    })
);

```

## VAL DI SUSA

``` js
//VAL DI SUSA
var susa = Valli.filter(ee.Filter.eq("id", 5))

// Calcolo media Precipitazioni annuali Val di Susa
var susapr = Dataset_pr.map(function(img) {
             var valore_susapr = img.reduceRegion({
                                 reducer: ee.Reducer.mean(),
                                 geometry: susa.geometry()
            }).get('pr');
            return ee.Feature(null,{'year' : img.get('year'), 'precip_mean_mm' : valore_susapr});
});

// Grafico Precipitazioni
print(ui.Chart.feature.byFeature(susapr, 'year', 'precip_mean_mm')
     .setOptions({
     title: 'Precipitazione annuale in Val di Susa (1958–2024)',
     hAxis: {title: 'Anno'},
     vAxis: {title: 'Precipitazione (mm)'},
     lineWidth: 2,
     pointSize: 4
  })
);


// Calcolo media Temperature annuali Val di Susa 
var susat = Dataset_t.map(function(img) {
            var valore_susat = img.reduceRegion({
                               reducer: ee.Reducer.mean(),
                               geometry: susa.geometry()
});
var tmaxsusa = ee.Number(valore_susat.get("tmmx")).multiply(0.1);
var tminsusa = ee.Number(valore_susat.get("tmmn")).multiply(0.1);
    return ee.Feature(null,{
    'year' : img.get('year'),
    'temp_min' : tminsusa,
    'temp_max' : tmaxsusa
  });
});

// Grafico Temperature
print(ui.Chart.feature.byFeature(susat, 'year', ['temp_min','temp_max'])
     .setOptions({
     title: 'Temperature minime e massime medie annuali in Val di Susa (1958–2024)',
     hAxis: {title: 'Anno'},
     vAxis: {title: 'Temperatura (°C)'},
     lineWidth: 2,
     pointSize: 4
  })
);
```

## VALLE STURA

``` js
//VALLE STURA
var stura= Valli.filter(ee.Filter.eq("id", 6))

// Calcolo media Valle Stura precipitazioni annuali
var sturapr = Dataset_pr.map(function(img) {
              var valore_sturapr = img.reduceRegion({
                                   reducer: ee.Reducer.mean(),
                                   geometry: stura.geometry()
               }).get('pr');
              return ee.Feature(null,{'year' : img.get('year'), 'precip_mean_mm' : valore_sturapr});
});

// Grafico Precipitazioni
print(ui.Chart.feature.byFeature(sturapr, 'year', 'precip_mean_mm')
     .setOptions({
     title: 'Precipitazione annuale in Valle Stura (1958–2024)',
     hAxis: {title: 'Anno'},
     vAxis: {title: 'Precipitazione (mm)'},
     lineWidth: 2,
     pointSize: 4
  })
);


// Calcolo media Temperature annuali Valle Stura
var sturat = Dataset_t.map(function(img) {
             var valore_sturat = img.reduceRegion({
                                 reducer: ee.Reducer.mean(),
                                 geometry: stura.geometry()
});
var tmaxstura = ee.Number(valore_sturat.get("tmmx")).multiply(0.1);
var tminstura = ee.Number(valore_sturat.get("tmmn")).multiply(0.1);
    return ee.Feature(null,{
    'year' : img.get('year'),
    'temp_min' : tminstura,
    'temp_max' : tmaxstura
  });
});

// Grafico Temperature
print(ui.Chart.feature.byFeature(sturat, 'year', ['temp_min','temp_max'])
     .setOptions({
     title: 'Temperature minime e massime medie annuali in Valle Stura (1958–2024)',
     hAxis: {title: 'Anno'},
     vAxis: {title: 'Temperatura (°C)'},
     lineWidth: 2,
     pointSize: 4
  })
);
```

## VAL GRANDE

``` js
// VAL GRANDE
var gra= Valli.filter(ee.Filter.eq("id", 7))

// Calcolo media Val Grande precipitazioni annuali
var grapr = Dataset_pr.map(function(img) {
            var valore_grapr = img.reduceRegion({
                               reducer: ee.Reducer.mean(),
                               geometry: gra.geometry()
            }).get('pr');
            return ee.Feature(null,{'year' : img.get('year'), 'precip_mean_mm' : valore_grapr});
});

// Grafico Precipitazioni
print(ui.Chart.feature.byFeature(grapr, 'year', 'precip_mean_mm')
     .setOptions({
     title: 'Precipitazione annuale in Val Grande (1958–2024)',
     hAxis: {title: 'Anno'},
     vAxis: {title: 'Precipitazione (mm)'},
     lineWidth: 2,
     pointSize: 4
  })
);

// Calcolo media Temperature annuali Val Grande
var grat = Dataset_t.map(function(img) {
           var valore_grat = img.reduceRegion({
                             reducer: ee.Reducer.mean(),
                             geometry: gra.geometry()
});
var tmaxgra = ee.Number(valore_grat.get("tmmx")).multiply(0.1);
var tmingra = ee.Number(valore_grat.get("tmmn")).multiply(0.1);
    return ee.Feature(null,{
    'year' : img.get('year'),
    'temp_min' : tmingra,
    'temp_max' : tmaxgra
  });
});

// Grafico Temperature
print(ui.Chart.feature.byFeature(grat, 'year', ['temp_min','temp_max'])
     .setOptions({
     title: 'Temperature minime e massime medie annuali in Val Grande (1958–2024)',
     hAxis: {title: 'Anno'},
     vAxis: {title: 'Temperatura (°C)'},
     lineWidth: 2,
      pointSize: 4
  })
);
```





