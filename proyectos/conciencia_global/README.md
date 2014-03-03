Script de baja de datos de noosphere. 
========================================

Nombre: download_noosphere.py

Se requiere poner en una lista (dates) las fechas que se desean bajar de noosphere como 3 parámetros en formato dd,mm,yyyy; si el mes y/o el día es menor a 10 no es necesario poner un cero antes. Por ejemplo, si se desean bajar los datos de noosphere para los días 23-Dic-1998 y 13-enero-2014 se modificaría la lista dates (que está comentada) con lo siguiente: 

dates = [(23,12,1998), (13,1,2014)]

Esto bajará dos archivos con nombre noosphere_aaaammdd_hhmmss (sin extensión) donde hhmmss se refieren a la hora, minuto y segundo en el que se generó el archivo. Por ejemplo, para las fechas antes mencionadas se generarían los siguientes archivos: 

noosphere_19982312_215212

noosphere_2014131_215313   


Script que prepara los datos obtenidos de noosphere para subirlos a la BD
=======================================================

Nombre: fixing_script.py

Por cada archivo que se haya bajado con el script *download_noosphere.py* este script va formando cadenas que al final generan un script en bash que identifica cuántos eggs reportaron en el archivo, obtiene el promedio de 1s reportados por los eggs en el archivo, reacomodan los datos para dejarlos con 3 columnas: id, fecha, promedio de 1s reportados por todos los eggs en ese día. 

El script generado se llama fixing_scripts.sh que necesita correrse en lína de comandos. 

Script fixing_scripts.sh
-----------------------

Por cada archivo generado con el script *download_noosphere.py* se genera uno con terminación _fixed.csv. Por ejemplo, para las fechas antes mencionadas: 

noosphere_19982312_215212_fixed.csv

noosphere_2014131_215313_fixed.csv 



Script de carga de datos de noosphere a postgres
=============================================

Nombre: bulk_insert_noosphere.py

Este script toma todos los archivos generados por el script *fixing_scripts.sh* y los persiste en la base de datos de postgres que guarda los datos de noosphere. 




