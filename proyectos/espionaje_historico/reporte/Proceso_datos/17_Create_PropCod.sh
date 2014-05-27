#!/bin/sh
####  Genera propiedades  usando como parámetro la etiqueta que se desea utilizar
TIPO=$1
j=$2
echo "Generando Propiedades a partir del archivo Ontology procesado"
echo "type:" $TIPO   $j

cat Props/P$j*$TIPO.txt | grep -v "owl#Thing," | grep -v "URI," | grep "XMLSchema#" | sed 's/XMLSchema#//g'| sed 's/-01-01T00:00:00+02:00//g'  |sed 's/rdfschema//g' | awk -F"," '{{if($4=="date"){gsub("-","",$3)}};{if($4=="date" && length($3)>10){$2="L"$2;$4="L"$4}};{gsub("1","",$2);gsub("2","",$2);gsub("3","",$2);gsub("4","",$2);gsub("5","",$2);gsub("6","",$2);gsub("7","",$2);gsub("8","",$2);gsub("9","",$2);gsub("0","",$2);gsub("name","LName",$2);gsub("_label","",$2);gsub("-","",$2);gsub("#","",$2);gsub("%","",$2);gsub("\\$","",$2);gsub("\\(","",$2); gsub("\\)","",$2);gsub(" ","",$2);gsub("\"","",$2);gsub("'"'"'","",$2) };{printf "%s,%s,%s,%s\n", $1, $2, $3,$4}}' | sed 's#'"'"'#\\'"'"'#g' | awk -F"," '$3 !="" ' | sort | uniq  > PropN$j$TIPO.txt
echo Listado general generado

echo  BEGIN > props_$j$TIPO.txt
cat  PropN$j$TIPO.txt | awk -F"," -v r=$TIPO '{r=tolower(r); if (NL==1){cnt=0};{++cnt; {if (cnt==200001){++iden ;cnt=1 ;printf "%s\n%s\n",  "COMMIT","BEGIN"}};{printf "%s%s%s%s%s%s%s%s%s%s\n", "MATCH (n:",r," {cve:'"'"'",$1,"'"'"'","}) SET n.",$2,"='"'"'", $3 , "'"'"';" }}} ' >> props_$j$TIPO.txt
echo COMMIT >> props_$j$TIPO.txt

split -l 200002 props_$j$TIPO.txt  props_$j$TIPO.txs

ls props_$j$TIPO.txs* 

echo proceso terminado
