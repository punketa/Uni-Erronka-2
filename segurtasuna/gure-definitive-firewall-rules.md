# Gure definitive firewall Rules 😎

## PFSENSE 1

WAN

<figure><img src="../.gitbook/assets/image (67).png" alt=""><figcaption></figcaption></figure>

WAN FROGAK:

<figure><img src="../.gitbook/assets/unknown (28).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/unknown (29).png" alt=""><figcaption></figcaption></figure>

LAN (Zerbitzuak)

<figure><img src="../.gitbook/assets/image (68).png" alt=""><figcaption></figcaption></figure>

LAN FROGAK:

-Pings a cada servidor y pcs del 1.0 (debe hacer ping y tiene q poder entrar a intranet)

<figure><img src="../.gitbook/assets/image (88).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (90).png" alt=""><figcaption></figcaption></figure>

-Pings a cada servidor y pcs del 2.0 (no debe hacer pero si debe ver wordpres y jitsi)

<figure><img src="../.gitbook/assets/image (91).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (92).png" alt=""><figcaption></figcaption></figure>



<figure><img src="../.gitbook/assets/image (93).png" alt=""><figcaption></figcaption></figure>

-Pings a cada servidor y pcs del 3.0 (debe hacer ping)

<figure><img src="../.gitbook/assets/image (94).png" alt=""><figcaption></figcaption></figure>

\
-Pings a cada servidor y pcs del 10.0 (debe hacer ping, es logico se tienen q ver para la relacion de confianza y para eso hicimos Peer to Peer)

<figure><img src="../.gitbook/assets/image (97).png" alt=""><figcaption></figcaption></figure>

-Pings a cada servidor y pcs del 71.0 (no debe hacer ping)

<figure><img src="../.gitbook/assets/image (98).png" alt=""><figcaption></figcaption></figure>



-Ping a google.com (no debe hacer ping)\
-Curl https://google.com (debe salir algo de html)\
-nslookup google.com (tiene q buscar la ip)

<figure><img src="../.gitbook/assets/image (99).png" alt=""><figcaption></figcaption></figure>

DMZ

<figure><img src="../.gitbook/assets/image (69).png" alt=""><figcaption></figcaption></figure>

DMZ FROGAK:

-Pings a cada servidor y pcs del 1.0 (no debe hacer ping)

<figure><img src="../.gitbook/assets/image (100).png" alt=""><figcaption></figcaption></figure>

\
-Pings a cada servidor y pcs del 2.0 (debe hacer ping)

<figure><img src="../.gitbook/assets/image (101).png" alt=""><figcaption></figcaption></figure>



-Pings a cada servidor y pcs del 3.0 (no debe hacer ping)

<figure><img src="../.gitbook/assets/image (102).png" alt=""><figcaption></figcaption></figure>

\
-Pings a cada servidor y pcs del 10.0 (debe hacer ping)

<figure><img src="../.gitbook/assets/image (103).png" alt=""><figcaption></figcaption></figure>

\
-Pings a cada servidor y pcs del 71.0 (no debe hacer ping a ninguno quitando al 71.75, al 71.202, 71.214 y al arduino a esos si hace ping por que el wordpress coge datos de la base de datos de adrian (71.202) o si lo hacemos con datos inventado en la base de datos de diego (71.214) , y el codigo de arduino lo tiene Igor y el arduino tambien tiene su propia IP (71.2xx))



\
-Ping a google.com (no debe hacer ping)\
-Curl https://google.com (debe salir algo de html)\
-nslookup google.com (tiene q buscar la ip)

<figure><img src="../.gitbook/assets/image (104).png" alt=""><figcaption></figcaption></figure>



BEZ

<figure><img src="../.gitbook/assets/image (70).png" alt=""><figcaption></figcaption></figure>

BEZ FROGAK:

-Pings a cada servidor y pcs del 1.0 (debe hacer ping)

\
-Pings a cada servidor y pcs del 2.0 (no debe hacer ping)

\
-Pings a cada servidor y pcs del 3.0 (debe hacer ping)

\
-Pings a cada servidor y pcs del 10.0 (no debe hacer ping)

\
-Pings a cada servidor y pcs del 71.0 (no debe hacer ping)

\
-Mirar pfsense, intranet, wordpres, jitsi, dfs etc (deberia entrar a todo menos pfsense, quitando el bezero 3.103 ese bezero es de pruebas para no ir cambiando de makina tol rato)

\
-Mirar si deja entrar a steam, discord o asi (no deberia entrar, tiene los puertos basicos de internet, salta una alerta)

VPN

<figure><img src="../.gitbook/assets/image (71).png" alt=""><figcaption></figcaption></figure>

VPN FROGAK:

<figure><img src="../.gitbook/assets/unknown (28).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/unknown (29).png" alt=""><figcaption></figcaption></figure>
