# Ustiapen eta post-ustiapen frogak

### Zer dira ustiapen eta post-ustiapen faseak?

**Ustiapen fasea:**

Exploitation fasea aldez aurretik identifikatutako ahultasunak erabiltzen duen fasea da, sisteman baimenik gabeko sarbidea lortzeko.

Fase honetan, erasotzaileak zerbitzu edo konfigurazio ahul bat ustiatu egiten du, sisteman sartzeko edo pribilegioak handitzeko helburuarekin. Ustiaketa arrakastatsua bada, sistema konprometituta geratzen da.

**Post-ustiapen fasea:**

Post-exploitation fasea, ustiaketa baten ondoren datorren fasea da. Fase honetan, lortutako sarbidearen eraginaren azterketa egiten da.

Helburua da, lortutako erabiltzailearen pribilegioak egiaztatzea, sistemaren informazioa identifikatzea eta erasotzaile batek sistema barruan zer nolako kontrola izan dezakeen baloratzea.

Fase honek erakusten du ahultasunak benetako arriskua duen ala ez.

### Ustiapenak:

#### FTP:

Bertsioa konprobatu:

<figure><img src="../.gitbook/assets/image (11) (1).png" alt=""><figcaption></figcaption></figure>

Zaurgarritasun publikoen datu-basea kontsultatzen dugu:

<figure><img src="../.gitbook/assets/image (20).png" alt=""><figcaption></figcaption></figure>

Baieztatzen da FTP zerbitzuaren bertsioa ez dagoela eguneratuta (vsftpd 2.3.4).

mfsconsole

<figure><img src="../.gitbook/assets/image (12) (1).png" alt=""><figcaption></figcaption></figure>

Exploit-a kargatzen dugu:

<figure><img src="../.gitbook/assets/image (13) (1).png" alt=""><figcaption></figcaption></figure>

Exploit-a exekutatzen dugu:

<figure><img src="../.gitbook/assets/image (15).png" alt=""><figcaption></figcaption></figure>

Ondorioa:

FTP zerbitzua ustiatzen saiatu gara, vsftpd 2.3.4 backdoor ustiapenaren bidez. Zerbitzua bertsio zaurgarri bati dagokio, baina ustiapenak ez du arrakastarik izan. Honek erakusten du zaurgarritasun guztiak ez direla ustiagarriak ingurune guztietan.



#### Samba:

Bertsioa konprobatu:

<figure><img src="../.gitbook/assets/image (19).png" alt=""><figcaption></figcaption></figure>

Zaurgarritasun publikoen datu-basea kontsultatzen dugu:

<figure><img src="../.gitbook/assets/image (21).png" alt=""><figcaption></figcaption></figure>

Zaurgarritasun hau ez da bertsio batean oinarritzen, zerbitzuaren konfigurazio txar batean baizik.

msfconsole

Exploit-a kargatu eta exekutatzen dugu:

<figure><img src="../.gitbook/assets/image (17).png" alt=""><figcaption></figcaption></figure>

Arrakasta izan dugu, shell barrura sartu gara:

<figure><img src="../.gitbook/assets/image (18).png" alt=""><figcaption></figcaption></figure>

#### Orain FLAG bat ipiniko dugu metasploitablean:

nabegatzailean metasploitablea orria ikus dezakegu:

<figure><img src="../.gitbook/assets/image (1) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (18).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (5) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

Web orrian gure flag-a jartzen dugu:

<figure><img src="../.gitbook/assets/image (8) (1) (1).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (9) (1) (1).png" alt=""><figcaption></figcaption></figure>

Ondorioa:

Usermap\_script miaketa erabili dugu konfigurazio eskasaren ondorioz, eta, honi esker, komandoak urrutitik exekutatu ahal izan dugu, aldez aurretik autentifikatu gabe. Horren ondorioz, urruneko shell bat lortu dugu, administratzaile pribilegioekin (root) eta flag bat ipini diogu metasploitable web orrian.



#### MYSQL:

Bertsioa konprobatu:

