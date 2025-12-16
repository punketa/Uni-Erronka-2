# Defentsa neurriak

Ustiapen eta post-ustiapen frogetan identifikatutako ahultasun nagusien aurrean ezarri beharreko defentsa-neurriak azalduko dugu.

Helburua: sistemaren segurtasun maila handitzea, baimenik gabeko sarbideak saihestea eta eraso baten ondorengo inpaktua minimizatzea.

### 1. Zerbitzuen eta Sistemaren Segurtasuna

#### 1.1 Zerbitzuen kudeaketa

* Beharrezkoak ez diren zerbitzu guztiak desgaitu behar dira.
* Arrisku handiko zerbitzuak (Telnet, FTP, VNC) saihestu edo protokolo seguruengatik ordezkatu behar dira (SSH, SFTP).
* Zerbitzu guztiak azken bertsio egonkorrean mantendu behar dira.

#### 1.2 Eguneraketak

* Sistema eragilea eta instalatutako software guztia aldizka eguneratu behar dira.

### 2. Autentikazioa eta Sarbide Kontrola

#### 2.1 Pasahitz politika

* Pasahitz lehenetsiak ezabatu behar dira.
* Pasahitz sendoak derrigorrezkoak izan behar dira (luzeak, komplexuak...).
* Pasahitzen iraungitze politika ezarri behar da.

#### 2.2 Pribilegioen kudeaketa

* Gutxieneko pribilegioen printzipioa aplikatu behar da.
* Erabiltzaileek ez dute administratzaile edo root sarbiderik izan behar beharrezkoa ez bada.

### 3. Sare-Segurtasuna

#### 3.1 Firewall eta portuen kontrola

* Firewall bat konfiguratu behar da, beharrezko portuak soilik irekita utziz.
* Sarrera eta irteera arauak zehaztasunez definitu behar dira.
* Barneko zerbitzuak ez dira zuzenean Internetera esposatu behar.

#### 3.2 Sare segmentazioa

* Sistema kritikoak segmentu bereizietan isolatu behar dira.

### 4. Detekzioa eta Monitorizazioa

#### 4.1 Logen kudeaketa

* Sistema, sare eta aplikazio log guztiak aktibatuta egon behar dira.
* Logak zentralizatuta bildu eta babestu behar dira.
* Sarbide susmagarriak eta erroreak automatikoki aztertu behar dira.

#### 4.2 Intrusioen detekzioa

* IDS/IPS sistemak ezarri behar dira sareko jarduera susmagarria detektatzeko.
* Alertak sortu behar dira portaera anomaloen aurrean.
* Erantzun plan automatizatuak ere definitu behar dira.

### 5. Post-Ustiapen Aurkako Neurriak

#### 5.1 Sistema gogortzea

* Sistema konfigurazio lehenetsiak ezabatu behar dira.
* Fitxategi eta direktorioen baimenak zorrozki definitu behar dira.
* Exekutagarri baimenak mugatu behar dira.

#### 5.2 Persistenziaren prebentzioa

* Erabiltzaile berrien sorrera monitorizatu behar da.
* Cron eta antzeko ataza automatikoak kontrolatu behar dira.

### 6. Segurtasun Probak eta Hobekuntza Jarraia

#### 6.1 Segurtasun probak

* Penetration testing eta zaurgarritasun analisiak aldizka egin behar dira.
* Proba horien emaitzak dokumentatu eta konpondu behar dira.
* Probak egin aurretik arau eta baimen argiak definitu behar dira.

#### 6.2 Segurtasun politikak

* Segurtasun politika orokor bat definitu eta aplikatu behar da.
* Erabiltzaile eta administratzaileentzako jarraibide argiak ezarri behar dira.

### Ondorioa:

Defentsa-neurri hauek aplikatuz, ustiapen eta post-ustiapen arrisku nagusiak nabarmen murrizten dira. Segurtasuna ez da zerbait puntuala, etengabeko prozesu bat baizik, beraz, kontrolak, monitorizazioa eta hobekuntzak oinarrizkoak dira sistema seguru eta fidagarri bat izateko.
