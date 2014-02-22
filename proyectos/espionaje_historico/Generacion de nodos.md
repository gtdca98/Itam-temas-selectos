Carga de informacion.
=======================

Nodos
--------------

Se presentan los resultados de generacion de nodos en Neo4j.

Archivo fuente *instance_types_es.nt.bz2*  16/02/2014
Herramientas:  *SW  Neo4j*  2.0.1 
               *BASH*  comandos sed, awk, cat, grep
               *MacBookPro* Core i7 8GB RAM HD 750GB SO Maverics


Esquema:

1) Recuperación de archivo: Directamente desde pagina *http://wiki.dbpedia.org/Downloads39*, en 4. Localized Datasets, grupo de información *Mapping-based Types*  columna *es*  tipo *nt*.  

Liga:  http://downloads.dbpedia.org/3.9/es/instance_types_es.nt.bz2 

2) Descompresion *bz2 .dc ....*

3) Ajuste de informacion para script de carga en BASH (Terminal)


echo BEGIN > nodos_book.txt

cut -d" " -f1,3 instance_types_es.nt | sed 's/\///g' | sed 's/<http:es.dbpedia.orgresource//g' | sed 's/<http:dbpedia.orgontology//g' | grep -v "<http:" | sed 's/>//g'|grep "Person" |  awk -F" " '{ printf "%s%s%s%s%s%s%s\n",  "create (NDD", NR,"{ name: '"'"'", $1 , "'"'"' , type:'"'"'", $2 , "'"'"' });" }' >> nodos_book.txt

echo COMMIT >> nodos_book.txt


4) Carga de informaciòn con neo4j-shell  (Terminal)   NEO4J debe estar apagado

cat   nodos_book.txt  | /usr/local/Cellar/neo4j/2.0.1/bin/neo4j-shell -config /usr/local/Cellar/neo4j/2.0.1/libexec/conf/neo4j.properties -path /usr/local/Cellar/neo4j/2.0.1/libexec/data/graph.db








