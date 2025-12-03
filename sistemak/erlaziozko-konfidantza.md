# Erlaziozko Konfidantza

Lehenik domeinuak sortu ditugu. Payo.eus aurreko erronkatik berrerabili dugu eta beste windows server bat sortu dugu Gitano.eus sortzeko.

Bigarren domeinua sortu aurretik, sysprep aplikatu diogu bere SSID aldatzeko.

(fotos de los ssid)

Payo.eus domeinua 192.168.1.0 sarean dago eta Gitano.eus 192.168.10.0 sarean. VPN ezarrita dugunez bi domeinuen artean komunikazioa dago.

(foto de la sare eskema)

(foto de la vpn en pfsense)

(foto del ping)

Beraz, erlaziozko konfidantzarekin jarraitu dezakegu.

-DNS-ak konfiguratu ditugu:

(reenviadores condicionales)

(reenviadores)

-Bietako zerbitzari batean: Dominios y confianza de Active Directory

(fotillo)

-Click derecho encima del server > Propiedades > Confianzas > Nueva > (nombre del otro dominio)

(fotillo poniendo el nombre)

-Confianza de bosque > Bidireccional > Ambos > Administrador (Admin123) > En todo el bosque > En todo el bosque > Si, confirmar la confianza saliente > Si, confirmar la confianza entrante

(fotillo de la relacion)
