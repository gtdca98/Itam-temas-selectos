#!/bin/bash

echo "Cargando información para NEO4J con neo4j-shell"
echo $1

cat  $1  | /usr/local/Cellar/neo4j/2.0.1/bin/neo4j-shell -config /usr/local/Cellar/neo4j/2.0.1/libexec/conf/neo4j.properties -path /usr/local/Cellar/neo4j/2.0.1/libexec/data/graph.db
