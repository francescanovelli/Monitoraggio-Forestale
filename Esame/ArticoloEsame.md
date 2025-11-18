# INTRODUZIONE
Il monitoraggio continuo della vegetazione è cruciale per consentire una capacità decisionale informata nelle politiche di conservazione, per un'efficace gestione della bioidversità (Basit et al., 2024).

Per gestire in modo efficace gli ecosistemi, in particolare quelli montani, è quindi importante stimare la variabilità spazio-temporale della vegetazione e le variabili climatiche associate e responsabili di tali cambiamenti (Basit et al., 2024). I parametri climatici che più influenzano la distribuzione spaziale della vegetazione sono la temperatura e le precipitazioni: infatti, un aumento delle temperature potrebbe da un lato aumentare l'attività fotosintetica della vegetazione, ma dall'altro il riscaldamento oltre certi livelli provocherebbe problemi da un punto di vista di biliancio idro-termico e, di conseguenza, avrebbe effetti sulla crescita della pianta; le precipitazioni, invece, sono fondamentali per la disponibilità di acqua nel suolo e quindi prolungati periodi di siccità possono portare alla morte degli organismi vegetali (Basit et al., 2024).
Questa tipologia di analisi permette di fare inferenze anche sul cambiamento delle tipologie di vegetazione in relazione alle condizioni di precipitazione e temperatura, alla posizione geografica e le loro variazioni nel tempo.


In questo contesto, il telerilevamento satellitare è uno strumento molto importante, che permette di monitorare la superficie terrestre, e quindi anche la copertura vegetativa, a scala globale, regionale e locale. I dati vengono acquisiti in maniera continua e dettagliata attraverso satelliti e sensori e si possono ottenere serie temporali che forniscono dati fondamentali per analizzare i driver della distribuzione delle specie e le relative dinamiche tempolari. Per questo motivo, l'integrazione tra dati di remote sensing e il monitoraggio ambientale permette di abbattere i costi e di ottenere informazioni anche a più ampia scala temporale e spaziale (Alírio et al., 2025). 

