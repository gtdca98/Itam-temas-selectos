#!/bin/sh
####  Genera nodos usando como parametro la etiqueta que se desea utilizar.
####  El proceso utiliza las primeras dos columnas del archivo ontology 
TIPO=$1
 echo "Generando nodos a partir del archivo Ontology procesado"
 echo "type:" $TIPO

cut -d, -f1,2  $TIPO.csv | awk -F"," '{gsub(/.*\//,"" ,$1) ; if(NR==1){g=$2}; n=split($2,array,"|"); { for (i=1; i<=n; ++i)  printf "%s,%s,%s,%s \n",  $1 , g, gsub(/.*\//,"" ,array[i]), array[i] }}' | cut -d, -f1,2,4 | sed 's/\"//g' | sed 's/}//g' | sed 's/{//g' | grep -v ",NULL"  > NM1$TIPO.txt

echo BEGIN > node_Bas$TIPO.txt
cat  NM1$TIPO.txt | sed '1,4d' | \
sed 's/[ ]*$//' | sed 's#'"'"'#\\'"'"'#g' | sort | 
awk -F"," -v r=$TIPO  '{if(NL==1){ant="qaz"};{if($1!=ant){r=tolower(r);ant=$1; if (NL==1){cnt=0;iden=0};{++cnt; {if (cnt==200001){++iden ;cnt=1 ;printf "%s\n%s\n",  "COMMIT","BEGIN"}};{ printf "%s%s%s%s%s%s%s%s\n", "create (N", NR,":",r"{ cve: '"'"'", $1 , "'"'"' , name:'"'"'", $3 , "'"'"' });"}}}}}'  >> node_Bas$TIPO.txt
echo COMMIT >> node_Bas$TIPO.txt

split -l 200002 node_Bas$TIPO.txt  node_Bas$TIPO.txs

ls node_Bas$TIPO.txs* 
echo terminado
