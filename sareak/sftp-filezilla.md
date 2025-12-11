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

### Instalazioa:

sudo apt update && sudo apt install vsftpd -y

Karpetak sortu:

<figure><img src="../.gitbook/assets/image (213).png" alt=""><figcaption></figcaption></figure>

sudo nano /etc/vsftpd.conf

Onartzen dugu ftp anonimoak:

<figure><img src="../.gitbook/assets/image (214).png" alt=""><figcaption></figcaption></figure>

Anonimoak ezin du ezer igo ez karpeta berriak sortu:

<figure><img src="../.gitbook/assets/image (217).png" alt=""><figcaption></figcaption></figure>

Lerro hauek gehitu:

<figure><img src="../.gitbook/assets/image (218).png" alt=""><figcaption></figcaption></figure>

Reboot:

<figure><img src="../.gitbook/assets/image (219).png" alt=""><figcaption></figcaption></figure>

### **Ezberdintasuna pribatua eta publikoaren artean.**

* **FTP publikoa**: saharbide librea da, autentikaziorik gabe, pasahitzarik gabe. Ez da hain segurua
* **FTP pribatua**: saharbide mugatua, autentifikazioa behar da. Seguruagoa da.
