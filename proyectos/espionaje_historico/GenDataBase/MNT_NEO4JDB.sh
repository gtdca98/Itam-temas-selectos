echo  "Monta base de datos en ruta neo4j"
## respalda la base actual a una version graph.db.yyyymmddhhmmss actual 
res=graph.db.$(date +"%Y%m%d%H%M%S")
echo Archivo en respaldo $res
cp -r /usr/local/Cellar/neo4j/2.0.1/libexec/data/graph.db $res
echo la base de datos actual se respaldo en $res
## copia la carpeta graph.db de base de datos a la ruta de neo4j
cp -r graph.db  /usr/local/Cellar/neo4j/2.0.1/libexec/data/
echo "Carpeta graph.db en ruta, verifique ..."
