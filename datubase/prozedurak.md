# Prozedurak

Hainbat sententzia izan ditzaketen eragiketa osoak exekutatzea: INSERT, UPDATE, DELETE

DELIMITER \$$

CREATE PROCEDURE datuak\_sartu(

&#x20; IN p\_tem DECIMAL(6,2),

&#x20; IN p\_hez DECIMAL(5,2),

&#x20; IN p\_soi DECIMAL(7,2),

&#x20; IN p\_det ENUM('SI','NO')

)

BEGIN

&#x20; INSERT INTO Datuak (temperatura, hezetasuna, soinua, detektatuta)

&#x20; VALUES (p\_tem, p\_hez, p\_soi, p\_det);

END\$$

\
ADIBIDEA SARTZEKO



Call datuak\_sartu(100, 200, 300, ‘SI’);

![](<../.gitbook/assets/image (78).png>)<br>

Azken x erregistroak erakutsi

Call azken\_er(8);

\
DELIMITER \$$



CREATE OR REPLACE PROCEDURE azken\_er(

&#x20; IN p\_zenbat INT

)

BEGIN

&#x20; SELECT \*

&#x20; FROM Datuak

&#x20; ORDER BY data DESC

&#x20; LIMIT p\_zenbat;

END\$$

DELIMITER ;

![](<../.gitbook/assets/image (81).png>)



Temperatura x baino handiagoa bada&#x20;



CALL temperatura\_altu (25.0);



DELIMITER \$$

CREATE OR REPLACE PROCEDURE temperatura\_altu(

&#x20; IN tmp DECIMAL(6,2)

)

BEGIN

&#x20; SELECT \*

&#x20; FROM Datuak

&#x20; WHERE temperatura > tmp;

END\$$

![](<../.gitbook/assets/image (82).png>)\
\
\
<br>

