# Programazioa

1\. Erabilitako osagaiak.

<br>

-ESP32

<br>

-DHT11 sentsorea (tenperatura eta hezetasuna)

<br>

-PIR sentsorea (mugimendua)

<br>

-Soinu-sentsorea (mikrofono analogikoa + irteera digitala)

<br>

-TFT SPI pantaila

<br>

-WiFi sarea

<br>

-Web zerbitzaria, PHP eta datu-basearekin (MySQL)

\
\
\
\
\
\
<br>

3\. Konexioen eskema (hardwarea)

<br>

3.1 DHT11 sentsorea (tenperatura eta hezetasuna)

DHT11                                                           ESP32

<br>

VCC                                                                  3.3V

<br>

GND                                                                  GND

<br>

DATA                                                                GPIO 22

\
\
\
\
<br>

Konfigurazioa kodean Sentsorea aktibatzeko:

<br>

\#define DHTPIN 22

\#define DHTTYPE DHT11

\
\
<br>

3.2 Sensor PIR (Movimiento)

\
<br>

&#x20;            PIR                                                         ESP32        &#x20;

<br>

&#x20;            VCC                                                        5V o 3.3V &#x20;

<br>

&#x20;            GND                                                       GND

<br>

&#x20;            OUT                                                        GPIO 27

\
\
<br>

Konfigurazioa Sentsorea aktibatzeko:

<br>

\#define PIR\_PIN 27

\
\
<br>

Sentsoreak hau itzultzen du:

<br>

HIGH (1) → Antzemandako mugimendua

<br>

LOW (0) → Mugimendurik gabe

\
\
\
\
\
\
<br>

3.3 Soinu-sentsorea (mikrofonoa)

\
<br>

Modulu honek bi irteera ditu:

<br>

Irteera analogikoa (soinu-maila)

<br>

&#x20;&#x20;

&#x20;      Micrófono                                                   ESP32

<br>

&#x20;      AO                                                            GPIO 35     &#x20;

<br>

&#x20;    &#x20;

<br>

Konfigurazioa Sentsorea aktibatzeko:

&#x20;

\#define MIC\_ANALOG 35

\
\
\
<br>

Irteera digitala (zarata detektatzea)

\
<br>

&#x20;    Micrófono                                                   ESP32

<br>

&#x20;      DO                                                            GPIO 22     &#x20;

\
<br>

Konfigurazioa Sentsorea aktibatzeko:

<br>

\#define MIC\_DIGITAL 22

\
\
\
\
\
\
\
\
<br>

4\. Softwarearen funtzionamendua

<br>

4.1 Liburutegiak sartzea

<br>

\#include \<WiFi.h>

\#include \<TFT\_eSPI.h>

\#include \<DHT.h>

\#include \<HTTPClient.h>

\
\
\
<br>

-Honako hauek egiteko aukera ematen dute liburu-denda horiek:

<br>

-WiFi konexioa

<br>

-TFT pantailaren kontrola

<br>

-DHT sentsorearen irakurketa

<br>

-Datuak bidaltzea HTTP

\
\
\
<br>

4.2 WiFi sarerako konexioa

<br>

const char\* ssid = "PAYO";

const char\* password = "Admin123";

<br>

En el setup():

&#x20;  -WiFia hasten da

&#x20;-ESP32 konektatu arte itxaroten da

&#x20;-IPa TFT pantailan erakusten da

WiFi.begin(ssid, password);

while (WiFi.status() != WL\_CONNECTED) {

delay(500);

}

\
<br>

4.3 Sentsoreen irakurketa

<br>

Loop-aren ziklo bakoitzean ():

<br>

Tenperatura → dht.readTemperature ()

<br>

Hezetasuna → dht.readHumidity ()

<br>

Mugimendua → digitalRead (PIR\_PIN)

<br>

Soinua → analogRead (MIC\_ANALOG)

<br>

Balio horiek aldagaietan biltegiratzen dira, eta erabili aurretik baliozkotu egiten dira.

\
\
\
\
\
<br>

4.4 Zerbitzariari datuak bidaltzea

<br>

-WiFia konektatuta badago:

<br>

-HTTP bezero bat sortzen da

<br>

-POST eskaera bat prestatzen da

<br>

-Datuak PHP zerbitzarira bidaltzen dira

\
\
<br>

http.begin(serverURL);

http.addHeader("Content-Type", "application/x-www-form-urlencoded");

\
\
\
\
\
\
\
\
<br>

Bidalitako datuak:

<br>

-tenperatura

<br>

-hezetasuna&#x20;

<br>

-soinua&#x20;

<br>

-DETEKTATUTA (BAI/EZ)

<br>

-Adibidea:

<br>

temperatura=23.50\&hezetasuna=60.20\&soinua=345\&detectado=SI

\
\
<br>

4.5 Web zerbitzaria eta datu-basea

<br>

-Datuak.php fitxategiak POST bidez jasotzen ditu datuak

<br>

-Balioak baliozkotzen dira

<br>

-MySQL datu-base batean txertatzen dira

<br>

-Web orriak datu-basea kontsultatzen du

<br>

-Datuak denbora errealean edo historikoan erakusten dira

\
<br>

Fluxu osoa:

<br>

ESP32 → WiFi → PHP → Base de Datos → Página Web

\
\
\
\
\
\
\
\
<br>

4.6 TFT pantailan bistaratzea

<br>

-ESP32ak hau erakusten du:

<br>

-Tenperatura

<br>

-Hezetasuna

<br>

-Antzemandako mugimendua

<br>

-Soinu-maila

<br>

-Zarata-egoera

<br>

Adibidea:

<br>

tft.printf("Temp: %.1f C", t);

\
<br>

Pantaila 60 segundotik behin eguneratzen da:

<br>

delay(60000);

<br>

5\. Sistemaren ziklo osoa

<br>

1-ESP32 piztu egiten da

<br>

2-WiFi sarera konektatzen da

<br>

3-Sentsoreak eta pantaila abiarazten ditu

<br>

4-Irakurri sentsoreak

<br>

5-Bidali datuak zerbitzarira

<br>

6-Datuak datu-basean gordetzen ditu

<br>

7-Erakutsi informazioa webgunean eta TFTn

<br>

8-Errepikatu prozesua minuturo

<br>

Eskema:

<br>

![](<.gitbook/assets/unknown (91).png>)

<br>
