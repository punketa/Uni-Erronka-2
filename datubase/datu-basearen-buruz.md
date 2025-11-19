---
description: 'Datu basearen buruzko informazioa jasoko dugu atal honetan:'
---

# Datu basearen buruz

### Zein datubase erabiliko dugu?

Gure empresaren datuak gordetzeko MariaDB datu-basea erabiltzea aukeratu dugu.

### Zergatik aukeratu dugu MariaDB?

MariaDB WordPresserako aukera onenetako bat da, bateragarritasuna, errendimendua eta Ubuntun erabiltzeko erraztasuna direla eta. MySQL baino handiagoa da optimizazioei eta lizentzia irekiari dagokienez, eta egokiagoa da datu-base erlazional sinple eta eraginkorra behar duten WordPress bezalako aplikazioetarako.\
Horrez gain, datu base honekin lotutako ariketak egin ditugu klasean eta gure enpresa unibertsitatearen zerbitzua ematen duenez uste dugu datu base egokiena dela bere datu estrukturatuak gatik.

Datu base honek ez dauka tamaina handia, ez ditu eskakizun asko hardware aldetik. Bere desabantail handiena bere errendimendua txikia izan daitekela datu base handietan, baina ez da gure kasua.

<figure><img src="../.gitbook/assets/MariaDB_Logo.d8a208f0a889a8f0f0551b8391a065ea79c54f3a.png" alt=""><figcaption></figcaption></figure>

### Zenbat erabiltzaile erabiliko ditugu? Baimenak?

Aipatu dugun bezala, datu asko izango ditugu eta horiek seguru mantendu nahi baditugu, aldez aurretik finkatu behar ditugu zeintzuk izango duten baimenak datu basea editatzeko, ikusteko, ezabatzeko... Atal honetan sartzen dira ROLAK eta ERABILTZAILEAK.

7 erabiltzaile sortuko ditugu: 1 admin / 2 irakasle / 4 ikasle\
Baimenak rolen eta taulen arabera jarri ditugu.

Admin: Baimen guztiak, taula guztietan.\
Erabiltzaile hau nagusiena da, guztia egin dezake, botere guztia bere eskun dago.

Irakasleak: Select, Update eta Insert nota taulan eta besteetan Select.\
Erabiltzaile hauek notak jarri behar dituzte beraz taula hori editatzeko aukera dute. Beesteetan momentuz soilik ikusi.

Ikaslea: Bakarrik Select, notak eta ikasgaietan.\
Erabiltzaile hauek minimoa ikus dezakete. Ez dute zertan datu guztiak ikusi behar, beraz haien ardurako taulak bakarrik ikus dezakete.
