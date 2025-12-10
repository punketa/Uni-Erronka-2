---
description: 'Errubrikan eskatzen dena azaltzen da:'
---

# Intranet

## Hasi aurretik:

Guk ubuntu server batean sortu dugu intraneta. Ubuntu serverra gure Bezeroentzako sarean kokatuta dago. Gero pfsense barruan arauen bitartez egin dugu bakarrik Payo.eus barruan dauden bezeroak soilik ikus dezaten.

Ubuntun lehenik apache, php, mariadb... instalatu dugu. Karpetak, VirtualHost-ak, DNS... egin ditugu. Gomendatzen dugu sarearean dokumentazioa ikustea ere.

Sareko guztia egin ondoren githubeko repositorio partekatu bat sortu dugu, soilik intranetaren garapenerako.

Visual studio sftp eta ssh bitartez lortu dugu visual studion egindako azken bertsioa ubuntura igotzea.

<figure><img src="../.gitbook/assets/image (1) (1) (1) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

## Web dokumentuak sortzen ditu zerbitzariko script-lengoaiak erabilita.

### Intranetaren diseinua

Intraneta sortu dugu PAYO.EUS barruko kideak erabiltzeko.

Login orria:

<figure><img src="../.gitbook/assets/image (1) (1) (1) (1) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

Register orria:

<figure><img src="../.gitbook/assets/image (2) (1) (1) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

Hasierako orria:

(foto de hasiera)

### Login orrialdea, intranetean sartu eta baita ere erregistratzeko aukera ematen du.

Sartzerakoan https://intranet.payo.eus login orrialdera bidaltzen gaitu:

<figure><img src="../.gitbook/assets/image (3) (1) (1) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (4) (1) (1) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

Logeatzeroakoan ongietorri orrira bidaltzen gaitu:

<figure><img src="../.gitbook/assets/image (5) (1) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

Erabiltzaile berrien erregistroa funtzionaltasuna dauka:

<figure><img src="../.gitbook/assets/image (6) (1) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (7) (1) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

"Aceptar" ematerakoan logeatzeko orrira bidaltzen gaitu:

<figure><img src="../.gitbook/assets/image (8) (1) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

Pasahitz enkriptatuak erabiltzen dira:

-Hau erregistratzerakoan:

<figure><img src="../.gitbook/assets/image (9) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

-Hau login egiterakoan:

<figure><img src="../.gitbook/assets/image (10) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

Datu basean horrela ikusten da:

<figure><img src="../.gitbook/assets/image (11) (1) (1).png" alt=""><figcaption></figcaption></figure>

### Login-ari persistentzia ematen zaio

Hau egiteko lehenik saioa hasi dugu, loginen php barruan:

<figure><img src="../.gitbook/assets/image (12) (1) (1).png" alt=""><figcaption></figcaption></figure>

Artxibo berdinean saioa sortu dugu:

Hemen pasahitza sartzearekin batera sartu dugu horrela ziurtatzen dugu erabiltzailea datu zuzenak sartzen dutenean sortuko dela saioa.

<figure><img src="../.gitbook/assets/image (13) (1).png" alt=""><figcaption></figcaption></figure>

Register php-an ez da saioa ez ezer behar.

Behin saio hasita dugula, lehena hasierako orria deitu duguna hasiera.html (ongietorri orria), orain hasiera.php izena izen behar du. Horrela ziurtatzen dugu erabiltzailea logeatuta dagoela. Ez badago logeatuta berriz login orrira bidaltzen du:

<figure><img src="../.gitbook/assets/image (14) (1).png" alt=""><figcaption></figcaption></figure>

Saioa izteko hasiera.php barruan "Itxi saioa" botoia dugu:

<figure><img src="../.gitbook/assets/image (15) (1).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (16) (1).png" alt=""><figcaption></figcaption></figure>

Hau da bere kodea:

<figure><img src="../.gitbook/assets/image (17) (1).png" alt=""><figcaption></figcaption></figure>
