# Bistak

Kontsulta konplexuak sinplifikatzeko erabiliko ditugu bistak

\
Bista azken 20 datuak ikusteko → SELECT \* FROM azken20;

CREATE OR REPLACE VIEW azken20 AS

SELECT \*

FROM Datuak

ORDER BY data DESC

LIMIT 20;



![](<../.gitbook/assets/image (72).png>)



Azken 10 datuetako batazbestekoa atera → SELECT \* FROM azken10\_bb;

CREATE OR REPLACE VIEW azken10\_bb AS

SELECT&#x20;

&#x20;   AVG(temperatura) AS bb\_temperatura,

&#x20;   AVG(hezetasuna)  AS bb\_hezetasuna,

&#x20;   AVG(soinua)      AS bb\_soinua

FROM (

&#x20;   SELECT \*

&#x20;   FROM Datuak

&#x20;   ORDER BY data DESC

&#x20;   LIMIT 10

) AS t;

\
![](<../.gitbook/assets/image (73).png>)

Mugimendua detektatzen duenean “SI” jarriko du → SELECT \* FROM mugimendu\_alerta;

CREATE OR REPLACE VIEW mugimendu\_alerta AS

SELECT \*

FROM Datuak

WHERE detektatuta= 'SI'

ORDER BY data DESC;

![](<../.gitbook/assets/image (74).png>)\
\
\
<br>
