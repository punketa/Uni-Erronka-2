# PF SENSE

Lehenik sare eskema planteatu dugu: [SARE ESKEMA](https://drive.google.com/file/d/10WPuzvEvVgmkRm84kR8llVKRmou5MjGZ/view?usp=sharing)

Behin ideaik hartuta eta base batekin, hasi gara lehen pfsense egiten.



## PFSENSE 1

Sare txartelak ezarri makinari:

(foto de las tarjetas de red)

Makina hasi, interfaceak hautatu (kontuz MAC-arekin) :&#x20;

<figure><img src="../.gitbook/assets/unknown (5) (1).png" alt=""><figcaption></figcaption></figure>

Hasieran WAN ezartzerakoan DHCP bitartez emandako IP-a ezartzen dizu, aldetu behar da eta momentu batean Gateway eskatuko dizu, ezdakit zergatik nire kasuan salto egiten du komando hori beraz aurrerago aldatu beharko dut:

<figure><img src="../.gitbook/assets/unknown (4) (1).png" alt=""><figcaption></figcaption></figure>

Behin IP-ak aldatuta, web orrira jo dezakegu eta helbide honetan jarri dezakegu WAN Gateway-a: 192.168.71.254

<figure><img src="../.gitbook/assets/unknown (3) (1).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/unknown (6) (1).png" alt=""><figcaption></figcaption></figure>

Orain beste interfazeak eta sareen IP-ak jarriko ditugu:&#x20;

<figure><img src="../.gitbook/assets/unknown (7) (1).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (23).png" alt=""><figcaption></figcaption></figure>

(Suposatzen da LAN gure zerbitzuen sarea dela baina LAN denez ez du usten izena aldatzen)

<figure><img src="../.gitbook/assets/unknown (12).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/unknown (9) (1).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (21) (1).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (20) (1).png" alt=""><figcaption></figcaption></figure>

192.168.71.45 taldeko baten ip pertsonala da eta hori erabili dugu pfsense-ren WAN bezala. Honek ematen digu interneta. Beste aldetik sareak ezarri ditugu. (Sareak berez .254 izan behar dira gateway direlako, baina hasieratik holan laga nuen eta orain beldurra daukat aldatzeko 💀)



Hasieran interneta izateko sare guztietan rule batzuk jarri ditugu:

<figure><img src="../.gitbook/assets/image (25).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/unknown (13).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/unknown (14).png" alt=""><figcaption></figcaption></figure>

Bale, suposatzen da hemen interneta dugula sare guztietan baina ez zebilen eta chatgpt jaunak esan dit NAT automatikoa martxan ez zegoelako dela, beraz aldatu egin dut NAT eta hau jarri diot:

<figure><img src="../.gitbook/assets/unknown (16).png" alt=""><figcaption></figcaption></figure>

Orain, pfsenserekin esperiantzia gehiadgo daukadala esan dezaket WAN baimen hauek markatuta izatearen errua zela (uste dut):

<figure><img src="../.gitbook/assets/image (27).png" alt=""><figcaption></figcaption></figure>

Dena den, NAT-arekin funtzionatu zaigu eta momentu horretarako nahikoa zen erronkarekin hasteko internet genuelako sare guztietan.&#x20;

Frogatzeko hainbat ping egin ditugu, 8.8.8.8 -ra eta sareen artean eta guztiak ping egiten zituen:

<figure><img src="../.gitbook/assets/unknown (17).png" alt=""><figcaption></figcaption></figure>

Momentuz horrela utzi genuen lehen pfsensa. Geroago jarriko ditugu firewall baimenak.



## PFSENSE 2

Behin lehen zatiaren makinak, bezeroak etab sortuta, bigarren enpresaren sarearekin hasi ginen.

Bestearen berdina baina laburragoa da LAN bakarra dugulako.

Sare txartelak ezarri:

(foto de las red tarjeta)

Interfazeak hautatu, aldatu edo ezarri IP-ak:

<figure><img src="../.gitbook/assets/image (28).png" alt=""><figcaption></figcaption></figure>

Web orrira jo, Gateway-a ezarri:

<figure><img src="../.gitbook/assets/unknown (18).png" alt=""><figcaption></figcaption></figure>

Firewall baimenak jarri ditugu:

<figure><img src="../.gitbook/assets/image (29).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (30).png" alt=""><figcaption></figcaption></figure>

Eta bigarren zatian orain ere interneta dago.

Behin bi zatitan interneta izanik, VPN-ekin hasi gaitezke.&#x20;
