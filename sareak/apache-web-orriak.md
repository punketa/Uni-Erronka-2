# Apache (Web-orriak)

Guk ubuntu server batean sortu dugu intraneta eta glpi. Ubuntu serverra gure Zerbitarien sarean kokatuta dago. (192.168.1.0)

<figure><img src="../.gitbook/assets/image (231).png" alt=""><figcaption></figcaption></figure>

### Instalazioa:

-Sare konfigurazioa:

<figure><img src="../.gitbook/assets/image (232).png" alt=""><figcaption></figcaption></figure>

-Pakete basikoak instalatu:

```
sudo apt update
sudo apt install -y apache2 mariadb-server php php-mysql php-cli php-curl php-gd php-xml php-mbstring php-zip php-intl unzip wget
```

Honek instalatzen ditu:

Apache\
MariaDB\
PHP\
Beharrezko moduluak

-Moduluak aktibatu apachen:

```
sudo a2enmod rewrite
sudo a2enmod ssl
sudo systemctl restart apache2
```

### Intranet:

-karpeta sortu:

```
sudo mkdir -p /var/www/intranet
sudo chown -R $USER:$USER /var/www/intranet
```

-Baimenak:

```
sudo chown -R www-data:www-data /var/www/intranet
sudo chmod -R 755 /var/www/intranet
```

\
-HTTPS autofirmado:

```
sudo mkdir -p /etc/ssl/intranet
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/ssl/intranet/intranet.key \
-out /etc/ssl/intranet/intranet.crt \
-subj "/CN=intranet.payo.eus" \
-addext "subjectAltName=DNS:intranet.payo.eus"
```

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

```
sudo a2ensite intranet-ssl.conf
sudo systemctl restart apache2
```

-DNS-a sortu:

<figure><img src="../.gitbook/assets/image (233).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (234).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (237).png" alt=""><figcaption></figcaption></figure>

### GLPI:

-karpeta sortu:

```
sudo mkdir -p /var/www/glpi
sudo chown -R $USER:$USER /var/www/glpi
```

-Baimenak:

```
sudo chown -R www-data:www-data /var/www/glpi
sudo chmod -R 755 /var/www/glpi
```

\
-HTTPS autofirmado:

```
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/ssl/glpi/glpi.key \
  -out /etc/ssl/glpi/glpi.crt \
  -subj "/CN=glpi.payo.eus" \
  -addext "subjectAltName=DNS:glpi.payo.eus"
```

-VirtualHost HTTPS:\
sudo nano /etc/apache2/sites-available/intranet-ssl.conf

```
<VirtualHost *:80>
    ServerName glpi.payo.eus
    Redirect permanent / https://glpi.payo.eus/
</VirtualHost>

# HTTPS
<VirtualHost *:443>
    ServerName glpi.payo.eus

    DocumentRoot /var/www/glpi/public

    SSLEngine on
    SSLCertificateFile /etc/ssl/glpi/glpi.crt
    SSLCertificateKeyFile /etc/ssl/glpi/glpi.key

    <Directory /var/www/glpi/public>
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/glpi-error.log
    CustomLog ${APACHE_LOG_DIR}/glpi-access.log combined
</VirtualHost>
```

-Aktibatu:

```
sudo a2ensite glpi-ssl.conf
sudo a2enmod rewrite
sudo a2enmod ssl
sudo systemctl restart apache2
sudo systemctl status apache2
```

-DNS-a sortu:

<figure><img src="../.gitbook/assets/image (235).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (236).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (238).png" alt=""><figcaption></figcaption></figure>
