echo  Limpia los datos de la base de datos NEO4J

rm /usr/local/Cellar/neo4j/2.0.1/libexec/data/graph.db/*
rm /usr/local/Cellar/neo4j/2.0.1/libexec/data/graph.db/schema/label/lucene/*
rm /usr/local/Cellar/neo4j/2.0.1/libexec/data/graph.db/index/*

echo Proceso terminado
