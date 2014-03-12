Generacion de Base de datos. Aceleracion de carga por indices.  de 125 ms a 5 ms
============


La generacion de la base de datos se beneficia con el uso de indices.

En neo4j existen dos instrucciones que "apuntan - definen" a los nodos antes de ejecutar una consulta.  

*START* 

START n=node(*), m=node(*) where has(n.cve) and has(m.cve) and n.cve='UC020V3A999' and m.cve='PRO000001'  

create (n)-[:VERBO { concepto: 'Descripcion' , valor: 34584 }]->(m);


*MATCH*

MATCH ( n:etiq01 { cve:'UC020V3A999' } ) ,  ( m:etiq02 { cve:'PRO000001' } )  

create (n)-[:VERBO { concepto: 'Descripcion' , valor: 34584 }]->(m);


*COMPARACION*
START hace referencia al auto-indice que se genera en el proceso de carga de información

MATCH utiliza los índices creados por el usuario


*PROCEDIMIENTO*

1) Cargar los nodos  (Usar Neo4j-shell como se indica en otras notas)

2) Generan Indices en Neo4j webadmin  http://localhost:7474/webadmin/#/console/ 

       Ejecutar el comandoo:     create index on :etiqueta(propiedad);

3) Verificar la creacion se usa el comando schema

       El sistema devuelve el status de los indices los cuales están listos para usarse cuando se obtiene ONLINE.

4) Bajar la base de datos    neo4j stop

5) Cargar relaciones  en neo4j-shell usando comandos MATCH.

El proceso se acelera usando MATCH en luagr de START pasando de 125 ms a 5 ms para cada relacion creada.











