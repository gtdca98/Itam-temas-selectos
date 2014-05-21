#!/bin/sh
# genera lista  de insersion de propiedades de  nodos

ls props_*txs* | awk '{print "bash CREATE_NEO4J.sh ", $1 , " > " , "P" substr($1,7,6)  substr($1,16,3) ".out"}' > Ejecuta18.sh

## ejecuta proceso de carga
nohup bash Ejecuta18.sh  > cargaProps.out &


