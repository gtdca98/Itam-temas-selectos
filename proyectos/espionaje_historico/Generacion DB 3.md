Generación BD Neo4j  Migracion Montaje de Base de datos (c / backup)
=======================================================

La migracion - montaje de una base de datos de Neo4j que originalmente reside en una computadora distinta se resuelve 
con el siguiente procediemiento:

a) Apagar la base neo4j en la compuatadora ORIGEN  ----  neo4j stop

b) Copiar todo el contenido de la base da datos a un pendrive o a cd-r  

----  la base es la carpeta grap.db  ubicada en  /usr/local/Cellar/neo4j/2.0.1/libexec/data/graph.db

c) Apagar la base neo4j en la compuatadora DESTINO  ----  neo4j stop

d) Copiar la carpeta en la misma ubicación en la computadora DESTINO.


IMPORTANTE
-------------

Esta acción destruye todo el contenido en la carpeta graph.db en la computadora DESTINO.

Para resolver esta problematica se ha generado un shell MNT_NEO4JDB.sh  que, 

antes de hacer la copia en la computadora DESTINO, RESPALDA una version (con ID time stamp)

del contenido de la carpeta antes de sobreescribirla.




