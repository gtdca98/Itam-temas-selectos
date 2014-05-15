#!/bin/sh
####  Transforma la informacion generada en el paso anterior para su analisis en psql con las aristas generadas en paso 5
####  usa como parametro la etiqueta que se desea utilizar
TIPO=$1
 echo "Generando nodos PS a partir del archivo Ontology procesado"
 echo "type:" $TIPO

cat  NM1$TIPO.txt | sed '1,4d' | \
sed 's/[ ]*$//'| sed 's#'"'"'#\\'"'"'#g' | \
awk -F"," -v r=$TIPO  '{printf "%s,%s,%s\n",r, $1,$3}'  > node_PS$TIPO.txt

echo terminado