Nello specifico, Google Earth Engine (GEE; https://earthengine.google.com/) è una piattaforma cloud-based sviluppata da Google per analisi dei dati ambientali a scala planetaria: attarverso GEE scienziati, ricercatori e sviluppatori possono analizzare una vasta gamma di dati geospaziali, tramite l'accesso a varie immagini satellitari e ad altri dataset geospaziali, come il clima, la copertura e l'uso del suolo e dati terrestri (Alírio et al., 2025).

## L'arco alpino
Le Alpi sono un'arco montuoso di 800 km con un'ampiezza media di circa 200 km e un'altezza media di 2.5 km e si estendono prima in direzione nord–sud dal Mediterraneo in Francia, poi curvano verso est attraverso la Svizzera e infine si estendono in direzione est–ovest fino all'Austria orientale (Beniston, 2006; Schar et al., 1998).
La localizzazione geografica e la configurazione delle Alpi le rende una regione particolarmente interessante per molti studi climatici e ambientali, perchè sono caratterizzate da influenze oceaniche, continentali, polari e, occasionalmente, sahariane (Beniston, 2006).

### Topografia dell'arco alpino

<img src="../Esame/TopografiaAlpi.png" />

> Topografia e localizzazione delle Alpi europee (Gobiet et al., 2014)

### Clima nell'arco alpino
Le Alpi sono in una certa misura delimitate dalle influenze concorrenti del Mediterraneo, dell'Atlantico e, in misura minore, del Mare del Nord e del Baltico, e si trovano in una delle zone più calde delle medie latitudini dell'emisfero settentrionale a causa della vicinanza dell’influenza modulante dell’Oceano Atlantico e del serbatoio di calore rappresentato dal Mar Mediterraneo. L'arco alpino è quindi soggetto all'influenza delle tempeste che attraversano l'Atlantico o si sviluppano nel Mediterraneo, ma può anche influenzare i modelli meteorologici in diversi modi, ad esempio attraverso lo sviluppo di sistemi di bassa pressione derivanti dall'interazione tra flussi atmosferici su larga scala e topografia e nell'innesco di onde turbolente di montagna, cioè onde gravitazionali la cui influenza può essere avvertita molto a valle delle montagne stesse (Beniston, 2006).
La topografia alpina influenza la circolazione atmosferica deviando il flusso orizzontalmente e verticalmente, attraverso l'introduzione di elevate fonti e pozzi di calore sensibile e latente e attraverso l'induzione di onde che si propagano nell'atmosfera libera (Schar et al., 1998).

Per quanto riguarda la temperatura, esiste una variazione spaziale con un gradiente nord-sud che è dovuta principalmente alle caratteristiche topografiche. Inoltre, sono osseravti anche gradienti est-ovest di temperatura, in particolare confrontando l'arco alpino con la pianura adiacente, per una scala temporale sia diurna che stagionale (Schar et al., 1998).

Le precipitazioni nelle regioni montane di solito differiscono considerevolmente da quelle delle pianure circostanti (Schar et al., 1998).
I segnali delle precipitazioni alpine rivelano una grande variabilità spaziale dalla scala delle Alpi nella loro totalità a quella dei singoli versanti e questo riguarda sia la media nel lungo termine che la comparsa di forti precipitazioni (Schar et al., 1998).
In generale, le precipitazioni totali annuali e stagionali aumentano con l'altitudine, ma questa relazione mostra forti variazioni per quanto riguarda le località e le stagioni (Schar et al., 1998).
Le precipitazioni nella regione alpina sono un parametro climatico particolarmente importante e non solo per la sua rilevanza per sistemi ecologici ed economici: siccome le precipitazioni risultano da una catena di processi complessi e non lineari, è molto sensibile a parametri esterni; quindi, il riscaldamento globale porebbe influenzare sostanzialmente la frequenza e la distribuzione delle precipitazioni (Schar et al., 1998).
Nella zona umida settentrionale, le medie annuali eccedono i 2000 mm per anno in varie località; nella zona umida meridionale nella regione del Friuli, i valori di precipitazione raggiungono i 3000 mm per anno in alcuni punti, mentre un valore intorno ai 2500 mm per anni è osservato nella valle delle Centovalli in Ticino (Schar et al., 1998).


> Ulteriori dati su precipitazioni e temperatura?

# MATERIALI
## Area di studio

L'area di studio comprende sette valli che sono state scelte come area campione.

Le valli corrispondono a tre valli in Piemonte (Valle Stura, Val di Susa e Val Grande), una valle in Lombardia (Valle Camonica), una valle in Trentino-Alto Adige (Val di Non), una valle in Veneto (Val di Zoldo) e una valle in Friuli-Venezia-Giulia (Alta valle del Tagliamento). La scelta di queste valli è stata dettata dalla volontà di studiare aree distribuite in tutto l'arco alpino e con due orientamenti principali: sono infatti state selezionate tre valli disposte con orientamento nord-sud (Val Grande, Valle Camonica e Val di Non) e quattro valli disposte con orientamento est-ovest (Valle Stura, Val di Susa, Val di Zoldo e Alta valle del Tagliamento). In questo modo, è stato possibile confrontare i dati di precipitazione e temperatura sia in funzione dei settori alpini, che in funzione dell'orientamento delle valli.

Di seguito, si riportano alcune caratteristiche climatiche delle valli oggetto di studio:
+ Valle Stura

  La Valle Stura è orientata da est ad ovest come le valli principali delle Alpi sudoccidentali: ciò condiziona l'afflusso di aria umida marina per cui è una valle relativamente asciutta.
ospitano gli endemismi più significativi delle Alpi ed un numero elevato di relitti tassonomici, di fitocenosi e di popolamenti esclusivi, in particolare nelle stazioni rupestri.
Per quanto riguarda la vegetazione, è caratterizzata da una straordinaria ricchezza floristica per numero e varietà di specie (Suddivisione del Pimeonte in settori eco-geografici, Regione Piemonte).

+ Val di Susa

  L'apertura ad ovest, verso le Alpi francesi, condiziona un'elevata continentalità e xericità del clima per la presenza di venti dominanti occidentali che, avendo un andamento prevalentemente parallelo alla valle, determinano scarse precipitazioni e frequenti fenomeni di föhn.
  Escursioni termiche piuttosto elevate sono tipiche dell'alta Valle di Susa, mentre nel settore inferiore esse sono più moderate.
  È un settore ben definito climaticamente rispetto a quelli circostanti per i bassi valori delle precipitazioni annue (inferiori a 1000 mm) ed estive, che in alta Val di Susa scendono fino a 600 mm. Queste caratteristiche, accanto alle temperature medie miti dei mesi più freddi, spiega la presenza di numerose specie mediterranee in oasi xerotermiche della media e bassa Valle di Susa.

  Le Serie di vegetazione forestale più diffuse e significative sono quelle del larice-pino cembro e dell'abete-picea, ma sui versanti esposti a sud il pino silvestre forma boschi stabili preclimatici. In bassa e media Valle di Susa la connotazione è decisamente submediterranea (Suddivisione del Pimeonte in settori eco-geografici, Regione Piemonte).

+ Val Grande

  Le precipitazioni medie annue presentano valori che compresi tra 1200 e 2500 mm, ma i  valori decrescono da est ad ovest. Il regime pluviometrico è quindi di tipo sublitoraneo alpino.
  
  La vegetazione forestale è caratterizzata, lungo l'asse vallivo principale, da cedui di castagno e boschi misti di latifoglie a struttura irregolare. Hanno un notevole sviluppo anche le peccete e le abetine variamente consociate con il faggio e i lariceti. II climax dell'abete assume particolare importanza ed estensione rispetto agli altri territori regionali (Suddivisione del Pimeonte in settori eco-geografici, Regione Piemonte).

+ Valle Camonica
  La Valle Camonica è una valle orientata N-S situata nelle Alpi Retine ed è caratterizzata da ecosistemi altamente eterogenei in un territorio con un range di elevazione dai 390 m ai 3539 m s.l.m.
  Il clima corrisponde al tipo sub-oceanico temperato. Il range di precipitazioni varia  da un minimo annuale di 900 mm nella parte meridionale della valle a un massimo di 2200 mm nella parte settentrionale della valle. Il regime pluviometrico mostra due picchi in primavera e autunno e due minimi in estate e inverno, con un minimo assoluto in inverno.
  Le temperature sono caratterizzate da una media annuale di 12 °C nel fondovalle. La temperatura minima media è registrata in gennaio con circa +2 °C, mentre la temperatura massima media è registrata in luglio con circa 20 °C.

  
+ Val di Non
  Situata nell'Italia nord-orientale nelle province di Trento e Bolzano, su un'area totale di 635 km2, la Val di Non è una valle N-S che rappresenta il bacino più basso del torrente Noce.
  Le precipitazioni sono intorno ai 900 mm all'anno e hanno una distribuzione annuale da equinoziale, nella parte meridionale, a continentale, nella parte settentrionale.
  Alla stazione metereologica di Romeno (975 m s.l.m.) la temperatura media annuale è di 9.1 °C (Scotton et al., 2014).
  
+ Valle dell'Alto Tagliamento

  Per quanto riguarda la distribuzione delle piogge nell’arco dell’anno, durante la primavera le piogge man mano aumentano fino a raggiungere tra maggio e giugno un primo picco intorno ai 250-300 mm mensili sulle Prealpi; a luglio le piogge diminuiscono per poi risalire nuovamente durante la stagione autunnale che è decisamente la più piovosa.

  La temperatura media annua registra i valori piuttosto diversificati nel territorio, dove la temperatura è profondamente influenzata non solo dall’altitudine,
ma soprattutto dall’esposizione e dall’orientamento delle catene montane delle Prealpi e Alpi Carniche e Giulie, dall’appartenenza ai sistemi idrografici e ai bacini fluviali, dalla conformazione delle valli. Considerando le temperature medie mensili, l’andamento annuale registra in generale i valori massimi nei mesi di luglio e agosto e i valori minimi tra gennaio e febbraio (ARPA FVG, 2022).

+ Val di Zoldo


## Dataset
### Dati climatici

I dati climatici sono stati presi da TerraClimate, un dataset mensile ad alta risoluzione spaziale (1/24°,~4-km) relativo alle condizioni climatiche globali, che copre il periodo dal 1958 fino ad oggi, disponibile su Google Earth Engine.

TerraClimate usa un'interpolazione assistita climaticamente, combinando le normali climatologiche ad alta risoluzione del dataset WorldClim con dati mesili delle variabili di climatiche, provenienti da fonti diverse rispetto al dataset WorldClim, restituendole con una risoluzione molto più grossolana. TerraClimate riesce quindi a produrre dei dati mensili di precipitazioni, temperature massime e minime, velocità del vento, pressione di vapore e radiazione solare.

TerraClimate è ad accesso pubblico posizionato in una repository dell'università di Idaho’s Northwest Knowledge Network; i dati sono aggiornati periodicamente una volta che il dato dell'anno è diventato disponibile (Abatzoglou et al., 2018).

### Dati sulla distribuzione delle tipologie di vegetazione
I dati di base della distribuzione delle tipologie di vegetazione nelle valli area di studio provengono, invece, dalla Carta Forestale Italiana.
+ La Carta Forestale Italiana nasce per creare una mappatura e una classificazione delle superfici forestali a livello nazionale, per disporre di informazioni affidabili sugli ecosistemi forestali. Queste informazioni servono per adeguarsi a degli standard internazionali, in modo da raggiungere gli obiettvi stategici europei e di sostenibilità economica e sociale. Si tratta di una carta multidefinizione basata sulla geometria dell’ultimo volo AGEA disponibile, a scala 1:10.000. La Carta Forestale Italiana è sta creata su due criteri: la definizione di bosco da adottare e il sistema di nomenclatura, partendo da definizioni già esistenti. 
  
### Dati territoriali
I dati territoriali provangono dalla digitalizzazione delle valli con il software QGIS utilizzando layer presenti sui geoportali delle regioni italiane interessate (Piemonte, Lombardia, Trentino Alto-Adige, Veneto, Friuli-Venezia-Giulia).

# METODI
### Medoid
An assessment approach for pixel-based image composites (Francini et al.,2023)
+ Il telerilevamento è tra le maggiori fonti del monitoraggio delle dinamiche forestali e molto spesso le immagini che restituiscono i dati telerilevati presentano pixel di nuvole o nebbia poco utili per guardare la copertura del suolo. Ci sono però metodi per evitare questi pixel prodotti tramite dei composites come il Medoid. Il Medoid è un esempio di metodologia del pixel-based compositing, dove il suo scopo principale è quello di creare delle immagini senza nuvole o nebbia, questo perchè la nebbia come le nuvole o comunque le ombre limitano le osservazioni del suolo e cosi il numero di osservazioni disponibili risultando come data gaps. I composite pixel-based sono stati molto utilizzati per i distrubi forestali, per la preddizione e la mappatura delle foreste. In questo modo il Medoid unisce diverse osservazioni facendole risultare in un'unica immagine, frutto di un collage di molte immagini, di conseguenza l'immagine non ha un riferimento specifico ad una sola data ma rappresenta un range di date. In questo modo ogin pixel ha un immagine donatricie e i diversi pixel arrivando da diverse immagini donatrici.
+ L'obiettivo principale è quello di formare un immagine finale dove i valori di riflettanza dei vari pixel siano il più vicino possibile alla media della rifelttanza calcolata datutte e immagini che donano i pixel senza nuvole. 

### Random Forest
Random Forest Algorithm Overview (Salman et al., 2024)
+   Random Forest è un tecnica di machine learning usato nel campo del data mining, sia per la classificazione che per la creazione di modelli predittivi. Questa tecnica si basa sulla creazione di molteplici alberi decisionali (decision tree), generati a partire da sottoinsiemi casuali del dataset originale. Ogni albero viene quindi allenato su una porzione dei dati e le sue predizioni vengono successivamente aggregate per ottenere il modello finale. Ogni albero decisonale è generato in maniera del tutto casuale, sia per quanto riguarda la selezione dei dati sia nella scelta delle variabili usate per le suddivisioni.

Ramndom Forest elabora anche dataset particolaremnte grandi e con molte variabili e funziona anche con dati sbilanciati e alla presenza di valori mancanti.

# BIBLIOGRAFIA
+ Suddivisione del Pimeonte in settori eco-geografici, Regione Piemonte
https://www.regione.piemonte.it/giscartografia/Parchi/schede_settori_ecogeografici.pdf
+ Clima e cambiamenti climatici nelle aree montane del Friuli Venezia Giulia (ARPA FVG, 2022)
https://www.arpa.fvg.it/temi/temi/meteo-e-clima/ultimi-approfondimenti-pubblicati/clima-e-cambiamenti-climatici-nelle-aree-montane-del-friuli-venezia-giulia/
+ Geoportale Regione Piemonte: https://geoportale.igr.piemonte.it/cms/
+ Geoportale Regione Lombardia: https://www.geoportale.regione.lombardia.it/
+ Portale Geoocartografico del Trentino: http://www.territorio.provincia.tn.it/portal/server.pt/community/portale_geocartografico_trentino/254
+ Geoportale Regione Veneto: https://idt2.regione.veneto.it/
+ Geoportale Friuli-Venezia-Giulia: https://www.regione.fvg.it/rafvg/cms/RAFVG/ambiente-territorio/conoscere-ambiente-territorio/FOGLIA4/
+ Mountain weather and climate: A general overview and a focus on climatic change in the Alps
https://link.springer.com/article/10.1007/s10750-005-1802-0
+ Current Alpine Climate (Schar et al., 1998)
https://iacweb.ethz.ch/doc/publications/1998_Schar_AlpineClimate.pdf
+ Semi-natural grasslands of the Non Valley (Eastern Italian Alps): Agronomic and environmental value of traditional and new Alpine hay-meadow types (Scotton et al., 2014)
https://www.sciencedirect.com/science/article/pii/S0167880914003934
+ Case study: Valle Camonica and the Adamello Park (Gerosa et al., 2013)
https://books.google.it/books?hl=it&lr=&id=dOacDwAAQBAJ&oi=fnd&pg=PA323&dq=%22camonica+valley%22+and+%22precipitation%22&ots=EBD2H_ydzS&sig=JnGP-ADlFloO4590K_iwGVb8REs&redir_esc=y#v=onepage&q&f=false
