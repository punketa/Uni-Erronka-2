---
description: 'Jitsi bideokonferentzia zerbitzua ubuntu baten instalatu dugu:'
---

# Jitsi

**-IP-a jarri**

/etc/netplan

sudo cat /etc/netplan/50-cloud-init.yaml

sudo nano /etc/netplan/50-cloud-init.yaml

sudo netplan apply

ip addr

<figure><img src="../.gitbook/assets/unknown (9) (1) (1).png" alt="" width="300"><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/unknown (1) (1) (1) (1).png" alt="" width="563"><figcaption></figcaption></figure>

**-Jitsiarentzako DNS sortu**\


<figure><img src="../.gitbook/assets/unknown (2) (1) (1) (1).png" alt="" width="563"><figcaption></figcaption></figure>

* Principal
* La segunda (ya está marcada)
* Nombre → payojitsi.eus
* No admitir actualizaciones dinámicas
* No admitir actualizaciones dinámicas
* Nuevo HOST (IP-a jarri 192.168.10.11)

\
\


<figure><img src="../.gitbook/assets/unknown (3) (1) (1) (1).png" alt="" width="563"><figcaption></figcaption></figure>

* Nuevo ALIAS

<figure><img src="../.gitbook/assets/unknown (4) (1) (1) (1).png" alt="" width="563"><figcaption></figcaption></figure>

**-Jitsi instalatu:**



* (Lehenik instalatu ssh instalatuta ez badago)

sudo apt update && sudo apt install openssh-server

sudo systemctl enable ssh

sudo systemctl start ssh

sudo systemctl status ssh

en cmd bezero: ssh uni@192.168.10.11



* Orain bai, jitsi instalatu:

sudo hostnamectl set-hostname jitsi.payojitsi.eus

hostname

<figure><img src="../.gitbook/assets/unknown (6) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

sudo nano /etc/hosts

Jarri 127.0.0.1 localhost lerroaren azpian: 192.168.10.11 jitsi.payojitsi.eus

![](<../.gitbook/assets/unknown (5) (1) (1) (1).png>)\


sudo ufw allow OpenSSH

sudo ufw allow 80/tcp

sudo ufw allow 443/tcp

sudo ufw allow 5349/tcp

sudo ufw allow 3478/udp

sudo ufw allow 10000/udp

sudo ufw enable

sudo ufw status

\
![](<../.gitbook/assets/unknown (7) (1) (1) (1).png>)

sudo apt update

sudo apt-add-repository universe

sudo apt update

sudo curl -sL https://prosody.im/files/prosody-debian-packages.key -o /usr/share/keyrings/prosody-debian-packages.key

echo "deb \[signed-by=/usr/share/keyrings/prosody-debian-packages.key] http://packages.prosody.im/debian $(lsb\_release -sc) main" | sudo tee /etc/apt/sources.list.d/prosody-debian-packages.list

sudo apt install lua5.2

sudo apt update

curl -sL https://download.jitsi.org/jitsi-key.gpg.key | sudo sh -c 'gpg --dearmor > /usr/share/keyrings/jitsi-keyring.gpg'

echo "deb \[signed-by=/usr/share/keyrings/jitsi-keyring.gpg] https://download.jitsi.org stable/" | sudo tee /etc/apt/sources.list.d/jitsi-stable.list

sudo apt update

sudo apt install jitsi-meet

<figure><img src="../.gitbook/assets/unknown (8) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

sudo systemctl status jitsi-videobridge2 jicofo prosody nginx

sudo journalctl -u jitsi-videobridge2

Bezeroan: [https://payojitsi.eus](https://payojitsi.eus) edo [https://192.168.10.11](https://payojitsi.eus)

<figure><img src="../.gitbook/assets/unknown (9) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

[https://jitsi.payojitsi.eus/reunion](https://jitsi.payojitsi.eus/reunion)

<figure><img src="../.gitbook/assets/unknown (10) (1).png" alt=""><figcaption></figcaption></figure>
