# INTRODUZIONE
+ Assessment of vegetation dynamics under changed climate situation using geostatistical modeling (Basit et al., 2024)

  La stima della variabilità spazio-temporale della variabilità della salute della vegetazione e le variabili climatiche associate è un prerequisito per una gestione efficace degli ecosistemi montani. Lo studio vuole quantificiare gli effetti del cambiamento di diversi parametri climatici sulla salute della vegetazione in Khyber Pakhtunkhwa, Pakistan, dal 2012 al 2021.
  L'associazione tra l'NDVI e le tre variabili esplicative, cioè temperatura, precipitazione e velocità del vento, sono state analizzate usando modelli geostatistici.
  Il fattore climatico più dominante nell'influenza delle dinemiche di vegetazione in KPK è la temperatura, seguito dalla velocità del vento e dalle precipitazioni.
  Nel complesso, l'utilizzo di modelli geostatistici basati su dataset di osservazioni terrestri hanno permesso una profonda comprensione delle variazioni spazio-temporali nelle risposte della vegetazione ai cambiamenti climatici, necessarie per uno sviluppo sostenibile e un'azione climatica responsabile.

  È importante riconoscere i fattori del cambiamento della vegetazione per ottimizzare i servizi ecosistemici e la sostenibilità ambientale.

  I parametri climatici che influenzano maggiormente la salute e la distribuzione spaziale della vegetazione sono la temperatura e le precipitazioni.
  Un aumento delle temperature potrebbe risultare in una maggiore evapotraspirazione e in un aumento dell'attività della vegetazione; in ogni caso, il riscaldamento oltre certi livelli rompe l'equilibrio idrotermico necessario per la crescita della pianta.
  Le precipitazioni aumentano la disponibilità di umidità del suolo, facilitando la crescita della pianta attraverso la fornitura di mezzi acquosi per la dissoluzione dei nutrienti del suolo.

  I dati ottenuti dal telerilevamento satellitare sono utili per monitorare e valutare i cambiamenti nella copertura vegetale regionale e globale lungo l'eterogeneità spaziale. Uno degli individi biofisici di vegetazione derivati dai satelliti più utilizzato è il Normalized Difference Vegetation Index (NDVI), che misura la greenness della copertura della vegetazione usando gli spettri di riflettanza alle lunghezze d'onda del rosso e dell'infrarosso vicino.
  > Nell'articolo ci sono altre info sull'NDVI (sottolineate in giallo)

  

# MATERIALI E METODI
## Area di studio

Le valli corrispondono a tre valli in Piemonte (Valle Stura, Val di Susa e Val Grande), una valle in Lombardia (Valle Camonica), una valle in Trentino-Alto Adige (Val di Non), una valle in Veneto (Val di Zoldo) e una valle in Friuli-Venezia-Giulia (Alta valle del Tagliamento). La scelta di queste valli è stata dettata dalla volontà di studiare aree distribuite in tutto l'arco alpino e con due orientamenti principali: sono infatti state selezionate tre valli disposte con orientamento nord-sud (Val Grande, Valle Camonica e Val di Non) e quattro valli disposte con orientamento est-ovest (Valle Stura, Val di Susa, Val di Zoldo e Alta valle del Tagliamento). In questo modo, è stato possibile confrontare i dati di precipitazione e temperatura sia in funzione dei settori alpini, che in funzione dell'orientamento delle valli.

## Dataset
### Dati climatici
TerraClimate

### Dati sulla vegetazione
RandomForest
+ Random Forest Algorithm Overview (Salman et al., 2024)
  Random Forst è un tecnica di machine learning usato nel campo del data mining, sia per la classificazione sia per la creazione di modelli predittivi. Questa tacnica si basa sulla creazione di molteplici alberi decisionali (decision tree), generati a partire da sottoinsiemi casuali del dataset originale. Ogni albero viene quindi allenato su una porzione dei dati e le sue predizzioni vengono successivamente aggregate per ottenere il modello finale. Ogni albero decisonale è generato in maniera del tutto casuale, si per quanto riguarda la selezione dei dati sia nella scelta delle variabili usate per le suddivisioni. Ramndom Forest elabora anche dataset particolaremnte grandi e con molte variabili, funziona anche con dati sbilanciati e alla presenza di varlori mancanti.
  
Carta Forestale Italiana

### Dati territoriali
Digitalizzazione delle valli con il software QGIS utilizzando layer presenti sui geoportali delle regioni italiane interessate.

--------------------------------

# CARATTERISTICHE DELLE VALLI
## VALLE STURA
+ Clima: la Valle Stura di Demonte è orientata da est ad ovest come le valli principali delle Alpi sudoccidentali, a differenza delle Alpi Marittime s.s e Liguri dove, sul versante piemontese,
l'orientamento prevalente è da nord a sud. Ciò condiziona l'afflusso di aria umida marina per cui relativamente asciutta è la Valle Stura, mentre valori più elevati, con precipitazioni tra 900 e 1200 mm,
caratterizzano le altre valli dove il massimo autunnale supera quello primaverile ed il minimo assoluto è quello estivo e non invernale determinando in tal modo più elevate precipitazioni nevose.
Il margine settentrionale delle Alpi Marittime s. s. e Liguri è abbastanza ben delineato delle isoterme 10 °C ed 11 °C e dalla isoieta dei 1000 mm.