<figure><img src="../.gitbook/assets/image (142).png" alt=""><figcaption></figcaption></figure>

Zaurgarritasun publikoen datu-basea kontsultatzen dugu:

<figure><img src="../.gitbook/assets/image (143).png" alt=""><figcaption></figcaption></figure>

MySQL-rekin lotutako ahultasun ugari daude, baina kasu honetan ustiapena zerbitzuaren konfigurazio ez-seguruan oinarrituko gara (root pasahitza gabe)

<figure><img src="../.gitbook/assets/image (144).png" alt=""><figcaption></figcaption></figure>

Saiatu gara mysql-ra sartzen, hau funtzionatuko zuen mysql-k konexio remotoak onartuko baitzuen, baina soilik lokalak onartzen ditu. Beraz, samba bitartez konexioa dugunez bertatik konexioa egiten saiatuko gara:

<figure><img src="../.gitbook/assets/image (145).png" alt=""><figcaption></figcaption></figure>

Ondorioa:&#x20;

Mysql-ra urruneko konexio bat egiten saiatu ondoren, egiaztatu dugu zerbitzuak localhost konexioak baino ez zituela onartzen. Ondoren, Samba bidez root sarbidea lortu ondoren, MySQL zerbitzura localhost bezala sartzen saiatu gara eta root erabiltzaileak autentifikazioa behar duela egiaztatu dugu.



#### Telnet:

Bertsioa konprobatu:

<figure><img src="../.gitbook/assets/image (149).png" alt=""><figcaption></figcaption></figure>

Zaurgarritasun publikoen datu-basea kontsultatzen dugu:

<figure><img src="../.gitbook/assets/image (150).png" alt=""><figcaption></figcaption></figure>

Searchsploit telnet-en emaitzetatik abiatuta, egiaztatu dugu Telnet zaurgarritasun historiko ugari dituen zerbitzua dela. Hala ere, ingurune horretan kredentzialen ahultasunean zentratzea erabaki dugu (defektuzko pasahitzak erabili 😛)

<figure><img src="../.gitbook/assets/image (151).png" alt=""><figcaption></figcaption></figure>

Sartzea lortu dugu!

<figure><img src="../.gitbook/assets/image (152).png" alt=""><figcaption></figcaption></figure>

Ondorioa: Defetuzko kredentzialak (msfadmin/msfadmin) erabiliz sartu gara Telnet zerbitzura, horri esker saioa urruneko moduan hasi ahal izan da sisteman.



#### VNC:

Bertsioa konprobatu:

<figure><img src="../.gitbook/assets/image (10) (1).png" alt=""><figcaption></figcaption></figure>

Zaurgarritasun publikoen datu-basea kontsultatzen dugu:

<figure><img src="../.gitbook/assets/image (1) (1) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

VNC urruneko sarbide-zerbitzu grafikoa da, eta behar bezala babestuta ez badago, sistemaren kontrol osoa ahalbidetzen du.

<figure><img src="../.gitbook/assets/image (2) (1) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

password pasahitza jarri ondoren sartu gara:

<figure><img src="../.gitbook/assets/image (3) (1) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (4) (1) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (5) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (6) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

Sisteman VNC bidez sartu ondoren, mahaigaineko kontrol grafiko osoa lortu dugu, sistema eragilearekin zuzenean elkarreragiteko aukera emanez. Sarbide mota horrek aukera emango lioke erasotzaile bati aplikazioak exekutatzeko, fitxategiak aldatzeko eta informazio sentikorra lortzeko.



Momentuz, zer lortu dugu?

5 ustiapen egin ditugu eta bakarrik hiru izan dute arrakasta.

Honek ez du esan nahi pentesting-a failatu dugula. Prozesua nahiko errealista izan da, beti ez gara guztietara sartuko eta honi esker hainbat informazio baliagarri lortu dugu, horien artean:

Samba: Kontrol guztia lortu dugu root bidez sartzen.

FTP: Zaurgarria da baina ezin da ustiapena egin.

Mysql: Zaurgarria da, bistan dago baina babestuta.

