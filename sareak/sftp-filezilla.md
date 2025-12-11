# SFTP/VSFTPD

### **Zein zerbitzu erabili ditugu?**

SFTP zerbitzua erabili dugu, ssh-rekin ziurtatuta. SFTP bidez fitxategiak transferitzeko zerbitzua konfiguratu dugu, datuen segurtasuna bermatuz. Sarbidea pribatua da, erabiltzaileak autentifikatuz, eta segurtasun-arrazoiengatik FTP publikoa erabiltzea saihestuz. Konexioa FileZilla bidez egiten du bezeroak.

## SFTP

### Erabiltzaileak, taldeak eta baimenak.

Erabiltzaileak eta taldeak sortu bakoitza bere pasahitzarekin:

<figure><img src="../.gitbook/assets/image (201).png" alt=""><figcaption></figcaption></figure>

Admin taldea guztia ikus dezake, irakasleak ikasleak ikus dezake, ikasleak bakarrik bere karpeta ikus dezake:

<figure><img src="../.gitbook/assets/image (202).png" alt=""><figcaption></figcaption></figure>

Karpetak sortu:

<figure><img src="../.gitbook/assets/image (203).png" alt=""><figcaption></figcaption></figure>

Baimenak karpetei eman:

<figure><img src="../.gitbook/assets/image (204).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (205).png" alt=""><figcaption></figcaption></figure>

Karpeta pertsonalak:

<figure><img src="../.gitbook/assets/image (206).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (207).png" alt=""><figcaption></figcaption></figure>

### Instalazioa.

Konfigurazioa editatu:

<figure><img src="../.gitbook/assets/unknown (7).png" alt=""><figcaption></figcaption></figure>

Goiko Subsystem komentatu behar da eta behean zuriz dagoen guztia idatzi behar da:

<figure><img src="../.gitbook/assets/image (208).png" alt=""><figcaption></figcaption></figure>

Reboot:

<figure><img src="../.gitbook/assets/unknown (3).png" alt=""><figcaption></figcaption></figure>

Bezero batetik sftp saioa hasi:

<figure><img src="../.gitbook/assets/image (209).png" alt=""><figcaption></figcaption></figure>

DNS-a konfiguratu:

<figure><img src="../.gitbook/assets/unknown (5).png" alt=""><figcaption></figcaption></figure>

PFsense barruan 22 portua zabaldu bezeroentzat:

<figure><img src="../.gitbook/assets/image (222).png" alt=""><figcaption></figcaption></figure>

PFsense barruan 22 portua zabaldu lan barruan dagoenentzako:

<figure><img src="../.gitbook/assets/image (224).png" alt=""><figcaption></figcaption></figure>

Filezilla client deskargatu eta saioa hasi:

dokumentuak.payo.eus / adrian / pasahitza / 22

Adrian admin denez, karpeta guztiak ikusi eta editatu dezake.

<figure><img src="../.gitbook/assets/image (210).png" alt=""><figcaption></figcaption></figure>

Joseba irakaslea da, beraz bakarrik irakasle karpetan bere karpeta editatu dezake, admin karpetara ezin da sartu. Ikasle karpetan guztia ikus dezake, eta klasean ere.

<figure><img src="../.gitbook/assets/image (211).png" alt=""><figcaption></figcaption></figure>

Eneko ikaslea da, bakarrik bere karpeta pribatua editatu dezake eta klasea ere. Besteetan ezin du ezer egin.

<figure><img src="../.gitbook/assets/image (212).png" alt=""><figcaption></figcaption></figure>

### Pribatua da?

Bai, saharbidea pribatua da, sartzeko erabiltzailea eta pasahitza behar delako.

### Segurtasunaren aldetik:

Segurtasuna: Saihesten da ikasle batek irakasle edo admin karpetak ikustea.\
Pribatutasuna: Erabiltzaile bakoitzak bere fitxategiak edo fitxategi komuna baino ez du ikusten.\
Erroreak saihestea: Ikasle batek nahi gabe sistemaren beste karpeta bat ezabatzea edo ukitzea.

## VSFTPD

Hemen ftp publiko bat sortu dugu TLS ziurtagiriarekin:

### Instalazioa:

sudo apt update && sudo apt install vsftpd -y

Karpetak sortu:

<figure><img src="../.gitbook/assets/image (213).png" alt=""><figcaption></figcaption></figure>

Ziurtagiriak sortu:&#x20;

```
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/ssl/private/vsftpd.key \
-out /etc/ssl/certs/vsftpd.crt

```

(luego hay q poner los datos de la empresa bla bla bla)

<figure><img src="../.gitbook/assets/image (226).png" alt=""><figcaption></figcaption></figure>

sudo nano /etc/vsftpd.conf

komentatu guztia eta hau itsatsi:

```
listen=YES
listen_ipv6=NO

# FTP PUBLIKO ANONIMO

anonymous_enable=YES
anon_root=/srv/payoftp/publik
o
anon_upload_enable=NO
anon_mkdir_write_enable=NO
anon_other_write_enable=NO

local_enable=NO
write_enable=NO

# FTPS (FTP Seguruago)

ssl_enable=YES
allow_anon_ssl=YES
force_local_data_ssl=NO
force_local_logins_ssl=NO

rsa_cert_file=/etc/ssl/certs/vsftpd.crt
rsa_private_key_file=/etc/ssl/private/vsftpd.key

ssl_tlsv1=YES
ssl_sslv2=NO
ssl_sslv3=NO

# Modo Pasivo (filezillan sartzeko)

pasv_enable=YES
pasv_min_port=21000
pasv_max_port=21010

# Segurtasuna

chroot_local_user=NO
allow_writeable_chroot=YES

xferlog_enable=YES
use_localtime=YES

```

Reboot:

<figure><img src="../.gitbook/assets/image (219).png" alt=""><figcaption></figcaption></figure>

PFsense barruan 22 portua zabaldu bezeroentzat:

<figure><img src="../.gitbook/assets/image (227).png" alt=""><figcaption></figcaption></figure>

PFsense barruan 22 portua zabaldu bezeroentzat:

<figure><img src="../.gitbook/assets/image (228).png" alt=""><figcaption></figcaption></figure>

DNS: eginda dago aurrekoarekin balio du

Filezillan sartu bezeroetatik:

ftp://192.168.2.10 edo dokumentuak.payo.eus /anonymous / pasahitzarik ez / 21

<figure><img src="../.gitbook/assets/image (225).png" alt=""><figcaption></figcaption></figure>

dns-arekin sartu ezkero: (aceptar y palante)&#x20;

<figure><img src="../.gitbook/assets/image (230).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (229).png" alt=""><figcaption></figcaption></figure>

### **Ezberdintasuna pribatua eta publikoaren artean.**

* **FTP publikoa**: saharbide librea da, autentikaziorik gabe, pasahitzarik gabe. Ez da hain segurua
* **FTP pribatua**: saharbide mugatua, autentifikazioa behar da. Seguruagoa da.
