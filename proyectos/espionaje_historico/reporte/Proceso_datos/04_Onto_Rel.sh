#!/bin/sh
#### Extraccion de columnas selectionadas para su tranformacion en edges en el sigiente paso.
#### esta rutina corta tres columnas del archivo ontology para que sean procesadas en la contruccion de Edges. 
#### Parametros, nombre de archivo ontologico y numeros de columnas.
#### 
date >> bitacora.txt
date
Archivo_p=$1
Col_p=$2
Col_q=$3
echo Procesando $Col_p $Col_q  archivo  $Archivo_p  salida R$Col_p$Archivo_p >> bitacora.txt
echo Procesando $Col_p $Col_q  archivo  $Archivo_p  salida R$Col_p$Archivo_p

cut -d, -f1,$Col_p,$Col_q  $Archivo_p.csv | grep -v "NULL" | sed 's/owl#Thing/Thing/g' |  awk -F"," '{gsub(/.*\//,"" ,$1) ; if(NR==1){g=$3;e=$3};if(NR==3){e=$3};m=split($2,arraya,"|"); n=split($3,array,"|"); { for (i=1; i<=n; ++i)  printf "%s,%s,%s,%s,%s,%s\n",  $1 , g, gsub(/.*\//,"" ,array[i]), array[i], e, arraya[i] }}' | cut -d, -f1,2,4,5,6 | sed 's/\"//g' | sed 's/}//g' | sed 's/{//g' | sed '1,4d' |  sed 's/__[1-9],/,/g'  > /home/ubuntu/ontology/Rels/R$Col_p$Archivo_p.txt
date >> bitacora.txt
date 