Telnet: Kontrol guztia lortu dugu root erabiltzaile baten bidez sartzen.

VNC: Sistemaren kontrol grafiko osoa.



### Post-ustiapena:

Samba:

Samba zerbitzuaren ustiapen arrakastatsuaren ondoren, administratzaile pribilegioak (root) zituen urruneko shell bat lortu dugu makina zaurgarrian.

Ustiapen fasean, hainbat egiaztapen egin dugu lortutako sarbidearen benetako inpaktua ebaluatzeko.

Lehenik, erabiltzaile konprometituaren pribilegioak egiaztatu ditugu:

Whoami komandoak sarrera root gisa eginez baieztatu da.

<figure><img src="../.gitbook/assets/image (146).png" alt=""><figcaption></figcaption></figure>

ID bidez egiaztatu dugu UID eta GID erabiltzaile administratzaileari dagozkiola (UID 0).

<figure><img src="../.gitbook/assets/image (147).png" alt=""><figcaption></figcaption></figure>

Ondoren, sistema eragilea eta haren bertsioa identifikatu dugu Uname -a komando bitartez, eta Linux sistema deseguneratua dela aipatu zaigu.

<figure><img src="../.gitbook/assets/image (148).png" alt=""><figcaption></figcaption></figure>

Egiaztapen horiek erakusten dute erasotzaileak sistemaren gaineko kontrol osoa duela, eta komando arbitrarioak exekutatu, erabiltzaile lokaleengana jo eta beste barne-zerbitzu batzuk arriskuan jar ditzakeela.

Beraz, ustiatutako ahultasunak eragin kritikoa du, ustiapen bakar batek sistemaren erabateko konpromisoa ahalbidetzen baitu.



Telnet:

Telnet zerbitzuaren bidez sisteman sartu ondoren, msfadmin/msfadmin defektuzko kredentzialak erabiliz, urruneko shell bat lortu dugu makina zaurgarrian

<figure><img src="../.gitbook/assets/image (153).png" alt=""><figcaption></figcaption></figure>

Lehenik, konprometitutako erabiltzailearen baimenak whoami komando bidez egiaztatu dugu:&#x20;

<figure><img src="../.gitbook/assets/image (154).png" alt=""><figcaption></figcaption></figure>

Ondoren, erabiltzailearen pribilegioak ebaluatu ziren eta sudo su erabiliz administrazio-baimenak zituela egiaztatu zen.

<figure><img src="../.gitbook/assets/image (155).png" alt=""><figcaption></figcaption></figure>

eta pasahitz bera sartu (msfadmin), root-pribilegioak zituen shell bat lortu zen, hau da, sistemaren kontrol osoa.

Azkenik, komandoak batzuk exekutatu dugu id eta uname -a sistemaren informazioa biltzeko eta ingurune konprometitua berresteko.

<figure><img src="../.gitbook/assets/image (156).png" alt=""><figcaption></figcaption></figure>

Emaitza honek erakusten du Telnet bezalako zerbitzu ez-seguru batean kredentzial ahulak izatea erasotzaile bati sisteman sartzeko aukera errazten diola, gainera pribilegioak rooteraino igotzeko aukera ere eman diezaioke, makina zaurgarria hainbat arriskuan jarriz.



VNC:

Fase honetan, mahai-gaineko sarbide grafiko osoa eskuratu dugu, sistemarekin zuzenean elkarreraginean aritzeko aukera emanez, erabiltzaile legitimo bat izango balitz bezala.

Ondoren, sistemaren barruan terminal bat ireki dugu eta honako egiaztapenak egin dira:

whoami: sisteman aktibo dagoen erabiltzailea egiaztatzeko

<figure><img src="../.gitbook/assets/image (7) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

Post-exploitation fase honek erakusten du VNC zerbitzuaren bidezko sarbideak erasotzaileari aukera ematen diola: aplikazioak exekutatzeko, fitxategiak ikusi edo aldatzeko, eta sistemaren kontrol grafiko osoa edukitzeko.
