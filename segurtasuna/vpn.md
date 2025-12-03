# VPN



Lehenik openVPN deskargatu behar dugu pfsense bietan.

## Remote Access

Behin openVPN deskargatuta, erabiltzaile bat sortu behar dugu:

<figure><img src="../.gitbook/assets/unknown (22).png" alt=""><figcaption></figcaption></figure>

Gero Autoritatea sortu behar da:

<figure><img src="../.gitbook/assets/unknown (19).png" alt=""><figcaption></figcaption></figure>

Ondoren ziurtagiriak sortu behar dira, erabiltzaileaentzat eta zerbitzariarentzat, sortutako  PayoCA autoritatearekin:

<figure><img src="../.gitbook/assets/image (36).png" alt=""><figcaption></figcaption></figure>

VPN zerbitzaria sortu behar da:

Portua 1194 aukeratu dugu. Remote Access (SSL/TLS + User Auth) izan behar da.

<figure><img src="../.gitbook/assets/image (33).png" alt=""><figcaption></figcaption></figure>

TLS KEY sortu behar du.

Lehen sortutako PayoCA autoritatea aukeratzen dugu. Eta ondoren lehen sortutako zerbitzariaren ziurtagiria ezarri.

<figure><img src="../.gitbook/assets/image (34).png" alt=""><figcaption></figcaption></figure>

Tunnel network bezala 10.0.8.0/24 erabiliko dugu

Eta Local Network gure pfsense barruko aldean dauden sareak izango dira.

<figure><img src="../.gitbook/assets/image (35).png" alt=""><figcaption></figcaption></figure>

Gorde

Firewall rules ezarri:

<figure><img src="../.gitbook/assets/image (38).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (39).png" alt=""><figcaption></figcaption></figure>

Konfigurazioak deskargatu:

<figure><img src="../.gitbook/assets/image (40).png" alt=""><figcaption></figcaption></figure>

Local Network bezala jarri ditugun sareetan openVPN aplikazioa deskargatu eta deskargatutako konfigurazioa ezarri eta erabiltzailearen datuak ezarri:

<figure><img src="../.gitbook/assets/unknown (23).png" alt=""><figcaption></figcaption></figure>

Froga:

<figure><img src="../.gitbook/assets/image (41).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/unknown (25).png" alt=""><figcaption></figcaption></figure>

## PEER TO PEER

### PFSENSE 1

Autoritatea sortu behar da:

<figure><img src="../.gitbook/assets/image (44).png" alt=""><figcaption></figcaption></figure>

Ondoren ziurtagiriak sortu behar dira egoizentzako, sortutako PayotanoCA autoritatearekin:

SedePayo da nagusia eta SedeGitano da bigarren egoitza.

<figure><img src="../.gitbook/assets/image (43).png" alt=""><figcaption></figcaption></figure>

Markatuta daudenak klikatu eta ziurtagariak deskargatuko dira. Horiek gorde gero beste pf-sensera bidali beharko ditugulako.



VPN zerbitzaria sortu behar da:

Portua 1195 aukeratu dugu. Peer to Peer (SSL/TLS) izan behar da.

<figure><img src="../.gitbook/assets/image (45).png" alt=""><figcaption></figcaption></figure>

TLS KEY sortu behar du automatikoki.

Lehen sortutako PayoCA autoritatea aukeratzen dugu. Eta ondoren lehen sortutako zerbitzariaren ziurtagiria ezarri.

<figure><img src="../.gitbook/assets/image (46).png" alt=""><figcaption></figcaption></figure>

Tunnel network bezala 10.0.9.0/24 erabiliko dugu

Eta Local Network gure pfsense barruko aldean dauden sareak izango dira.

Eta Remote Network beste domeinuaren sarea izango da: 192.168.10.0/24

<figure><img src="../.gitbook/assets/image (48).png" alt=""><figcaption></figcaption></figure>

Gorde

<figure><img src="../.gitbook/assets/image (49).png" alt=""><figcaption></figcaption></figure>

Zerbitzaria sortzen denean sartu berriz eta TLS KEY-a kopiatu eta gorde bigarren pfsenserako beharko dugu.

<figure><img src="../.gitbook/assets/image (50).png" alt=""><figcaption></figcaption></figure>

Client Specific Overrides bat sortu behar da, deskripzioa eta common name berdina izan behar dira, eta serverra Peer to Peer -ekoa izan behar da:

<figure><img src="../.gitbook/assets/image (52).png" alt=""><figcaption></figcaption></figure>

Remote Network beste domeinuaren sarearen IP-a da: 192.168.10.0/24

<figure><img src="../.gitbook/assets/image (53).png" alt=""><figcaption></figcaption></figure>

Gorde

<figure><img src="../.gitbook/assets/image (51).png" alt=""><figcaption></figcaption></figure>

Firewall rules ezarri:

<figure><img src="../.gitbook/assets/image (54).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (55).png" alt=""><figcaption></figcaption></figure>

Lehen aipatutako 4 artxiboak bigarren pfsense-ra bidali.



### PFSENSE 2

-Autoritatea importatu:

\*PayotanoCA.crt kopiatu taula horretan\*

<figure><img src="../.gitbook/assets/image (57).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (56).png" alt=""><figcaption></figcaption></figure>

Ziurtagiriak importatu:

Descriptive name beste ziurtagiriaren berdina izan behar da (SedeGitanoCertificado)

\*SedeGitanoCertificado.crt kopiatu certificate data taula horretan\*

\*SedeGitanoCertificado.key kopiatu private key data taula horretan\*

<figure><img src="../.gitbook/assets/image (59).png" alt=""><figcaption></figcaption></figure>

Gorde

<figure><img src="../.gitbook/assets/image (58).png" alt=""><figcaption></figcaption></figure>

Bigarren pfsensen bezeroa sortu behar da:

Portua 1195 aukeratu dugu. Peer to Peer (SSL/TLS) izan behar da.

Host 192.168.71.45 (Lehen pfsense-ko WAN)

<figure><img src="../.gitbook/assets/image (60).png" alt=""><figcaption></figcaption></figure>

Kopiatutako TLS KEY-a kopiatu hemen

<figure><img src="../.gitbook/assets/image (62).png" alt=""><figcaption></figcaption></figure>

Tunnel Network 10.0.9.0/24 genuen hasiera baina ez zuen funtzionatzen, zain gelditzen zen. Nire laguna maitea chatgpt esan dit IP hau kentzeko, hori egin dut eta funtzionatu du.

Remote Network kasu honetan lehen domeinuaren sareak dira. (gogoratu bigarren pfsensean gaudela)

<figure><img src="../.gitbook/assets/image (63).png" alt=""><figcaption></figcaption></figure>

Gorde

Firewall rules ezarri:

<figure><img src="../.gitbook/assets/image (64).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (65).png" alt=""><figcaption></figcaption></figure>

Status:

<figure><img src="../.gitbook/assets/unknown (28).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/unknown (29).png" alt=""><figcaption></figcaption></figure>

Frogak:

-Ping desde payo a gitano:<br>

<figure><img src="../.gitbook/assets/image (66).png" alt=""><figcaption></figcaption></figure>

-Ping desde gitano a payo:

<br>
