# IDS Alertak

IDS alertak egiteko, snort instalatuko dugu. Honen bidez bezeroak zer egiten duten kontrolatuko dugu. Bi arau jarri ditugu bat bezeroek ping egiten dutenean alerta agertzeko eta bestea alerta&#x20;

Snort instalatu.

Interfazeak sortu:

<figure><img src="../.gitbook/assets/image (246) (1).png" alt=""><figcaption></figcaption></figure>

Arau pertsonalizatuak:

Alertak ezarri:

Alerta hau bezeroak ping egiten dutenean alerta agertzeko da:

alert icmp 192.168.3.0/24 any -> any any (msg:"\[ALERTA] Cliente LAN haciendo ping"; sid:1000003; rev:1; classtype:icmp-event; threshold:type limit, track by\_src, count 1, seconds 10; priority:2;)<br>

<figure><img src="../.gitbook/assets/unknown (63).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/unknown (64).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (247).png" alt=""><figcaption></figcaption></figure>

Alerta hau bezeroak ssh egiten dutenean alerta agertzeko da:

alert tcp 192.168.3.0/24 any -> any 22 (msg:"\[ALERTA] Cliente LAN intentando conexion SSH"; flags:S; sid:1000010; rev:1; classtype:attempted-admin; threshold:type limit, track by\_src, count 1, seconds 60; priority:1;)<br>

<figure><img src="../.gitbook/assets/image (250).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (249).png" alt=""><figcaption></figcaption></figure>



Internetetik hartutako arauak deskargatu:

<figure><img src="../.gitbook/assets/image (8) (1).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (9).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (10).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (11).png" alt=""><figcaption></figcaption></figure>

WAN, LAN eta BEZ interfazean guztiak aktibatu:

<figure><img src="../.gitbook/assets/image (12).png" alt=""><figcaption></figcaption></figure>

Aktibatu OpenID:

<figure><img src="../.gitbook/assets/image (13).png" alt=""><figcaption></figcaption></figure>

