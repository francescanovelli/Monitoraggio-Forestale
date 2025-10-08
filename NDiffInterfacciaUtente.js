var loadInputs = function(){

var startDate        = startDateTexbox        .getValue();
var endDate          = endDateTexbox          .getValue();
var B1               = B1selectorbox          .getValue();
var B2               = B2selectorbox          .getValue();
var clouds           = cloudsSlider           .getValue();
var minVal           = minValSlider           .getValue();
var maxVal           = maxValSlider           .getValue();

return { 
  startDate        : startDate,
  endDate          : endDate,
  B1               : B1,
  B2               : B2,
  clouds           : clouds,
  minVal           : minVal,
  maxVal           : maxVal
};
};

var run = function(){
var Inputs = loadInputs();
print(Inputs);

// load functions 
var r = require("users/marchisottigreta/Application1:Difference"); 
 
// run the function

r.calculateNDiff(
Inputs.startDate,
Inputs.endDate,
Inputs.clouds,
Inputs.B1,
Inputs.B2,
Inputs.minVal,
Inputs.maxVal
);

};

var removeLayers = function(){
  Map.clear();
}


// # input parameters
// run boxes 
var runcalculateCompositeButton = ui.Button('Run');
runcalculateCompositeButton.onClick(run);     
var removeLayersButton = ui.Button('Reset');
removeLayersButton.onClick(removeLayers);

// Text boxes
var Title = ui.Label({
  value: "Sentinel-2 Normalized Difference visualizer",
  style: {
    fontWeight: "bold",
    backgroundColor: "#d0f0c0",
    fontSize: "14px"
  }
});


//DATA
var startDateTexbox = ui.Textbox({
placeholder: 'startDate (e.g. 2025-05-20)',
value: '2025-07-01',
style: {width: '85px'}});
var startDateLabel = ui.Label({value: "Start Date", 
                  style:{backgroundColor : "#d0f0c0", shown: true}});
                  
var endDateTexbox = ui.Textbox({
placeholder: 'endDate (e.g. 2025-20-2025)',
value: '2025-08-01',
style: {width: '85px'}});
var endDateLabel = ui.Label({value: "End Date", 
                  style:{backgroundColor : "#d0f0c0", shown: true}});

// BANDE
var B1selectorbox   = ui.Select({
  items: [
    {label: "blue",       value: "B2" },
    {label: "green",      value: "B3" },
    {label: "red",        value: "B4" },
    {label: "NIR",        value: "B8" },
    {label: "SWIR 1",     value: "B11" }
    ]}).setValue('B8');
var B1Label = ui.Label({value: "B1", 
                  style:{backgroundColor : "#d0f0c0", shown: true}});

var B2selectorbox   = ui.Select({
  items: [
    {label: "blue",       value: "B2" },
    {label: "green",      value: "B3" },
    {label: "red",        value: "B4" },
    {label: "NIR",        value: "B8" },
    {label: "SWIR 1",     value: "B11" }
    ]}).setValue('B4');
var B2Label = ui.Label({value: "B2", 
                  style:{backgroundColor : "#d0f0c0", shown: true}});

// NUVOLE
var cloudsSlider = ui.Slider({min: 0, max: 100, value:20, step: 1,
                             style: { width: '165px', backgroundColor : "#d0f0c0", color: "red"}});
var cloudsLabel = ui.Label({value: "Maximum percentage of clouds in the image", 
                  style:{backgroundColor : "#d0f0c0", shown: true}});

// MIN e MAX
var minValSlider = ui.Slider({min: -1, max: 1, step: 0.1, value:-1,
style: { width: '195px', backgroundColor : "#d0f0c0", color: "blue", shown: true}});
var minValLabel = ui.Label({value: "Index minimum value", 
                  style:{backgroundColor : "#d0f0c0", shown: true}});
                  
var maxValSlider = ui.Slider({min: -1, max: 1, step: 0.1, value:1,
style: { width: '195px', backgroundColor : "#d0f0c0", color: "blue", shown: true}});
var maxValLabel = ui.Label({value: "Index maximum value", 
                  style:{backgroundColor : "#d0f0c0", shown: true}});
                  
// PANNELLO GENERALE
var panel = ui.Panel({style: {width: '300px', backgroundColor: "#d0f0c0", 
border: '2px solid black', textAlign: "center", whiteSpace: "nowrap", shown: true}});

// Aggiunta box al pannello
panel.add(Title);
panel.add(startDateLabel);
panel.add(startDateTexbox);
panel.add(endDateLabel);
panel.add(endDateTexbox);
panel.add(B1Label);
panel.add(B1selectorbox);
panel.add(B2Label);
panel.add(B2selectorbox);
panel.add(cloudsLabel);
panel.add(cloudsSlider);
panel.add(minValLabel);
panel.add(minValSlider);
panel.add(maxValLabel);
panel.add(maxValSlider);
panel.add(runcalculateCompositeButton);
panel.add(removeLayersButton);
ui.root.add(panel);
Map.setOptions('SATELLITE')
