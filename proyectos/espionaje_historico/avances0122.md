Espionaje histórico
========================================================
- Proponente: Adolfo De Unánue
- Author: Gabriel del Campo, Alfredo Garbuno, JI García
- Date: 22 de Enero, 2014
font-import: http://fonts.googleapis.com/css?family=Risque
font-family: 'Risque'


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

Actualmente existen ya herramientas de descarga para la base de datos a través de una página de ayuda para los usuarios de Wikipedia a través de Wikimedia en el leguaje deseado *(Posiblemente inglés)*. http://meta.wikimedia.org/wiki/Data_dumps/Download_tools.

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
- Archivos $$ \delta $$ de prueba para actualizaciones.
