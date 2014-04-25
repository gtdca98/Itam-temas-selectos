####  Genera nodos usando como parametro la etiqueta que se desea utilizar
TIPO=$1
 echo "Generando nodos a partir del archivo  instance_types_es.nt"
 echo "type:" $TIPO

echo BEGIN > nodos_$TIPO.txt
cut -d" " -f1,3 instance_types_es.nt | grep "/$TIPO>" | sed 's/\///g' |  sed 's#'"'"'#\\'"'"'#g' | sed 's/<http:es.dbpedia.orgresource//g' | sed 's/<http:dbpedia.orgontology//g' | grep -v "<http:" | sed 's/>//g' |  awk -F" " -v r=$TIPO '{ printf "%s%s%s%s%s%s%s%s\n",  "create (NDD", NR,":",r"{ name: '"'"'", $1 , "'"'"' , type:'"'"'", $2 , "'"'"' });" }' >> nodos_$TIPO.txt
echo COMMIT >> nodos_$TIPO.txt

 
