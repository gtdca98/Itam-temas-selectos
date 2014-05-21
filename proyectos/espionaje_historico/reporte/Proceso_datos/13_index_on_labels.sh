#!/bin/sh
## Indexa en base a labels mejorando el desempeño en consultas.
## IMPORTANTE al termino del proceso se debe verificar que el poblado de indices sea completo.
## para ello se 
## a) inicia el servidor neo4j start, 
## b) se ingresa neo4-shell
## c) se verifica status de indices con schema  POPULATING = poblandose  ONLINE =  disponible
## d) se detiene el servicio  neo4j stop 

neo4j start
sleep 60
neo4j status

echo  generando listado desde base de datos
neo4j-shell -c "match (n:base) return labels(n), count(n);" > listlabels.txt

sleep 60

neo4j stop
neo4j status

## ajusta lista
cat listlabels.txt | grep  '"' | sed 's/ //g' | cut -d'|' -f2 | sed 's/\[//g' | sed 's/\]//g' | sed 's/\"//g' | tr , '\n' | sort | uniq | grep -v 'base\|agent\|beyond\|event\|place' | awk '{printf "%s%s%s\n","create index on :", $1,"(cve);"}'  >  IndexLabel.sql
echo "schema" >> IndexLabel.sql

sleep 10

bash CREATE_NEO4J.sh  IndexLabel.sql >  idx_lab.out
echo Proceso terminado

