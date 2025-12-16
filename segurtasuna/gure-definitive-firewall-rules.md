# Gure definitive firewall Rules 😎

## PFSENSE 1

WAN

<figure><img src="../.gitbook/assets/image (67).png" alt=""><figcaption></figcaption></figure>

WAN FROGAK:

<figure><img src="../.gitbook/assets/unknown (28).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/unknown (29).png" alt=""><figcaption></figcaption></figure>

LAN (Zerbitzuak):

LAN-a ez du uzten DMZ pasatzen, soilik Wordpress eta Jitsi erabiltzeko behar diren portuak zabaltzen ditu.

LAN-a Gitano.eus  (10.0) sare osoa uzten du pasatzen. Konexio totala eralazioa egiteko.

LAN-a sarrera guztia du Bezeroekin (3.0), sarrera totala izanik.

LAN-a klasearen (71.0) sare osoa blokeatzen du.

LAN-a bakarrik sarearen funtzio basikoak utziko ditu pasatzen.

<figure><img src="../.gitbook/assets/image (68).png" alt=""><figcaption></figcaption></figure>

LAN FROGAK:

-Pings a cada servidor y pcs del 1.0 (debe hacer ping y tiene q poder entrar a intranet)

<figure><img src="../.gitbook/assets/image (88).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (90).png" alt=""><figcaption></figcaption></figure>

-Pings a cada servidor y pcs del 2.0 (no debe hacer pero si debe ver wordpres y jitsi)

<figure><img src="../.gitbook/assets/image (91).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (92).png" alt=""><figcaption></figcaption></figure>



<figure><img src="../.gitbook/assets/image (93).png" alt=""><figcaption></figcaption></figure>

-Pings a cada servidor y pcs del 3.0 (debe hacer ping)

<figure><img src="../.gitbook/assets/image (94).png" alt=""><figcaption></figcaption></figure>

\
-Pings a cada servidor y pcs del 10.0 (debe hacer ping, es logico se tienen q ver para la relacion de confianza y para eso hicimos Peer to Peer)

<figure><img src="../.gitbook/assets/image (97).png" alt=""><figcaption></figcaption></figure>

-Pings a cada servidor y pcs del 71.0 (no debe hacer ping)

<figure><img src="../.gitbook/assets/image (98).png" alt=""><figcaption></figcaption></figure>



-Ping a google.com (no debe hacer ping)\
-Curl https://google.com (debe salir algo de html)\
-nslookup google.com (tiene q buscar la ip)

<figure><img src="../.gitbook/assets/image (99).png" alt=""><figcaption></figcaption></figure>

DMZ

DMZ ez du konekziorik izango ez LAN ez Bezeroen sareekin.

DMZ Gitano.eus (10.0) sare osoa uzten du pasatzen.

DMZ klasearen (71.0) IP batzuen portu batzuk uzten ditu pasatzen.

DMZ bakarrik sarearen funtzio basikoak utziko ditu pasatzen.

<figure><img src="../.gitbook/assets/image (69).png" alt=""><figcaption></figcaption></figure>

DMZ FROGAK:

-Pings a cada servidor y pcs del 1.0 (no debe hacer ping)

<figure><img src="../.gitbook/assets/image (100).png" alt=""><figcaption></figcaption></figure>

\
-Pings a cada servidor y pcs del 2.0 (debe hacer ping)

<figure><img src="../.gitbook/assets/image (101).png" alt=""><figcaption></figcaption></figure>



-Pings a cada servidor y pcs del 3.0 (no debe hacer ping)

<figure><img src="../.gitbook/assets/image (102).png" alt=""><figcaption></figcaption></figure>

\
-Pings a cada servidor y pcs del 10.0 (debe hacer ping)

<figure><img src="../.gitbook/assets/image (103).png" alt=""><figcaption></figcaption></figure>

\
-Pings a cada servidor y pcs del 71.0 (no debe hacer ping a ninguno el 71.75, al 71.202, 71.214 y el arduino tienen los puertos necesarios abiertos, por que el wordpress coge datos de la base de datos de adrian (71.202) o si lo hacemos con datos inventado en la base de datos de diego (71.214) , y el codigo de arduino lo tiene Igor 71.45 y el arduino tambien tiene su propia IP (71.2xx))



\
-Ping a google.com (no debe hacer ping)\
-Curl https://google.com (debe salir algo de html)\
-nslookup google.com (tiene q buscar la ip)

