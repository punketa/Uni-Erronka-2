# GLPI

-Deskargatu eta karpetan sartu:

```
sudo apt update
sudo apt install -y apache2 mariadb-server php php-mysql php-xml php-curl php-gd php-imap php-mbstring php-zip php-intl php-ldap php-bz2 php-apcu php-opcache
sudo systemctl restart apache2
cd /tmp
wget https://github.com/glpi-project/glpi/releases/latest/download/glpi.tgz
tar -xzf glpi.tgz
sudo mv glpi /var/www/glpi
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

-Datu basea sortu:

```
sudo mysql -u root -p

CREATE DATABASE glpi CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE USER 'glpiadmin'@'localhost' IDENTIFIED BY 'Admin123';

GRANT ALL PRIVILEGES ON glpi.* TO 'glpiadmin'@'localhost';

FLUSH PRIVILEGES;
EXIT;
```

-hmm aqui dio un error raruno, ponia q faltaba un archivo, asi q lo creamos:

```
sudo nano /var/www/glpi/public/.htaccess

<IfModule mod_rewrite.c>
    RewriteEngine On

    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d

    RewriteRule ^ index.php [QSA,L]
</IfModule>

sudo chown www-data:www-data /var/www/glpi/public/.htaccess
sudo chmod 644 /var/www/glpi/public/.htaccess

sudo systemctl restart apache2
```

-DNS-a sortu:

<figure><img src="../.gitbook/assets/image (235).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (236).png" alt=""><figcaption></figcaption></figure>

-GLPI konfiguratu:

-Aceptar los terminos

-Datubasearen datuak sartu:&#x20;

localhost

glpiadmin

Admin123

-Seleccionar base de datos: glpi

-Luego de aceptar algunas cosas mas sale la web de iniciar sesion:

user: glpi

contra: glpi

![](<../.gitbook/assets/unknown (60).png>)

-PIDE CAMBIAR LAS CONTRASEÑAS Y LES PUSE:&#x20;

Todos tienen como contraseña Admin123 menos el usuario normal q tiene Normal123

-Luego pide borrar el install de ubuntu:&#x20;

sudo rm -rf /var/www/glpi/install

-Tambien pide activar las cookies en modo seguro o algo asi:

php -i | grep "Loaded Configuration File"

dara algo asi: /etc/php/8.3/apache2/php.ini

-y hay q poner dependiendo de la version de apache:&#x20;

sudo nano /etc/php/8.3/apache2/php.ini

-ctrl + w y buscar: session.cookie\_secure

y ponerlo en on: session.cookie\_secure = On

![](<../.gitbook/assets/unknown (61).png>)

ctrl + w y buscar: session.cookie\_httponly

y ponerlo en on: session.cookie\_httponly = On

![](<../.gitbook/assets/unknown (62).png>)

sudo systemctl restart apache2

<figure><img src="../.gitbook/assets/image (238).png" alt=""><figcaption></figcaption></figure>

-Ordenagailuak gehitzeko eskuz jarri ditugu. Glpi plugina inbentarioa egiteko ez zelako "bateragarri" gure glpi-aren bertsioarekin.<br>
