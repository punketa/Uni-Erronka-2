# SFTP/Filezilla

### **Zein zerbitzu erabili dugu?**

SFTP zerbitzua erabili dugu, ssh-rekin ziurtatuta. SFTP bidez fitxategiak transferitzeko zerbitzua konfiguratu dugu, datuen segurtasuna bermatuz. Sarbidea pribatua da, erabiltzaileak autentifikatuz, eta segurtasun-arrazoiengatik FTP publikoa erabiltzea saihestuz. Konexioa FileZilla bidez egiten du bezeroak.

### Erabiltzaileak, taldeak eta baimenak.

<figure><img src="../.gitbook/assets/unknown.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/unknown (1).png" alt=""><figcaption></figcaption></figure>

Hemen baimen batzuk falta dira, prozesua honako hau da erabiltzaile bakoitzarentzat:

sudo chown root:root /home/adrian

sudo chmod 755 /home/adrian

sudo mkdir /home/adrian/igotzeko

sudo chown adrian:payoadmin /home/adrian/igotzeko

sudo chmod 755 /home/adrian/igotzeko

### Instalazioa.

Konfigurazioa editatu:

<figure><img src="../.gitbook/assets/unknown (7).png" alt=""><figcaption></figcaption></figure>

Goiko Subsystem komentatu behar da eta behean zuriz dagoen guztia idatzi behar da:

<figure><img src="../.gitbook/assets/unknown (2).png" alt=""><figcaption></figcaption></figure>

Reboot:

<figure><img src="../.gitbook/assets/unknown (3).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/unknown (8).png" alt=""><figcaption></figcaption></figure>

Bezero batetik sftp saioa hasi:

<figure><img src="../.gitbook/assets/unknown (4).png" alt=""><figcaption></figcaption></figure>

DNS-a konfiguratu:

<figure><img src="../.gitbook/assets/unknown (5).png" alt=""><figcaption></figcaption></figure>

Filezilla client deskargatu eta saioa hasi:

dokumentuak.payo.eus / adrian / pasahitza / 22

<figure><img src="../.gitbook/assets/unknown (6).png" alt=""><figcaption></figcaption></figure>

### Pribatua da?

Bai, saharbidea pribatua da, sartzeko erabiltzailea eta pasahitza behar delako.

### **Ezberdintasuna pribatua eta publikoaren artean.**

* **FTP publikoa**: saharbide librea da, autentikaziorik gabe, pasahitzarik gabe. Ez da hain segurua
* **FTP pribatua**: saharbide mugatua, autentifikazioa behar da. Seguruagoa da.
