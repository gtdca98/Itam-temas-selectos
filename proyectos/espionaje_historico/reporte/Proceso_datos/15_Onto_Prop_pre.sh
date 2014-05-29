#!/bin/sh
### Rutina de deteccion  de propiedades  a partir de la informacion en los header determina cuales columnas corresponden
### a caracteristicas de los nodos . Cuando tres columnas contiguas A B y C  se examinan y se cumple que 
##     A y B no se refieren al mismo objeto y,
##     B y C tampoco se refieren al mismo objeto 
##  se asume que la columna corresponde a una relacion del tipo ontologico en DBPEDIA sujeto - propiedad - valor  
##  esta rutina genera las listas que son procesada en la siguiente fase
##  Parametros, nombre de archivo ontologico
date >> bitacora.txt
Archivo_p=$1
echo Generando comandos de extraccion de  $Archivo_p  >> bitacora.txt
echo listas salidas Prop$Archivo_p.pro >> bitacora.txt
echo comandos ListPROP$Archivo_p.txt   >> bitacora.txt
tail -4 bitacora.txt
head -1 $Archivo_p.csv | sed 's/"//g' | awk -F"," '{ for (i=2; i<NF;++i) if($(i-1)!~$i && $i !~ $(i+1)) {printf "%s,%s,%s,%s,%s,%s\n", i-1, i, i+1, $(i-1),$i, $(i+1) }}'  > Prop$Archivo_p.pro
cut -d, -f2 Prop$Archivo_p.pro | awk -F"," -v r=$Archivo_p '{print "bash  16_Onto_Prop.sh ",r, $1}'  > ListPROP$Archivo_p.txt
echo Archivos generados...
wc -l ListPROP$Archivo_p.txt >> bitacora.txt
tail -1 bitacora.txt
echo

