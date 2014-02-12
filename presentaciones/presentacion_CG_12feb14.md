Conciencia Global
=================

Equipo: Pablo Bosch, Miguel Escalante, Liliana Millán

Objetivo:
---------

Noosphere afirma que existe una 'conciencia global' que se 'sincroniza' cada que existe un evento de influencia 'mundial' y que modifica la generación de 1s aleatorios, queremos comprobar que la afirmación de noosphere es correcta o incorrecta analizando los datos de noosphere. 


Fuente de datos:
-----------------

* Noosphere: noosphere.princeton.edu
* The China Times [http://feeds.feedburner.com/thechinatimes]
* The Local [http://www.thelocal.fr/feeds/rss.php]
* The Moscu Times [http://www.themoscowtimes.com/rss/]
* BBC news [http://feeds.bbci.co.uk/news/rss.xml]
* The New York Times [http://www.nytimes.com/services/xml/rss/index.html]



Avances: 
--------

* Ya tenemos los 100 eventos mundiales 
* Ya tenemos los archivos de noosphere relacionados a estos eventos
* Ya tenemos los archivos de noosphere de otros 100 eventos aleatorios que consideraremos normales
* Ya tenemos acceso a la máquina en amazon donde está el postgres
* Estamos configurando postgres 
* Generamos scripts que nos permiten obtener el promedio de 1s por renglón por archivo (cada archivo tiene un
número diferente de EGGs que reportan los 1s que generaron aleatoreamente) 
* Ya tenemos el diccionario de datos

Lo que sigue:
------------

* Subir los datos a postgres
* Iniciar el análisis de estadística descriptiva 
* Iniciar el análisis de series de tiempo
* Iniciar el script que bajara en automático los eventos que consideramos mundiales con RSS y el módulo
de python para leer rss de los periódicos correspondientes a los 5 países miembros 'fijos' del consejo de 
seguridad de la ONU: China, Francia, Rusia, Reino Unido y Estados Unidos. 

Plan de Trabajo para el 19 de febrero.
============================

* Tener PostgreSQL up and running.
* Conjuntar los scripts de bajada y de carga.
* Meter a un CRON los scripts para que se bajen en automático.

