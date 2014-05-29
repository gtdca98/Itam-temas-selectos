echo  "Monta base de datos en ruta neo4j"
## respalda la base actual a una version graph.db.yyyymmddhhmmss actual 
res=graph.db.$(date +"%Y%m%d%H%M%S")
echo Archivo en respaldo $res
cp -r /var/lib/neo4j/data/graph.db $res
echo la base de datos actual se respaldo en $res
## copia la carpeta graph.db de base de datos a la ruta de neo4j
cp -r graph.db  /var/lib/neo4j/data/
echo "Carpeta graph.db en ruta, verifique ..."
<<<<<<< HEAD
=======

>>>>>>> df0b647a2dd2fc893a112418761b06794a139eed
