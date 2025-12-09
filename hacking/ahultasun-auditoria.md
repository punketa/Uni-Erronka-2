# Ahultasun auditoria

Lehenik, 192.168.1.0 sarean dugun zerbitzu guztiak piztu ditugu.

### Auditoria mota: Zuria

Kutxa zuriko analisia egingo dugu sarearen ikuspegi totala dugulako. Zerbitzariak, firewallak, ip-ak, portuak... ezagutzen ditugulako.

### Auditoretzaren helburuak eta mugak zehaztu:

Kali Linuxetik Metasploitable makinaren urrakortasun errealak detektatu, ustiatu eta dokumentatzea, horien eragina ebaluatuz eta defentsa-neurriak proposatuz.

Datuak:

-Sistema kaltebera: Metasploitable 2

Aztertutako zerbitzuak:

-FTP (vsftpd)

-MySQL

-Samba

-Telnet

-VNCviewer

### Auditoria faseak:

1. fasea: Informazioa biltzea

Kali Linuxetik sarearen eskaneazio osoa, zerbitzu eta portu irekiak identifikatzeko.

<figure><img src="../.gitbook/assets/image (2).png" alt="" width="440"><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (4).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (5).png" alt="" width="546"><figcaption></figcaption></figure>



2. fasea – Zahurgarrien azterketa

Barne-sarean aktibo zeuden hainbat hosts identifikatu ditugu, eta horietako bakoitzak hainbat zerbitzu dituzte ikusgai. Zahurgarritasun oso handia duen makina bat nabarmentzen da, gure metasploitablea.

<figure><img src="../.gitbook/assets/image (6).png" alt=""><figcaption></figcaption></figure>

192.168.1.1 host-a sareko firewall/routerrari dagokio (pfSense). Ez da ustiapen-probetan sartu, azpiegitura-elementua delako.

<figure><img src="../.gitbook/assets/image (7).png" alt=""><figcaption></figcaption></figure>

Zerbitzu korporatibo ugari aktibo zituen Windows sistema bat detektatu dugu. Ez dugu hau aukeratuko, auditoria beste makina batean zentratuko delako.

<figure><img src="../.gitbook/assets/image (8).png" alt=""><figcaption></figcaption></figure>

DFS zerbitzua, zaurgarririk ez.

<figure><img src="../.gitbook/assets/image (9).png" alt=""><figcaption></figcaption></figure>

Linux zerbitzaria, oso portu gutxi ditu zabalik

<figure><img src="../.gitbook/assets/image (10).png" alt=""><figcaption></figcaption></figure>

192.168.1.109 host-ak eraso-azalera oso handia du. Eta zerbitzu asko ez daude seguru edo ez daude eguneratuta. Makina metasploitagarri2 bezala identifikatzen da, eta auditoriaren helburu nagusia bezala erabiliko dugu.



3. fasea – Zahurgarrien azterketa

\
Larritasun HANDIKO zaurgarritasunak:

FTP –  21 portua (vsftpd)

Zifratu gabeko zerbitzua, bertsio kaltebera ezaguna, baimendu gabeko urruneko sarbidea ahalbidetzen du

Arriskua: HANDIA



Samba – Portuak 139/445

Komandoen urruneko exekuzioa, ez da beharrezkoa aldez aurretik autentifikatzea

Eragina:&#x20;Sistemarako eta barne-fitxategietarako sarbide osoa.

Arriskua: HANDIA



MySQL – 3306 portua

Zerbitzu irisgarria pasahitzik gabe, datu-baseen erakusketa

Eragina:&#x20;Informazioa lapurtu, aldatu edo ezabatzea.

Arriskua: HANDIA



Larritasun TXIKIKO zaurgarritasunak:

HTTP – 80 portua

Azaldutako informazioa, direktorioak zerrendatzeko aukera

Eragina:&#x20;Oinarrizko informazioa iragaztea

Arriskua: TXIKIA
