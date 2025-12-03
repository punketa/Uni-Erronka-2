# Funtzioak

Balio bakarra kalkulatzea eta itzultzea

Azken temp erakutsi



SELECT azken\_tmp();



DELIMITER \$$

CREATE FUNCTION azken\_tmp()

RETURNS DECIMAL(6,2)

DETERMINISTIC

BEGIN

&#x20; DECLARE lstmp DECIMAL(6,2) DEFAULT NULL;

&#x20; SELECT temperatura INTO lstmp

&#x20;   FROM Datuak

&#x20;   WHERE temperatura IS NOT NULL

&#x20;   ORDER BY data DESC

&#x20;   LIMIT 1;

&#x20; RETURN lstmp;

END\$$

DELIMITER ;

![](<../.gitbook/assets/image (75).png>)



Bataz besteko azken 10 temperatura atera



SELECT bb\_azkentmp(10);



DELIMITER \$$

CREATE FUNCTION bb\_azkentmp(n INT)

RETURNS DECIMAL(6,2)

DETERMINISTIC

BEGIN

&#x20; DECLARE tmp DECIMAL(6,2) DEFAULT NULL;

&#x20; SELECT AVG(temperatura) INTO tmp

&#x20;   FROM (

&#x20;     SELECT temperatura

&#x20;     FROM Datuak

&#x20;     WHERE temperatura IS NOT NULL

&#x20;     ORDER BY data DESC

&#x20;     LIMIT n

&#x20;   ) AS subtmp;

&#x20; RETURN tmp;

END\$$

![](<../.gitbook/assets/image (76).png>)<br>

Bueltatzen du soinu altuena azken 24 orduetan

Select soinu\_max();

\
DELIMITER \$$

CREATE OR REPLACE FUNCTION soinu\_max()

RETURNS DECIMAL(7,2)

DETERMINISTIC

BEGIN

&#x20; DECLARE snd DECIMAL(7,2);

&#x20; SELECT MAX(soinua) INTO snd

&#x20; FROM Datuak

&#x20; WHERE soinua IS NOT NULL;

&#x20; RETURN snd;

END\$$

![](<../.gitbook/assets/image (77).png>)\
\
\
\
<br>
