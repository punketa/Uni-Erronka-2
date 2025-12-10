# CRON LINUX

Cron tresnaren bidez analisi antirootkit, backup eta auto update bat egin



sudo apt update…

crontrab e barruan:



0 2 \* \* \* /usr/local/bin/scan\_rootkits.sh

Egun guztietan 02:00.



0 3 \* \* \* /usr/local/bin/auto\_update.sh

Egun guztietan 03:00<br>

0 4 \* \* \* /usr/local/bin/backup\_windows.sh

Egun guztietan 04:00

sudo nano erabiliz hemen sartzen gara eta behian jarriko ditugu\
\
&#x20;![](<../.gitbook/assets/unknown (57).png>)

"cron" bidez, Linuxeko antirootkiten aurkako analisiaren automatizazioa SCRIPT

Análisis antirrootkits

![](<../.gitbook/assets/unknown (58).png>)\
\#!/bin/bash

<mark style="color:$success;">// Nahitaezkoa da Linuxek jakin dezan zer lengoaia erabili scripta exekutatzeko</mark>

LOGFILE="/var/log/scan\_rootkits.log"

<mark style="color:$success;">// log-a non gordeko den zehazten du</mark>

/usr/bin/rkhunter --update >> $LOGFILE 2>&1

<mark style="color:$success;">// datu basea eguneratzen du eta dena gordetzen du logfile-an</mark>

/usr/bin/rkhunter --check --skip-keypress >> $LOGFILE 2>&1

<mark style="color:$success;">// analisia egiten duen komandoa da</mark>&#x20;

“rkhunter –check” → eskaneoa egiten du

“ –skip-keypress” → enter ez emateko

<mark style="color:$success;">// irteera guztiak eta erroreak gordetzen ditu</mark>

echo "Ejecutado: $(date)" >> $LOGFILE

<mark style="color:$success;">//data eta ordua jartzen dio log-ari</mark>



Sistemaren eguneraketa automatikoa

![](<../.gitbook/assets/unknown (59).png>)

\
\#!/bin/bash

<mark style="color:$success;">// Nahitaezkoa da Linuxek jakin dezan zer lengoaia erabili scripta exekutatzeko</mark>

LOGFILE="/var/log/auto\_update.log"

<mark style="color:$success;">// log-a non gordeko den zehazten du</mark>

echo "----- Actualización iniciada: $(date) -----" >> $LOGFILE

<mark style="color:$success;">// eguneraketa hasten da eta data eta ordua agertzen da</mark>&#x20;

apt update >> $LOGFILE 2>&1

apt upgrade -y >> $LOGFILE 2>&1

echo "----- Fin de actualización: $(date) -----" >> $LOGFILE



Ejekutatu egin badu edo ez komando honekin ikusi ahal dugu&#x20;

sudo /usr/local/bin/scan\_rootkits.sh\
![](<../.gitbook/assets/image (196).png>)

Eta bestearekin berdina&#x20;

sudo /usr/local/bin/auto\_update.sh

<figure><img src="../.gitbook/assets/image (197).png" alt=""><figcaption></figcaption></figure>

Log artxiboak existitzen edo ez ziurtatzeko

ls -l /var/log/scan\_rootkits.log

ls -l /var/log/auto\_update.log

<figure><img src="../.gitbook/assets/image (198).png" alt=""><figcaption></figcaption></figure>
