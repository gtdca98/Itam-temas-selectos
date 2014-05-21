#!/bin/sh
## Carga Edges en la base de datos

## genera listado de trabajos de carga de Edges a procesar

ls Edges*txs* | awk '{printf "%s%s%s%s%s%s\n%s\n", "bash CREATE_NEO4J.sh " , $1 , " > Edg_",substr(substr($1,length($1)-12,length($1)),1,4),substr($1,length($1)-1,length($1)),".out", "echo "  $1 " procesado"  }'  > ProcB_Edges.sh

## ejecuta proceso de carga
nohup bash ProcB_Edges.sh > carga.out &


