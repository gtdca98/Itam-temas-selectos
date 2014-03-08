Marzo 2014 GTDCA98

Notas MNT_NEO4JDB.sh


El shell realiza dos tareas:

1.- MNT_NEO4JDB.sh realiza una copia de respaldo de la carpeta actual graph.db en la ruta actual agregando un time-stamp favoreciendo el control de versiones. 

2.- MNT_NEO4JDB.sh monta la carpeta graph.db con la base de datos en la ruta de trabajo de Neo4j.

3.- Si desea remontar una versión anterior de la carpeta graph.db realice lo siguiente:
	a) Re-nombrar la carpeta de respaldo retirando el time-stamp. 
           La carpeta que se desea montar debe llamarse graph.db y 
        b) Ejecutar el shell MNT_NEO4JDB.sh. 