<figure><img src="../.gitbook/assets/image (104).png" alt=""><figcaption></figcaption></figure>



BEZ

Pfsense Admin bezeroarentzako salbuespenak frogak egiteko.

Bez sarea Gitano.eus (10.0) sare osoa blokeatzen du (Payo.eus -eko unibertsitatekoak direlako)

Bezero normalak ezin dira PFsense web orrira sartu (Soilik Pfsense Admin)

Bez DMZ-ko web zerbitzuentzako (Wordpress eta Jitsi) portu zehatzak zabaltzen ditu.

DMZ bakarrik sarearen funtzio basikoak utziko ditu pasatzen.

Bezeroen arteko komunikazio osoa dago.

<figure><img src="../.gitbook/assets/image (70).png" alt=""><figcaption></figcaption></figure>

BEZ FROGAK:

-Pings a cada servidor y pcs del 1.0 (debe hacer ping)

<figure><img src="../.gitbook/assets/image (105).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (106).png" alt=""><figcaption></figcaption></figure>

-Pings a cada servidor y pcs del 2.0 (no debe hacer ping)

<figure><img src="../.gitbook/assets/image (107).png" alt=""><figcaption></figcaption></figure>

\
-Pings a cada servidor y pcs del 3.0 (debe hacer ping)

<figure><img src="../.gitbook/assets/image (108).png" alt=""><figcaption></figcaption></figure>

\
-Pings a cada servidor y pcs del 10.0 (no debe hacer ping)

<figure><img src="../.gitbook/assets/image (109).png" alt=""><figcaption></figcaption></figure>

\
-Pings a cada servidor y pcs del 71.0 (no debe hacer ping)

<figure><img src="../.gitbook/assets/image (110).png" alt=""><figcaption></figcaption></figure>

\
-Mirar pfsense, intranet, wordpres, jitsi, dfs etc (deberia entrar a todo menos pfsense, quitando el bezero 3.103 ese bezero es de pruebas para no ir cambiando de makina tol rato puede entrar a todo)

(falta pfsense)

<figure><img src="../.gitbook/assets/image (111).png" alt=""><figcaption></figcaption></figure>



<figure><img src="../.gitbook/assets/image (112).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (113).png" alt=""><figcaption></figcaption></figure>

\*Aqui da el error de q cuando se meten dos usuarios se desconectan de la llamada, hay q preguntar a Esti\*

-Mirar si deja entrar a steam, discord o asi (no deberia entrar, tiene los puertos basicos de internet, salta una alerta)

<figure><img src="../.gitbook/assets/image (114).png" alt=""><figcaption></figcaption></figure>

VPN

<figure><img src="../.gitbook/assets/image (71).png" alt=""><figcaption></figcaption></figure>

VPN FROGAK:

<figure><img src="../.gitbook/assets/unknown (28).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/unknown (29).png" alt=""><figcaption></figcaption></figure>



## PFSENSE2

Lehenik aipatu behar da, perimetro-segurtasuna pfSense1 eremuan zentralizatzen dela.&#x20;PfSense2 konfiantza-firewall gisa konfiguratzen da, eta gutxieneko arauak ditu enpresa arteko komunikazio segurua eta kontrolatua bermatzeko.

ALIAS bat sortu dugu arinago egiteko: (lehen pfsensean ez dugu erabili por q no sabiamos)

<figure><img src="../.gitbook/assets/image (12) (1).png" alt=""><figcaption></figcaption></figure>

Arauak:

<figure><img src="../.gitbook/assets/image (10) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

GITANO LAN

-pings a cada servidor y pcs del 1.0 debe hacer

<figure><img src="../.gitbook/assets/image (2) (1) (1) (1) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

\
-pings a cada servidor y pcs del 2.0 no debe hacer

<figure><img src="../.gitbook/assets/image (3) (1) (1) (1) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>



-pings a cada servidor y pcs del 3.0 debe hacer

<figure><img src="../.gitbook/assets/image (6) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

\
-pings a cada servidor y pcs del 10.0 debe hacer

<figure><img src="../.gitbook/assets/image (8) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

\
-pings a cada servidor y pcs del 71.0 no debe hacer

\
![](<../.gitbook/assets/image (9) (1) (1) (1) (1).png>)

-mirar pfsense, intranet, wordpres, jitsi, dfs etc (deberia entrar a todo menos pfsense)

(falta pfsense)

<figure><img src="../.gitbook/assets/image (4) (1) (1) (1) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (5) (1) (1) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (7) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>
