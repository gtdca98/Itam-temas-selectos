#!/bin/sh
### Rutina de deteccion  de relaciones a partir de la informacion en los header determina cuales columnas corresponden
### a aristas -relaciones o edges-. Cuando los columnas contiguas se refieren al mismo objeto se asume la existencia de
### una relacion del tipo ontologico en DBPEDIA sujeto - predicado - objeto  
### esta rutina genera las listas que son procesada en la siguiente fase
###  Parametros, nombre de archivo ontologico
date >> bitacora.txt
Archivo_p=$1
echo Generando comandos de extraccion de  $Archivo_p  >> bitacora.txt
echo listas salidas Rel$Archivo_p.pro >> bitacora.txt
echo comandos ListREL$Archivo_p.txt   >> bitacora.txt
tail -4 bitacora.txt
head -1 $Archivo_p.csv | sed 's/"//g' | awk -F"," '{ for (i=2; i<=NF;++i) if($(i-1)~$i) {printf "%s,%s,%s,%s\n", i,i-1,$i, $(i-1) }}' > Rel$Archivo_p.pro 
cut -d, -f1,2 Rel$Archivo_p.pro | awk -F"," -v r=$Archivo_p '{print "bash 04_Onto_Rel.sh ",r, $1,$2}'  > ListREL$Archivo_p.txt
echo Archivos generados...
wc -l ListREL$Archivo_p.txt >> bitacora.txt
tail -1 bitacora.txt
echo
<<<<<<< HEAD

=======
>>>>>>> df0b647a2dd2fc893a112418761b06794a139eed
