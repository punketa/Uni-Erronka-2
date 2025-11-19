---
description: 'Nola sortu dugun datu basea azalduko dugu:'
---

# Datu basea sortu

### MariaDB-n datu basea sortu:

sudo mysql -u root -p

(Komando hauek dira errubrikan eskatzen direnak)



* DB-a sortu:

CREATE DATABASE unipayo;

USE unipayo;

<figure><img src="../.gitbook/assets/unknown (3) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>



* Rolak sortu:

CREATE ROLE 'adminRola', 'irakasleRola', 'ikasleRola';



* Baimenak:

GRANT ALL PRIVILEGES ON unipayo.\* TO 'adminRola';

(Baimen guztiak, dena egin dezan)

<figure><img src="../.gitbook/assets/unknown (4) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

GRANT SELECT, INSERT, UPDATE ON unipayo.notak TO 'irakasleRola';

GRANT SELECT ON unipayo.ikasleak TO 'irakasleRola';

GRANT SELECT ON unipayo.ikasgaiak TO 'irakasleRola';

(Insert baimena, notak jartzeko eta beste tauleetan bakarrik ikusteko)

<figure><img src="../.gitbook/assets/unknown (5) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

GRANT SELECT ON unipayo.ikasle\_notak TO 'ikasleRola';

GRANT SELECT ON unipayo.ikasle\_ikasgaiak TO 'ikasleRola';

(Select baimena bakarrik, taulak soilik ikusteko)

<figure><img src="../.gitbook/assets/unknown (6) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>



* Erabiltzaileak:

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin123';

GRANT 'adminRola' TO 'admin'@'localhost';



CREATE USER 'joseba.lopez'@'localhost' IDENTIFIED BY 'joseba123';

CREATE USER 'yoritz.azpeitia'@'localhost' IDENTIFIED BY 'yoritz123';

GRANT 'irakasleRola' TO 'joseba.lopez'@'localhost', 'yoritz.azpeitia'@'localhost';



CREATE USER 'martin.ander'@'localhost' IDENTIFIED BY 'ander123';

CREATE USER 'saez.eneko'@'localhost' IDENTIFIED BY 'eneko123';

CREATE USER 'petit.iker'@'localhost' IDENTIFIED BY 'iker123';

CREATE USER 'garcia.oier'@'localhost' IDENTIFIED BY 'oier123';

GRANT 'ikasleRola' TO 'martin.ander'@'localhost', 'saez.eneko'@'localhost', 'petit.iker'@'localhost', 'garcia.oier'@'localhost';

SELECT User, Host FROM mysql.user;

<figure><img src="../.gitbook/assets/unknown (7) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>



* Rola ezarri sartzerakoan:

SET ROLE '...Rola';\


Hemen  datu base osoa txt bezala:

{% file src="../.gitbook/assets/unipayov1.docx" %}

Hemen sql bezala por si se sale mal no pienso escribir todo de nuevo:&#x20;

{% file src="../.gitbook/assets/unipayov1.sql" %}

mysql -u root -p < "C:\Users\TuNombre\Desktop\unipayo.sql"



### Adibide batzuk

Hemen irakasle bezala sartuta ikusten dena:

<figure><img src="../.gitbook/assets/unknown (8) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

Hemen ikasle bezala sartuta ikusten dena:

<figure><img src="../.gitbook/assets/unknown (9) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

\
