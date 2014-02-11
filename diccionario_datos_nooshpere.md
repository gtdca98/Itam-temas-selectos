Diccionario de datos de noosphere
===================================


Cada archivo bajado de noosphere tiene el nombre noosphere_añomesdia_horaenquesebajoelarchivo donde añomesdia
corresponde al año mes y día al que pertenecen los datos de noosphere y que contiene 24 horas de la generación de números aleatorios. 


Cada archivo contiene los siguientes datos: 

* El quinto renglón indica cuántos EGG reportan en este archivo
* El sexto renglón indica la fecha y hora de inicio de este archivo
* El séptimo renglón indica la fecha y hora finales de este archivo (24 horas para todos los archivos)
* El octavo renglón indica cuántos registros de lecturas contiene el archivo (1 registro por cada segundo)
* El noveno renglón indica los id de cada EGG que reporta en el archivo (debe coincidir el número de id's con el número reportado en el quinto renglón)
* Del registro 10 en adelante se encuentra el número de 1s generado por EGG en cada segundo. 

Dentro de cada registro (del renglón 10 en adelante) cada variable es: 
* primer variable: un 13 que indica que el registro corresponde al número de 1s registrados por cada EGG 
* segunda variable: id del registro **(int)**
* tercer variable: fecha y hora correspondiente al registro **(timestamp)**
* cuarta variable: número de 1s generado por el primer EGG (cuyo ID corresponde al primer registro que se encuentra en el renglón 9) **(int)**
* n variable: número de 1s generado por el enésimo EGG (cuyo ID corresponde al enésimo registro que se encuentra en el renglón 10) **(int)**


Diccionario de datos para POSTGRES
===================================

Todos los archivos tienen 3 variables por registro: 

* id del renglón **varchar**
* fecha y hora correspondiene a los números aleatorios que se reportan en ese registro **timesamp**
* promedio de los 1s generados aleatoreamente de los EGG que reportan en ese archivo **float**



