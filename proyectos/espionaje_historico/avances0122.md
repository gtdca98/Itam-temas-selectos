Espionaje histórico
========================================================
- Proponente: Adolfo De Unánue
- Author: Gabriel del Campo, Alfredo Garbuno, JI García
- Date: 22 de Enero, 2014


Descripción
========================================================
- Palantir tiene filosofías interesantes y muchos productos, en particular analizan datos de muchas fuentes y luego presentan grafos con los cuales infieren cosas. 
  - Debido a su filosofía de *Data Mining/Machine Learning*.
- Haremos lo mismo con Wikipedia. Esa es nuestra base de datos de inteligencia.
- Tiene todo: Lugares, fechas, relaciones, personajes, etc.


Objetivo
========================================================

- Generar grafos que cuenten una historia ¿Es posible usar este tipo de herramientas para explicar eventos futuros?
- ¿Cómo visualizo la información? ¿Cómo la reporto? ¿Cómo cuento la historia?
- ¿La memoria presenta en realidad problemas futuros? 

Tópicos
========================================================
- Information retrival
- Graph analysis
- Visualization
- Storytelling

Estructura de Datos
========================================================
La base de datos, como se ha mencionado previamente, será Wikipedia. Esta fuente de información puede ser descargada a través del repositorio de datos de Wikipedia en conjuntos de archivos denominados *Dumps*.

Actualmente existen ya herramientas de descarga para la base de datos a través de una página de ayuda para los usuarios de Wikipedia a través de Wikimedia en el leguaje deseado *(Posiblemente inglés)*. 

La base de datos se actualiza cada mes para el caso del proyecto en inglés. Para los demás se actualiza con mayor frecuencia. El contenido de dichos *Dumps* se enlista a continuación

- Texto y metadatos en formato XML. 
- La mayoría de las tablas como archivos sql. 
  - Ligas de página a página. 
  - Listas de páginas con ligas fuera del proyecto de wikipedia.
  - Metadatos para archivos multimedia. 
  - Información de cada página. 
  - Los títulos de todas las páginas. 
  - Lista de todas las páginas que son redirecciones y metas. 
  - Información de log. Incluye bloques, protección, eliminación y *uploads*.
- Archivos $$ delta $$ de prueba para actualizaciones.

Tamaño de las descargas
========================================================
Hasta Febrero del año pasado teníamos:
- El archivo XML con sólo las páginas principales, es decir sin páginas de usuario y *talk pages*, pesaba 42987293445 bytes. 
- El archivo con todo 93754003797 bytes. 

Es decir 40.1 Gb y 87.3 Gb respectivamente. 

El histórico tiene 10005676791734 bytes de información. Es decir, 10 Tb's!!!

Áreas de investigación relacionadas
========================================================
* El proyecto se relaciona con conceptos en Adquisición del Conocimiento:
  * Bases de conocimiento (KB): hechos estructurados de la forma _(sujeto, predicado, objeto)_
  * Redes semánticas: definir cosas a partir de sus nexos con otras cosas ![Ejemplo red semántica](http://www.mhhe.com/socscience/intro/ibank/ibank/0086.jpg)
  * Ontologías: definición de cosas por sus atributos; garantiza consistencia, no completitud
* Es importante entender lo siguiente dado que influirá en definir qué información hay que procesar:
  * ¿Qué se ha hecho ya?
  * ¿Qué se puede hacer original (si la intención es publicar)?
  * ¿Cómo puede servir lo que ya se hizo?

Algunos proyectos relacionados
========================================================
* [Wikipedia Miner toolkit](http://www.cs.waikato.ac.nz/~ihw/papers/12-DM-IHW-OStoolkit-wikimining.pdf): conjunto de herramientas Java para consultar dumps arbitrarios de WP: relacionar conceptos, eliminar ambiguedades, etc. 
* [DBpedia](http://wiki.dbpedia.org/Datasets39?v=z2l) Ontologías y KBs derivadas de WP. No es WP puro sino una versión estructurada, basada en buena medida en los infoboxes de WP. No siempre está al día. Algunas ontologias que trae predefinidas: personas, lugares, obras creativas, organizaciones, especies, enfermedades, etc.
* [Yago](http://www.mpi-inf.mpg.de/yago-naga/yago/) KB semántica derivada de Wikipedia, WordNet y GeoNames. Se usa en Watson. 
* [Freebase](https://developers.google.com/freebase/) Ontologias y KB's derivadas de WP estructuradas como grafos. Proyecto patrocinado por Google.


Referencias
========================================================
- http://dumps.wikimedia.org/enwiki/
- http://en.wikipedia.org/wiki/Wikipedia:Database_download#Help_parsing_dumps_for_use_in_scripts
- http://meta.wikimedia.org/wiki/Data_dumps
- http://meta.wikimedia.org/wiki/Data_dumps/Download_tools
- http://meta.wikimedia.org/wiki/Data_dumps/FAQ#How_big_are_the_en_wikipedia_dumps_uncompressed.3F
