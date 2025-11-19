---
description: 'Datu-basearen instalatzeko pausuak:'
---

# Datu basea instalatu

### MariaDB Ubuntu 24.04.01 instalatu:

sudo apt update

sudo apt install mariadb-server mariadb-client -y

sudo systemctl enable mariadb

sudo systemctl start mariadb

sudo systemctl status mariadb

<figure><img src="../.gitbook/assets/unknown (6) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

sudo mysql\_secure\_installation

**Set root password:** PayoServer

<figure><img src="../.gitbook/assets/unknown (1) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

### Erroreak

Ez da izan errore bat generalean, baina datu basea egiterakoan eta erabiltzaileak sortzerakoan @’localhost’ beharrean @’payo.eus’ jarri dugu. Beraz, erabaki dugu berriz instalatzea MariaDB:

sudo systemctl stop mariadb

sudo apt remove --purge mariadb-server mariadb-client -y

sudo apt autoremove -y

sudo apt autoclean

sudo rm -rf /var/lib/mysql

sudo rm -rf /etc/mysql



### MariaDB localean instalatu

-Aurkitu linka eta deskargatu.

<figure><img src="../.gitbook/assets/unknown (2) (1) (1) (1) (1) (1).png" alt="" width="469"><figcaption></figcaption></figure>

\
