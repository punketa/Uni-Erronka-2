---
description: 'Hemen azaltzen da nola sortu dugu intraneta:'
---

# Intranet teknikoa

## Sareak:

Guk ubuntu server batean sortu dugu intraneta. Ubuntu serverra gure Bezeroentzako sarean kokatuta dago.

Sare konfigurazioa:

<figure><img src="../.gitbook/assets/unknown.png" alt=""><figcaption></figcaption></figure>

-Pakete basikoak instalatu:

sudo apt update

sudo apt install -y apache2 mariadb-server php php-mysql php-cli php-curl php-gd php-xml php-mbstring php-zip php-intl unzip wget

Honek instalatzen ditu:

Apache\
MariaDB\
PHP\
Beharrezko moduluak

-Moduluak aktibatu apachen:

sudo a2enmod rewrite

sudo a2enmod ssl

sudo systemctl restart apache2

-Crear la carpeta de la intranet:

sudo mkdir -p /var/www/intranet

sudo chown -R $USER:$USER /var/www/intranet

-Baimenak:

sudo chown -R www-data:www-data /var/www/intranet

sudo chmod -R 755 /var/www/intranet

\
-HTTPS autofirmado:

sudo mkdir -p /etc/ssl/intranet

sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \\

-keyout /etc/ssl/intranet/intranet.key \\

-out /etc/ssl/intranet/intranet.crt \\

-subj "/CN=intranet.payo.eus" \\

-addext "subjectAltName=DNS:intranet.payo.eus"

-VirtualHost HTTPS:\
sudo nano /etc/apache2/sites-available/intranet-ssl.conf

```
<VirtualHost *:80>
    ServerName intranet.payo.eus
    Redirect permanent / https://intranet.payo.eus/
</VirtualHost>

<VirtualHost *:443>
    ServerName intranet.payo.eus
    DocumentRoot /var/www/intranet

    SSLEngine on
    SSLCertificateFile /etc/ssl/intranet/intranet.crt
    SSLCertificateKeyFile /etc/ssl/intranet/intranet.key

    <Directory /var/www/intranet>
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
```

-Aktibatu:

sudo a2ensite intranet-ssl.conf

sudo systemctl restart apache2

-DNS-a sortu:

(fotillo del dns)

## Datu basea

-Datu basea sortu:

sudo mysql

CREATE DATABASE intranet CHARACTER SET utf8mb4 COLLATE utf8mb4\_unicode\_ci;

CREATE USER 'inadmin'@'localhost' IDENTIFIED BY 'Admin123';

GRANT ALL PRIVILEGES ON intranet.\* TO 'inadmin'@'localhost';

FLUSH PRIVILEGES;

USE intranet;

CREATE TABLE erabiltzaileak(

id INT AUTO\_INCREMENT PRIMARY KEY,

erabiltzailea VARCHAR(50) NOT NULL UNIQUE,

email VARCHAR(100) NOT NULL UNIQUE,

pasahitza VARCHAR(255) NOT NULL,

sortuta TIMESTAMP DEFAULT CURRENT\_TIMESTAMP

);

EXIT;

## Wae:

Kodeatzeko visual studion egin dugu eta gero sftp eta ssh bitartez ubuntura igo dugu:

<figure><img src="../.gitbook/assets/image (18) (1).png" alt=""><figcaption></figcaption></figure>

-Repo: [https://github.com/punketa/intranet\_payo](https://github.com/punketa/intranet_payo)

Hemen dago kode guztia, nire komentarioekin.

## Segurtasuna:

Gero pfsense barruan arauen bitartez egin dugu bakarrik Payo.eus barruan dauden bezeroak soilik ikus dezaten.