+ Vegetazione e Suoli: questi ultimi sono Settori caratterizzati da una straordinaria ricchezza floristica per numero e varietà di specie,
ospitano gli endemismi più significativi delle Alpi ed un numero elevato di relitti tassonomici, di fitocenosi e di popolamenti esclusivi, in particolare nelle stazioni rupestri.

## VAL DI SUSA
+ Clima: settori ben definiti climaticamente rispetto a quelli circostanti per i bassi valori delle precipitazioni annue ed estive, le prime inferiori a 1000 mm; quelli estremi si registrano in alta Valle di Susa e scendono fino a 600 mm.
L'apertura ad ovest, verso le Alpi francesi, condiziona una elevata continentalità e xericità del clima per la presenza di venti dominanti occidentali che, avendo un andamento prevalentemente parallelo all'asta principale della Valle,
determinano scarse precipitazioni e frequenti fenomeni di föhn. Escursioni termiche piuttosto elevate sono tipiche dell'alta Valle di Susa, mentre nel settore inferiore esse sono più moderate.
Ciò, accanto alla mitezza delle temperature medie dei mesi più freddi, spiega la presenza di numerose specie mediterranee (leccio, Juniperus oxycedrus) in oasi xerotermiche della media e bassa Valle di Susa. 


+ Vegetazione e Suolo: l'impronta steppica della vegetazione è generalizzata in tutti i settori ed evidenziata da numerose specie caratteristiche.
L'alta Valle di Susa e Chisone sono comunque caratterizzate da caratteri steppici e più decisamente continentali rispetto alla bassa Valle di Susa.
Le Serie di vegetazione forestale più diffuse e significative sono quelle del larice-pino cembro e dell'abete-picea, ma sui versanti esposti a sud il pino silvestre forma boschi stabili preclimatici.
In bassa e media Valle di Susa la connotazione è decisamente submediterranea.

## VAL GRANDE
+ Clima: precipitazioni medie annue tra 1200 e 2500 mm (Val Cannobina). I valori decrescono da est ad ovest. Le medie del trimestre estivo sono sempre elevate e superiori a 300 mm. Regime pluviometrico di tipo sublitoraneo alpino.

+ Vegetazione e suoli : la vegetazione forestale è caratterizzata, lungo l'asse vallivo principale, da cedui di castagno e boschi misti di latifoglie a struttura irregolare.
Notevole sviluppo hanno le peccete e le abetine variamente consociate con il faggio ed i lariceti. II climax dell'abete assume particolare importanza ed estensione rispettoagli altri territori regionali.

## VALLE CAMONICA

## VAL DI NON

## VALLE DELL'ALTO TAGLIAMENTO
+ Clima:
   + Precipitazioni: Per quanto riguarda la distribuzione delle piogge nell’arco dell’anno, in montagna come in tutta la regione, il mese mediamente meno piovoso è febbraio,
     con valori intorno ai 120-140 mm nella zona prealpina e molto inferiori nelle zone più interne (50-80 mm).
     Durante la primavera le piogge man mano aumentano fino a raggiungere tra maggio e giugno un primo picco intorno ai 250-300 mm mensili sulle Prealpi.
     A luglio le piogge diminuiscono per poi risalire nuovamente a partire dalla terza decade di agosto. La stagione autunnale è decisamente la più piovosa.

  + Temperature: La temperatura media annua registra i valori piuttosto diversificati nel territorio montuoso della regione, dove la temperatura è profondamente influenzata non solo dall’altitudine,
    ma soprattutto dall’esposizione e dall’orientamento delle catene montane delle Prealpi e Alpi Carniche e Giulie, dall’appartenenza ai sistemi idrografici e ai bacini fluviali, dalla conformazione delle valli.
    Considerando le temperature medie mensili, l’andamento annuale registra in generale i valori massimi nei mesi di luglio e agosto e i valori minimi tra gennaio e febbraio.

+ Vegetazione e suolo: 

## VALLE DI ZOLDO

# DA FARE
+ Interfaccia utente
+ Modello per le categorie forestali

# DA CHIEDERE AL PROF.
+ Dobbiamo fare/ha senso calcolare l'NDVI? Lo possiamo fare con i dati della Carta Forestale?

# GRAFICI
+ Correlazione tra temperatura/precipitazione e copertura vegetativa totale (?)

# ARTICOLI INTERESSANTI
+ https://www.mdpi.com/2072-4292/13/10/1904
+ Assessment of vegetation dynamics under changed climate situation using geostatistical modeling (Basit et al., 2024)
https://www.proquest.com/docview/2957801522?accountid=9652&sourcetype=Scholarly%20Journals
+ TerraClimate: https://www.nature.com/articles/sdata2017191
+ RandomForest: https://journals.mesopotamian.press/index.php/BJML/article/view/417/289

+ [[PDF] Evaluating vegetation dynamics in the Yangtze river basin in relation to climatological parameters using remote sensing data from 2001 to 2022](https://bibliotekanauki.pl/articles/63521188.pdf)

# BIBLIOGRAFIA
+ https://www.regione.piemonte.it/giscartografia/Parchi/schede_settori_ecogeografici.pdf
+ https://www.arpa.fvg.it/temi/temi/meteo-e-clima/ultimi-approfondimenti-pubblicati/clima-e-cambiamenti-climatici-nelle-aree-montane-del-friuli-venezia-giulia/
