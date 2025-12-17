# Erlaziozko Konfidantza

Lehenik domeinuak sortu ditugu. Payo.eus aurreko erronkatik berrerabili dugu eta beste windows server bat sortu dugu Gitano.eus sortzeko.

Bigarren domeinua sortu aurretik, sysprep aplikatu diogu bere SSID aldatzeko.

Payo.eus domeinua 192.168.1.0 sarean dago eta Gitano.eus 192.168.10.0 sarean. VPN ezarrita dugunez bi domeinuen artean komunikazioa dago.

<figure><img src="../.gitbook/assets/image (7).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (1).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (5).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (6).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (4) (1).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image.png" alt=""><figcaption></figcaption></figure>

Beraz, erlaziozko konfidantzarekin jarraitu dezakegu.

-DNS-ak konfiguratu ditugu:

<figure><img src="../.gitbook/assets/image (4).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (2).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (1) (1).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (3).png" alt=""><figcaption></figcaption></figure>

-Bietako zerbitzari batean: Dominios y confianza de Active Directory

-Click derecho encima del server > Propiedades > Confianzas > Nueva > (nombre del otro dominio)

<figure><img src="../.gitbook/assets/image (3) (1).png" alt=""><figcaption></figcaption></figure>

-Confianza de bosque > Bidireccional > Ambos > Administrador (Admin123) > En todo el bosque > En todo el bosque > Si, confirmar la confianza saliente > Si, confirmar la confianza entrante

<figure><img src="../.gitbook/assets/image (2) (1).png" alt=""><figcaption></figcaption></figure>

