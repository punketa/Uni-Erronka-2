# Ustiapen eta post-ustiapen frogak egin eta defentsa neurriak proposatu

### Ustiapenak:

#### FTP:

<figure><img src="../.gitbook/assets/image (11).png" alt=""><figcaption></figcaption></figure>

Zaurgarritasun publikoen datu-basea kontsultatzen dugu:

<figure><img src="../.gitbook/assets/image (20).png" alt=""><figcaption></figcaption></figure>

Baieztatzen da FTP zerbitzuaren bertsioa ez dagoela eguneratuta (vsftpd 2.3.4).

mfsconsole

<figure><img src="../.gitbook/assets/image (12).png" alt=""><figcaption></figcaption></figure>

Exploit-a kargatzen dugu:

<figure><img src="../.gitbook/assets/image (13).png" alt=""><figcaption></figcaption></figure>

Exploit-a exekutatzen dugu:

<figure><img src="../.gitbook/assets/image (15).png" alt=""><figcaption></figcaption></figure>

Ondorioa:

FTP zerbitzua ustiatzen saiatu gara, vsftpd 2.3.4 backdoor ustiapenaren bidez. Zerbitzua bertsio zaurgarri bati dagokio, baina ustiapenak ez du arrakastarik izan. Honek erakusten du zaurgarritasun guztiak ez direla ustiagarriak ingurune guztietan.



#### Samba:

<figure><img src="../.gitbook/assets/image (19).png" alt=""><figcaption></figcaption></figure>

Zaurgarritasun publikoen datu-basea kontsultatzen dugu:

<figure><img src="../.gitbook/assets/image (21).png" alt=""><figcaption></figcaption></figure>

Zaurgarritasun hau ez da bertsio batean oinarritzen, zerbitzuaren konfigurazio txar batean baizik.

msfconsole

Exploit-a kargatu eta exekutatzen dugu:

<figure><img src="../.gitbook/assets/image (17).png" alt=""><figcaption></figcaption></figure>

Arrakasta izan dugu, shell barrura sartu gara:

<figure><img src="../.gitbook/assets/image (18).png" alt=""><figcaption></figcaption></figure>

Ondorioa:

Usermap\_script miaketa erabili dugu konfigurazio eskasaren ondorioz, eta, honi esker, komandoak urrutitik exekutatu ahal izan dugu, aldez aurretik autentifikatu gabe. Horren ondorioz, urruneko shell bat lortu dugu, administratzaile pribilegioekin (root)



### MYSQL:

