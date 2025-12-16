# HTTPS

Intranet, glpi eta wordpress orriak https ziurtagiri autofirmatuak dituenez ezin dut pfsenseko ziurtagiriak erabili. Hurrengo erronkan webeen edukia kopiatuko ditut eta ziurtagiriak pfsense bidez egingo ditut.

Erronka honetarako orri web bat sortuko dut https ziurtagiria pfsense bidez emanda:

-Orri sortu bakarrik http-rekin:

sudo mkdir -p /var/www/payotano

​sudo chown -R $USER:$USER /var/www/payotano

\
-Baimenak eman:

sudo chown -R www-data:www-data /var/www/payotano

​sudo chmod -R 755 /var/www/payotano

\
-conf editatu:

sudo nano /etc/apache2/sites-available/payotano.conf

itsatsi hau:

\<VirtualHost \*:80>

&#x20;   ServerName payotano.payo.eus

&#x20;   DocumentRoot /var/www/payotano



&#x20;   \<Directory /var/www/payotano>

&#x20;       Require all granted

&#x20;   \</Directory>

\</VirtualHost>



Index sortu:

sudo nano /var/www/payotano/index.html&#x20;

itsatsi hau:

\<html>

&#x20;\<head>

&#x20;\<title>Ongi etorri nire webera!\</title>

&#x20;\</head>

&#x20;\<body>

&#x20;\<h1>Orri hau pfsense bitartez egindako ziurtagiriarekin eginda dago!\</h1>

&#x20;\</body>

\</html>



-aktibatu:



sudo a2dissite 000-default.conf&#x20;

sudo a2ensite payotano.conf

sudo systemctl restart apache2<br>

-Sortu autoritatea

<figure><img src="../.gitbook/assets/image (251).png" alt=""><figcaption></figcaption></figure>

-Deskargatu autoritatea:

![](<../.gitbook/assets/unknown (90).png>)<br>

-Ziurtagirira sortu:

<figure><img src="../.gitbook/assets/image (252).png" alt=""><figcaption></figcaption></figure>

![](<../.gitbook/assets/unknown (73).png>)



-Bezerotik ssh egin:

sudo mkdir -p /etc/ssl/payotano



-Sortu ziurtagiriaren artxiboa:

sudo nano /etc/ssl/payotano/payotano.crt

-abrir el certificado descargado con notas y pegarlo:

<figure><img src="../.gitbook/assets/image (253).png" alt=""><figcaption></figcaption></figure>



-Sortu ziurtagiriaren artxiboa:

sudo nano /etc/ssl/payotano/payotano.key

-Abrir la key descargado con notas y pegarlo:

<figure><img src="../.gitbook/assets/image (255).png" alt=""><figcaption></figcaption></figure>



-Darle permisos a la key:

sudo chmod 600 /etc/ssl/payotano/payotano.key



-Aktibatu ssl:

sudo a2enmod ssl



-Editatu conf:

sudo nano /etc/apache2/sites-available/payotano-ssl.conf



-Itsatsi:

\<VirtualHost \*:443>

&#x20;   ServerName sisa255.sisa25.lan

&#x20;   DocumentRoot /var/www/sisa255



&#x20;   SSLEngine on

&#x20;   SSLCertificateFile /etc/ssl/sisa255/sisa255.crt

&#x20;   SSLCertificateKeyFile /etc/ssl/sisa255/sisa255.key



&#x20;   \<Directory /var/www/sisa255>

&#x20;       Require all granted

&#x20;   \</Directory>

\</VirtualHost>



-Aktibatu el site:

sudo a2ensite payotano-ssl.conf

sudo systemctl restart apache2

\
DNS:

<figure><img src="../.gitbook/assets/image (256).png" alt=""><figcaption></figcaption></figure>

-En el bezero instalar el certificado de autoridad (elq descargamos de pfsense)

<figure><img src="../.gitbook/assets/image (257).png" alt="" width="276"><figcaption></figcaption></figure>

![](<../.gitbook/assets/unknown (80).png>)<br>

![](<../.gitbook/assets/unknown (81).png>)

![](<../.gitbook/assets/unknown (82).png>)

-En el bezero instalar el certificado del server (elq descargamos de pfsense)

<figure><img src="../.gitbook/assets/image (258).png" alt="" width="270"><figcaption></figcaption></figure>

![](<../.gitbook/assets/unknown (84).png>)

![](<../.gitbook/assets/unknown (85).png>)

![](<../.gitbook/assets/unknown (86).png>)

cerrar chrome volver a abrir y pumba:

No pide nada ni lo mitico de pagina no segura ni nada.

<figure><img src="../.gitbook/assets/image (259).png" alt=""><figcaption></figcaption></figure>



-Si pide redireccion meter esto en el sudo nano /etc/apache2/sites-available/sisa255.conf:\
\
\<VirtualHost \*:80>

&#x20;   ServerName sisa255.sisa25.lan

&#x20;   Redirect permanent / https://sisa255.sisa25.lan/

&#x20;   DocumentRoot /var/www/sisa255

<br>

&#x20;   \<Directory /var/www/sisa255>

&#x20;       Require all granted

&#x20;   \</Directory>

\</VirtualHost>\
<br>

-Si se ha instalado y aun no va pero se ve el certificado:

cambiar la fecha al pfsense en general setup y al ordenador tambien adelantarlo 1 hora ( a veces el pfsense activa el certificado mas tarde):

![](<../.gitbook/assets/unknown (88).png>)

![](<../.gitbook/assets/unknown (89).png>)

<br>
