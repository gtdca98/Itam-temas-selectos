Conciencia Global 22/Enero/2014
===================

Agenda
=================
* Descripción general del proyecto
* Suposiciones
* Bases de datos
* Metodología
* Avances de la semana


Descripción general del proyecto
=============================================
¿Qué queremos hacer? 
----------------------

Refutar o corroborar la afirmación del proyecto Noosphere (Princeton) "El comportamiento de nuestra red de fuentes de aleatoriedad está correlacionada con la interconexión de la conciencia humana en una escala global" utilizando la base de eventos mundiales GDELT y la base de datos de números aleatorios que genera y proporciona Noosphere.

Otras preguntas interesantes
---------------------------
* ¿Cuánto dura la anormalidad en la generación de números aleatorios una vez sucedido un evento de influencia mundial?
* ¿Se puede saber si el evento generó una interconexión positiva o negativa de acuerdo a la cuantificación de la anormalidad? (¿hay forma de saber si estamos conectados con pensamientos/emociones positivas o negativas?)



Suposiciones
================
* La manera en la que se recolectan y almacenan los datos tanto en Noosphere como en GDELT es científicamente válida
* La generación de los números aleatorios de Noosphere es científicamente válida
* La anormalidad que se produce en la generación de los números aleatorios al existir un evento con influencia mundial es cuantificable



Bases de Datos
===========================
Noosphere
----------
Proyecto que recolecta 'números aleatorios' generados cada segundo por máquinas (REG, Random Event Generator) que se encuentran en 70 lugares diferentes del mundo. Una vez obtenidos los datos de un día son concentrados en un archivo que luego se vuelve público 2 días después. 


GDELT
-------
Proyecto que recolecta los eventos mundiales (no incluye eventos deportivos, de entretenimiento ni noticias puramente económicas). Genera un archivo al final de cada día (04:00 CST) con un concentrado de los eventos ocurridos en el mundo. Sus fuentes de datos son obtenidos de periódicos y de Google news. 




Metodología
============
Cuando ocurre un evento con influencia mundial (registrado en GDELT) los números aleatorios generados en los dispositivos REG de Noosphere -desde el momento en el que ocurrió el evento hasta **24 horas??** después del evento- debe tener una *anormalidad* que es cuantificable.

* Se escogerán **100??** eventos con trascendencia mundial en los ultimos 10 años (2003 - 2013)
* Se cuantificará la normalidad en la generación de los números aleatorios utilizando momentos en el tiempo en donde no haya eventos de influencia mundial **100??**
* Se cuantificará la anormalidad en la generación de los números aleatorios correspondientes a los 100 eventos seleccionados con trascendencia mundial


Avances
===============
* Creación de script para bajar los archivos de GDELT en Python (cuando reviva!, por ahora un mock que baja un archivo de ftp)
* Creación de script para bajar los archivos de Noosphere en Python (por el momento con los datos que resumen la actividad de todos los REG cada 15 min de algunas fechas de prueba -5 agosto 1998, 6 agosto 1998 solo para corroborar que se bajan)
* Estimación del tamaño de datos a ocupar en Noosphere: Ocupando los datos que registran el conteo de 1s en todos los REC por segundo se obtuvo: por 1 min se tienen 13Kb (approximadamente); queremos recolectar 24 horas de los registros de todos los REG desde el momento en el que ocurrió el evento (1440 min por día), para 100 eventos diferentes --> 2 Gb aproximadamente + 2 Gb de 100 días en donde no haya existido un evento mundial 'relevante' por 24 horas para tener la normalidad.
* Estimación del tamaño de datos de GDEL: Desconocido, el sitio ha estado caído desde el sábado :S

