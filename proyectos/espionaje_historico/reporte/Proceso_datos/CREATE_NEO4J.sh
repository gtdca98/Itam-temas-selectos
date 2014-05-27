#!/bin/bash
echo "Cargando información para NEO4J con neo4j-shell"
echo $1
cat $1 | /var/lib/neo4j/bin/neo4j-shell -config /var/lib/neo4j/conf/neo4j.properties -path /var/lib/neo4j/data/graph.db
echo Finalizado verifique salida 
