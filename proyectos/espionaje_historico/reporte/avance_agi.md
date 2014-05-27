
Reporte de Proyecto de Minería de Datos
=====================================================

**Alfredo Garbuno Iñigo**

**José Iván García Rosales**

**Gabriel Tadeo del Campo Aceves**

## Introducción
La motivación de este proyecto se deriva de [Palantir](http://www.palantir.com/) una organización que se especializa en el análisis de información recolectada de distintas fuentes y presentada con grafos. Esto con el fin de poder mejorar la capacidad tanto predictiva como analítica de sus especialistas.  

En este contexto surge la idea tanto de analizar información de manera gráfica como de estructurarla en forma de grafo. La fuente de información será la enciclopedia en línea Wikipedia y buscaremos patrones muy particulares para cada tema de interés para el usuario. 

## Problema de Negocio
El problema que se quiere atacar es el de buscar relaciones en la información de la enciclopedia que sirva para trazar patrones, predicciones o semejanza entre distintos objetos de estudio para un usuario. Es decir, dada la solicitud del usuario definida como un conjunto de temas, lo que se quiere es proveer de una visualización que permita trazar relaciones entre los distintos temas. Para esto se utilizará la Wikipedia completa y se aprovechará la estructura que presentan los documentos de la enciclopedia para encontrar dichas relaciones. 

En este sentido será necesario realizar un análisis semantico del contenido de cada documento de *Wikipedia* para poder determinar propiedades útiles de cada uno. La relación establecida a través de los hipervínculos de las páginas *web* de los temas serán útiles para poder trazar las relaciones entre temas de manera que queden expresadas en un grafo, para posteriormente pasar a un análisis propio de Aprendizaje Automático para poder realizar las estimaciones apropiadas y obtener un subgrafo que permita al usuario entender mejor su conjunto de temas.

El proyecto consiste en tres grandes fases. 
  * Obtención y transformación de los datos.
  * Carga y exploración en una base de datos adecuada.
  * Explotación y visualización de la información bajo modelos de minería de datos en grafos.

Por simplicidad y dado el trabajo y esfuerzo que se ha recibido el proyecto de *DBpedia* se consideró tomar esto como fuente de datos. Entendiendo las ventajas y desventajas de dicho proyecto. Es por esto que la primera fase del proyecto se reduce a considerar al proyecto de *DBpedia* como fuente de información y analizar la capacidad necesaria en nuestra base de datos. 

En un siguiente paso se ha determinado que la base de datos mas adecuada para poder albergar la información de dicha fuente será `Neo4j`. Dicha base de datos orientada a gráficas la cual posee tanto una estructura como un lenguaje de consultas que resultan ser mas adecuados a los propósitos de este proyecto.

Para la exploración y visualización se consideraron diversas herramientas que en un principio prometían ser capaces de conectarse a la base de datos. Al final utilizamos como motor de análisis el paquete estadístico `R`, en particular la biblioteca `igraph` diseñada para el análisis de redes. Para el despliegue de gráfos resultó atractiva su conectividad con la librería de javascript `d3.js`. Otro factor que afectó la decisión por optar por `R` fue la librería  `shiny` que permite desplegar una interfaz web interactiva con la cual se pueden manipular los datos y desplegar reportes.

## Fuentes de Datos
Como se ha mencionado previamente la información originalmente se pretendía descargar de los repositorios de *Wikipedia*. Los cuales se distribuyen en *dumps*. Estos archivos previamente se encontraban en formato sql. Sin embargo a partir del 2005 fueron reestructarados para manejarse en XML's. En términos globales la información vigente contenida en los *dumps* de *Wikipedia* febrero de 2013 consistía en alrededor de 40 GBs de memoria, sin incluir información de usuarios e histórico de charlas. La historia completa pesaba alrededor de 10 Tb de información. Dichos archivos están disponibles en formato .bz2 debido a que es el formato mas estable y fácil de verificar su integridad en las transacciones. 

Sin embargo existen ya varios proyectos que han trabajado con la información de *Wikipedia*. Esto es para poder brindar estructura a información que naturalmente no es estructurada. Dichos proyectos se basan principalmente en técnicas de procesamiento de lenguaje natural, NLP por sus siglas en inglés. Dentro de estos proyectos destacan `Freebase`, `Yago` y `DBpedia`. Las diferencias radican en los objetivos, fuentes y esquemas con los que trabaja cada uno de estos dos proyectos. En particular `Freebase` destaca por utilizar información de otras fuentes de tal forma que puedan complementar lo que se logra extraer de los archivos de *Wikipedia*. Sin embargo el proyecto de `DBpedia` es un proyecto que recibe apoyo económico de varias organizaciones y `Freebase` es un proyecto financiado por *Google*. Esto hace mas atractivo utilizar la base de datos de `DBpedia` pues principalmente su desarrollo corre gracias a *software* abierto. Por ejemplo, los datos de `Freebase` se guardan en un repositorio privado mientras que los datos de `DBpedia` se encuentran en repositorios de terceros. De manera equivalente el lenguaje utilizado para poder explotar de manera directa los datos es a través de un *endpoint* de SPARQL en cuanto a `DBpedia` y a través del API MQL propio del equipo de desarrollo de `Freebase`. 

Particularmente `DBpedia` construye su información a través de los metadatos de los archivos de *Wikipedia* como son ciertas propiedades o etiquetas. Incluso hereda de *Wikipedia* la estructura de ligas entre artículos de la enciclopedia lo cual genera de manera natural los nodos y arcos que se necesitan definir en grafo. En la manera en que se guarda la información en los repositorios de `DBpedia` es a través de tripletas. Donde la primera entrada define el sujeto, la segunda el verbo y por último el predicado. De tal forma que podemos observar diversos patrones como por ejemplo

```
sujeto_1  tipo_propiedad_j  valor_propiedad_k
```
Donde se lee que el individuo *i* tiene la propiedad *j* con el valor *k*. Sin embargo dicha construcción también sirve para hablar de las ligas entre los nodos. Como son 
```
sujeto_1 ligado_a sujeto_2
```
Donde de manera análoga se pueden establecer las relaciones entre los artículos de la enciclopedia. Por otro lado, un punto a favor del proyecto de `DBpedia` es la incorporación de los datos contenidos en los *infoboxes* en la construcción ontológica de las tuplas. 

De esta manera tenemos que la información obtenida directamente del proyecto de `DBpedia` esta construida a partir de conceptos simples y sus unidades de información quedan estructuradas de la siguiente forma:
* Cada elemento (Sujeto)  es diferenciable a través de su URI, y por él se puede identificar su fuente. El URI (Uniform Resource Identifier) está formado por la integración de dos elementos URL (Uniform Resource Locator) y URN (Uniform Resource Name)
*  Existen datos – denominados Propiedades – y representan información que otorga atributos a los sujetos 
* Se cuenta con elementos de análisis que reflejan la relación o enlace entre dos sujetos, estos se denominan  Predicados. 
* Dadas estos elementos es posible identificar dos tipos de información ontológica fundamental

```
a) Sujeto – Propiedad - Valor
```
Cada elemento de análisis esta clasificado en un árbol de categorías y dentro de la categoría posee propiedades que lo distinguen.

```
S= <http://dbpedia.org/resource/Alabama>   
C= <http://dbpedia.org/ontology/areaTotal>      
P= "1.35765E11"^^<http://www.w3.org/2001/XMLSchema#double>    
```
```
b) Sujeto – Predicado – Objeto
```
Los sujetos tienen relaciones (actos) sobre Objetos los cuales corresponden a su vez a otros sujetos.

```
S= <http://dbpedia.org/resource/Aristotle>    
P= <http://dbpedia.org/ontology/influencedBy>     
O= <http://dbpedia.org/resource/Heraclitus>   
```

¿Cómo se va a manejar la información de `DBpedia`? El análisis se realizará de manera local, en lugar de solicitar información al desarrollador o a tercero es importante la consideración de una base de datos capaz de lidiar con datos con estructura de Grafos. Dentro de las posibles soluciones al problema se encuentran Neo4j, Titan, OrientDB o ElasticSearch. Dentro de estas opciones, la base de datos más utilizada es [Neo4j](http://db-engines.com/en/ranking/graph+dbms) seguida de Titan u OrientDB. Por otro lado ElasticSearch parece ser una base de datos que no parece haber sido desarrollada para tratar con datos de esta naturaleza. Dentro de las fortalezas de Neo4j sobre las demás es que su versión individual es de acceso libre, por otro lado es fácilmente escalable a través de la versión corporativa. Es una base de datos fácilmente manejable a través de Java. Se pueden crear índices tanto en nodos y propiedades como en los arcos mismos de la gráfica. De igual forma incluye un dashboard que puede ser consultado de manera local o vía remota en un explorador dónde se pueden realizar tareas de mantenimiento y/o consulta. Por último, `cypher` el lenguaje con el que se realizan consultas a la base es muy similar al SQL sin embargo es muy sencillo de aprender y hay tutoriales sobre éste en la página oficial. 

##Base de datos. Neo4j
Los requerimientos de información para la integración de datos en Neo4j que debemos tomar en cuenta son:  

*	Los nodos deben estar asociados a una clave única diferenciadora. Durante el proceso de carga Neo4j asigna un número de nodo (consecutivo irrepetible) a cada elemento que se integra con independencia que el valor asociado ya se encuentre registrado previamente. A partir de la versión 2.0 es posible asignar llaves propias de indización.
*	Adicionalmente,  los nodos reciben la asignación de propiedades que a su vez son base  en la definición de consultas.
*	Un conjunto de nodos previamente constituidos pueden asociarse a categorías que segmentan la información por tipo. Estas categorías también llegan a integrar  índices de consulta.
*	Los arcos (dirigidos o no)– denominados relaciones en Neo4j – poseen: un identificador numérico, dado por el sistema, una etiqueta asociada que ‘verbaliza’ la relación  y de forma opcional reciben la asignación de propiedades del mismo modo que los nodos. 
*	Todo elemento de carga debe efectuarse indicando inequívocamente el nodo al cual se asigna la propiedad, etiqueta o relación.


**Formato de datos**    
La información de `DBpedia` como hemos mencionado anteriormane es producto de un proyecto de extracción de contenido de Wikipedia. Sus fuentes se encuentran disponibles en dos formatos generales: Listado y Bases Ontológicas. 

* *Listados.* Reflejan la relación ontológica (S- Pr -V o S-P-O). Constituidos por tripletas en diversos idiomas y segmentados por formatos de contenido (imágenes, textos, enlace..) 
* *Bases ontológicas.* Conjuntos de información donde la relación muestra los Sujetos por renglones, los Predicados/Propiedades en los encabezados de las columnas y los Objetos/Valores en la intersección de ambos.  Los formatos disponibles están en inglés en CSV y JSON .

Para la consulta de información, estos formatos están disponibles a diversos niveles de agregación. Las opciones de descarga van desde la versión ontologica completa  hasta la consulta de una subclase específica como lo es la etiqueta luchadores de sumo.  Para información detallada consúltese http://mappings.dbpedia.org/server/ontology/classes/ .

En particular utilizamos la versión ontológica de `DBpedia` en Base CVS ya que, en comparación con las otras fuentes DBpedia, permite la generación de nodos y arcos en forma independiente conservando la integridad relacional sin altos requerimientos de procesamiento 

El uso de listas se considero débil para la construcción de relaciones en `Neo4j`. La asociaion de tripletas pertenecientes a fuentes diversas se traduce en la identificación de claves de identidad homogéneas en Sujetos y Objetos.

En cuanto al uso de base en formato JSON se consideró inviable dado que la construcción de bases de datos en `Neo4j` presenta problemas de desemeño en proporción directa al volumen de procesamiento. Esto debido a limitaciones técnicas de los equipos de cómputo. Además con regularidad se reconocen probelmas memoria en el procesaiento de datos en aplicaciones basadas en Java.   


## Preparación de los Datos

La tarea de cargar información a Neo4j demandó en su momento la atención de todo el equipo, dando origen a líneas de investigación paralelas. Una de las opciones consideradas fue realizar la carga a través de `py2neo`, una interfaz de escritura y lectura de Python para Neo4j. Actualmente este paquete atraviesa por un período de desarrollo activo. 

A principios de Abril se logró poblar una base de datos de Neo4j por medio de `py2neo`. Se elaboró un proceso de carga con la siguiente lógica:

* Trabajar con los archivos _Mapping Based Types (MBT)_ y _Mapping Based Properties (MBP)_ del proyecto **DBpedia**. Estos archivos permiten reproducir la estructura de red de Wikipedia. Sin embargo, pasan por alto un aspecto clave de esta fuente de datos ya que no están dotados de contenido en lenguaje natural (texto en formato libre). 

* Poblar los nodos de una base de datos de Neo4j a partir de una lista de artículos identificados como relevantes a partir de su categorización (obtenida de _MBT_). Esto se logra a través del código:

```
from py2neo import neo4j, node, rel

gdb = neo4j.GraphDatabaseService()

N = gdb_nodes.count()[0]
b = 5000
n = 0

while n < N:
    n = min(n + b, N)
    batch = neo4j.WriteBatch(gdb)
    for node in list(gdb_nodes[n-b:n].itertuples()):
        batch.create({'item' : node[1]})
    results = batch.submit()
```

Donde `gdb_nodes` es una tabla plana de `pandas`. Se crea un nodo por cada renglon. 

* Agregar las relaciones entre nodos con las tripletas _sujeto-objeto-predicado_ que registra la tabla de _MBP_. Se logra por medio del código:

```
N = gdb_edges.count()[0]
b = 5000
n = 0

while n < N:
    n = min(n + b, N)
    batch = neo4j.WriteBatch(gdb)
    for index, edge in gdb_edges[n-b:n].iterrows():
        batch.create((gdb.node(edge['item_id_x']), edge['prop'], gdb.node(edge['item_id_y'])))
    results = batch.submit()
```

También a principios de Abril la opción de cargar información via shell empezaba a demostrar un gran alcance. Eventualmente dicha opción se convirtió la alternativa que mejor representaba los objetivos del proyecto y se puso en producción en un servidor de Amazon. La carga con `py2neo` fue un ambiente de prueba en efecto y un respaldo para trabajar de manera local en métodos de minería de gráficas y visualización.

## Construcción del Modelo

Una vez cargada la información a Neo4j, se planteó desarrollar una aplicación de predicción de ligas entre individuos. La forma más inmediata de plantear esto depende de extraer vecinos a _n_ grados de determinado nodo (cierto tópico de interés en este caso). Sobre este subgrafo uno es sujeto a inferir ligas ordenando parejas de nodos desconectados según una función binaria de similitud como se plantea en _Practical Graph Mining with R_. Se trataba de un uso parecido a la predicción de ligas que encuentra uno cotidianamente en los motores de sugerencias en redes sociales. 

La aplicación originalmente planteada depende de poder ejecutar la extracción de vecinos a _n_ grados con facilidad. En el lenguaje de consulta `cypher`, si uno quisiera extraer la subred de nodos que distan a los más en 3 grados del nodo del ITAM ejecutaría la siguiente consulta:

```
MATCH (i)-[*1..3]-(j) where i.item='ITAM' RETURN i, j
```

Sin embargo, bajo ninguna de las configuraciones de Neo4j probadas se logró que esta consulta terminara. Esto obligó a reconsiderar la funcionalidad de la aplicación en función a una consulta que sí terminara en un tiempo razonable. Las consultas de vecinos a un grado cumplen con esta importante especificación. Estas toman la siguiente forma:

```
MATCH (i)--(j) where i.item='ITAM' RETURN j
```

El uso que se identificó para esta consulta fue para relacionar temas arbitrarios a partir de sus vecinos en común. Enfrentando una red compleja, un uso atractivo es identificar una subred o una agrupación de nodos que simplifique la red principal. La red simplificada puede ser un auxiliar valioso para encontrar una narrativa subyacente. Se pueden tomar dos enfoques para resolver esto: 

- **podado de aristas**: La lógica de donde proviene este uso se resume en que una liga entre temas históricamente importantes por si mismos puede ser de mayor o menor relevancia. El problema que plantea esta situación es uno de descartar ligas.
Se puede recurrir a identificar subgrafos (como árboles) que conserven las aristas más importantes. Los algoritmos disponibles incluyen la búsqueda del árbol abarcante de pesos máximos y grafos aleatorios jerárquicos. 
- **detección de comunidades**: para ello existen algoritmos como maximización de modularidad o caminatas aleatorias.  

Medidas de similaridad como las siguientes son sujetas a señalar comunidades dentro de una red:

- Vecinos en común
- Jaccard
- Adamic-Adar

La implementación de estos métodos se encuentra todavía en desarrollo, pero el código remitido a la fecha implementa una detección del árbol de pesos máximos entre los temas ingresados por el usuario en un campo de búsqueda. 

## Despliegue del modelo

En la etapa de despliegue del modelo resultó evidente que dentro de `R` se podian integrar distintas librerias que logran exactamente las funcionalidades que estaba resultando dificil replicar e integrar con diversas librerias de `java` y `python`. La combinación de las siguientes librerías permite llegar a una interfaz web capaz de consultar la base de datos gráfica en línea y devolver reportes con gráficos de alta calidad:

- `bitops`, `RCurl`, `RJSONIO`: permiten enviar consultas en `cypher` a un servidor de EC2 donde están cargados los datos de DBpedia en una base de datos de Neo4j
- `plyr`, `doMC`: permiten implementar en paralelo procesos como la emisión de consultas y manipulaciones de datos.
- `igraph`: repertorio de algoritmos para analizar redes 
- `d3Network`: cuenta con cinco métodos para hacer gráficas de redes en D3 sin código javascript. 
- `shiny`: crea una interfaz web interactiva para hacer consultas y visualizar resultados.
 

La aplicación de `shiny` determina la organización del código. Esta se divide en dos programas: 

- `ui.r` es el que ejecuta la interfaz gráfica 
- `server.r` escucha a la interfaz y ejecuta los pasos de procesamiento y análisis de datos. 

Para lanzar la aplicación es necesario que la instancia EC2 con Neo4j esté prendida. Una vez prendida, se obtiene su dirección IP de alguno de los integrantes del equipo y se modifica la línea 12 de `server.r`, ingresando dicho dato: 

```
neo_remote <- 'http://X.X.X.X:7474/db/data/cypher'
```

Una vez completado el paso anterior se puede ejecutar la aplicación dentro de `R` estando uno posicionado afuera del directorio `EspHistApp`:

```
library(shiny)
runApp(EspHistApp)
```
