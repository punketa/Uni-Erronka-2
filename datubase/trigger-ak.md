# Trigger-ak

Trg\_datuak\_before\_insert

Temperatura negatiboa edo data arduino ez baldin badu bidaltzen “NOW” jarriko du

DELIMITER \$$



CREATE TRIGGER trg\_datuak\_before\_insert

BEFORE INSERT ON Datuak

FOR EACH ROW

BEGIN

&#x20; SET NEW.data = COALESCE(NEW.data, NOW());

&#x20; IF NEW.temperatura IS NOT NULL AND NEW.temperatura < 0 THEN

&#x20;   SIGNAL SQLSTATE '45000'

&#x20;     SET MESSAGE\_TEXT = 'La temperatura no puede ser negativa';

&#x20; END IF;

END\$$



DELIMITER ;



AFTER INSERT (LOG)

Historikoa edo kutxa beltz bat bezalakoa da, backup bezela.

\
DELIMITER \$$<br>

CREATE TRIGGER trg\_datuak\_after\_insert\_log

AFTER INSERT ON Datuak

FOR EACH ROW

BEGIN

&#x20; INSERT INTO LogDatuak (datuak\_id, accion, temperatura, hezetasuna, soinua, detektatuta)

&#x20; VALUES (NEW.id, 'INSERT', NEW.temperatura, NEW.hezetasuna, NEW.soinua, NEW.detektatuta);

END\$$<br>

DELIMITER ;



Trg\_datuak\_before\_update\
\
Update bat egin ondoren ejekutatzen da lehendik dagoen ilara bat eguneratu aurretik

DELIMITER \$$



CREATE TRIGGER trg\_datuak\_before\_update

BEFORE UPDATE ON Datuak

FOR EACH ROW

BEGIN

&#x20; IF NEW.temperatura IS NOT NULL AND NEW.temperatura < 0 THEN

&#x20;   SIGNAL SQLSTATE '45000'

&#x20;     SET MESSAGE\_TEXT = 'La temperatura no puede ser negativa';

&#x20; END IF;<br>

&#x20; IF NEW.soinua IS NOT NULL THEN

&#x20;   IF NEW.soinua > 40.0 THEN

&#x20;     SET NEW.detektatuta = 'SI';

&#x20;   ELSE

&#x20;     SET NEW.detektatuta = 'NO';

&#x20;   END IF;

&#x20; END IF;

END\$$



DELIMITER ;



Datu basean triggerrak ikusteko hainbat komando bilatu ditut, batzuekin oso txarto ikusten delako eta hauekin bisualagoa da eta errazagoa irakurtzeko



Trigger-ak hobeto ikusteko (txukunago)<br>

SHOW TRIGGERS \G

SHOW CREATE TRIGGER trg\_datuak\_before\_insert \G

"trg\_datuak\_before\_insert" hemen trigger-en izena jartzerakoan bakarrik agertuko zaizu hori, beste "show triggers"-ekin guztiak aterako dira\
![](<../.gitbook/assets/image (83).png>)

















ADIBIDEZ\
<br>
