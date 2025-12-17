# Erabiltzaileak eta pribilegioak

Lehenik eta behin erabiltzaileak sortu genituen&#x20;

CREATE USER 'adrian'@'%' IDENTIFIED BY 'Admin123';

CREATE USER 'diego'@'%'   IDENTIFIED BY 'Admin123';

CREATE USER 'igor'@'%'    IDENTIFIED BY 'Admin123';

\
Gero rolak sortu genituen

CREATE ROLE irakasleak;

CREATE ROLE ikasleak;

\
Pribilegioak eman genituen roleei&#x20;

GRANT irakasleak TO 'adrian'@'%';

GRANT irakasleak TO 'diego'@'%';

GRANT ikasleak TO 'igor'@'%';



GRANT SELECT\
ON arduino\_db.\*\
TO irakasleak;



SET DEFAULT ROLE irakasleak FOR 'adrian'@'%';

SET DEFAULT ROLE irakasleak FOR 'diego'@'%';

SET DEFAULT ROLE ikasleak FOR 'igor'@'%';

\
Eta bukatzeko komando importanteena "FLUSH PRIVILEGES" egin genuen hau dena probatzeko



