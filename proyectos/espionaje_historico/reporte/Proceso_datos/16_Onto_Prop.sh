#!/bin/sh
#### Extraccion de columnas selectionadas para su tranformacion en propiedades en el sigiente paso.
#### esta rutina corta  columnas del archivo ontology para que sean procesadas en la contruccion de Propiedades. 
#### Parametros, nombre de archivo ontologico y numero de columna.
date >> bitacora.txt
date
Archivo_p=$1
Col_p=$2
echo Procesando $Col_p  archivo  $Archivo_p  salida N$Col_p$Archivo_p.txt >> bitacora.txt
echo Procesando $Col_p  archivo  $Archivo_p  salida N$Col_p$Archivo_p.txt
tipo=`head -3 $Archivo_p.csv | cut -d, -f$Col_p | sed '1,2d'` 
cut -d, -f1,$Col_p  $Archivo_p.csv | grep -v "NULL" | awk -F"," -v t=$tipo '{gsub(/.*\//,"" ,$1) ; if(NR==1){g=$2};lin=""; n=split($2,array,"|"); { for (i=1; i<=n; ++i){gsub(/.*\//,"",array[i]); lin=(lin " " array[i])};{printf "%s,%s,%s,%s\n", $1,g,lin,t} }}' |  sed 's/[\"{}]//g' | sed 's/, /,/g'  |  sed 's/__[1-9],/,/g' > /home/ubuntu/ontology/Props/P$Col_p$Archivo_p.txt 

date >> bitacora.txt
date 

