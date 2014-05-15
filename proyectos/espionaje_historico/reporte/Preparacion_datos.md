Proceso de preparación de datos
========================================================

Generalidades. Resulta necesario repasar brevemente algunos fundamentos tanto de la organización de la  información de DBpedia como de los requerimientos de la base de datos Neo4j.  Esto  favorece la comprensión de los procesos que se enunciarán más adelante.

**DBpedia.**   

Las bases ontológicas de DBpedia están construidas en unidades de información construidas  en conceptos simples:

1. Cada elemento (Sujeto)  es diferenciable a través de su URI, y por él se puede identificar su fuente. El URI (Uniform Resource Identifier) está formado por la integración de dos elementos URL (Uniform Resource Locator) y URN (Uniform Resource Name)

2. Existen datos – denominados Propiedades – y representan información que otorga atributos a los sujetos 

3. Se cuenta con elementos de análisis que reflejan la relación o enlace entre dos sujetos, estos se denominan  Predicados. 

4. Dadas estos elementos es posible identificar dos tipos de información ontológica fundamental

    a) Sujeto – Propiedad - Valor
      Cada elemento de análisis esta clasificado en un árbol de categorías y dentro de la categoría posee propiedades que lo distinguen.

     S= <http://dbpedia.org/resource/Alabama>   
     C= <http://dbpedia.org/ontology/areaTotal>      
     P= "1.35765E11"^^<http://www.w3.org/2001/XMLSchema#double>    

    b) Sujeto – Predicado – Objeto
      Los sujetos tienen relaciones (actos) sobre Objetos los cuales corresponden a su vez a otros sujetos.

      S= <http://dbpedia.org/resource/Aristotle>    
      P= <http://dbpedia.org/ontology/influencedBy>     
      O= <http://dbpedia.org/resource/Heraclitus>   

**Neo4j.**   
Los requerimientos de información para la integración de datos en Neo4j que se repasan son:  

1.	Los nodos deben estar asociados a una clave única diferenciadora. Durante el proceso de carga Neo4j asigna un número de nodo (consecutivo irrepetible) a cada elemento que se integra con independencia que el valor asociado ya se encuentre registrado previamente. A partir de la versión 2.0 es posible asignar llaves propias de indización.

2.	Adicionalmente,  los nodos reciben la asignación de propiedades que a su vez son base  en la definición de consultas.

3.	Un conjunto de nodos previamente constituidos pueden asociarse a categorías que segmentan la información por tipo. Estas categorías también llegan a integrar  índices de consulta.

4.	Los arcos (dirigidos o no)– denominados relaciones en Neo4j – poseen: un identificador numérico, dado por el sistema, una etiqueta asociada que ‘verbaliza’ la relación  y de forma opcional reciben la asignación de propiedades del mismo modo que los nodos. 

5.	Todo elemento de carga debe efectuarse indicando inequívocamente el nodo al cual se asigna la propiedad, etiqueta o relación.


**Formato de datos.**    
La información de DBpedia es producto de un proyecto de extracción de contenido de Wikipedia. Su fuentes se encuentra disponible en dos formatos generales: Listado y Bases Ontologicas.

*Listados.*   Reflejan la relación ontológica (S- Pr -V o S-P-O). Constituidos por tripletas en diversos idiomas y segmentados por formatos de contenido (imágenes, textos, enlace..) 

*Bases ontológicas.*  Conjuntos de información donde la relación muestra los Sujetos por renglones, los Predicados/Propiedades  en los encabezados de las columnas y los Objetos/Valores en la intersección de ambos.  Los formatos disponibles están en inglés en  CSV y JSON .

Para la consulta de información, estos formatos están disponibles a diversos niveles de agregación. Las opciones de descarga van desde la versión ontología completa  hasta la consulta de una subclase especifica como es luchadores de sumo.  Para información detallada consúltese http://mappings.dbpedia.org/server/ontology/classes/ .

Este estudio utilizó la versión ontológica de DBpedia en Base CVS ya que, en comparación con las otras fuentes DBpedia, permite la generación de nodos y arcos en forma independiente conservando la integridad relacional sin altos requerimientos de procesamiento 

El uso de Listas se considero débil para la construcción de relaciones en NEO4J. La asociaion de tripletas pertenecientes a fuentes diversas se traduce en la identificación de claves de identidad homogéneas en Sujetos y Objetos.

En cuanto al uso de base JSON se consideró inviable dado que la construcción de bases de datos en NEO4J presenta problemas de desemeño en proporción directa al volumen de procesamiento debido a limitaciones técnicas de los equipos de cómputo. Con regularidad se reconocen probelmas memoria en el procesaiento de datos en aplicaciones basadas en java.   


**Clases Ontológicas**

Como se señaló, existen segmentos de la base ontológica de DBpedia a diversos niveles (clases) dependiendo del interés del usuario. 

La clase general de la base ontológica es `Thing` y a ella pertenecen  clases  como `Activity`, `Agent`, `Event`, `Biomolecula`, `Anatomical Structure`, `Award`, `Device`, `Place`, `Polyhedron`, `Tropical Concept` etc. A su vez, cada una de estas puede estar subdividida en clases que permiten mayor detalle en el análisis. En total la base `Thing`  cuenta con 656 ramificaciones ontológicas.

No todas las ramas fueron consideradas objeto de estudio del presente. Esto obedece tanto a criterios de relevancia como razones viabilidad del proyecto. 

Por un lado se reconoce que DBpedia refleja el contenido de Wikipedia y ésta otorga peso a temáticas no propias del estudio tales como `Activity` cuyos contenidos se refieren exclusivamente a deportes y es redundante con la información que se localiza en la clase `Agent` subclase `SportLeague`.

Por otro lado, el volumen de información es tal que supera las capacidades de procesamiento viable en un proyecto de medio año.

Para los fines del presente se consideraron únicamente tres clases: **Agent**, **Event** y **Place** que a su vez se subdividen en 245, 36 y 131 subclases respectivamente. 

Las fuentes de informacion se localizan en es http://web.informatik.uni-mannheim.de/DBpediaAsTables/DBpediaClasses.htm   

**Fuentes  utilizadas**  

Archivo     |      Tamaño    | Registros   | Campos *1*
-----------|:---------------|:-----------|:-----------|
Agent.csv  |  7,100,209,857 | 1,041,033  |  836 |   
Event.csv  |    886,661,600 |    38,469  | 2,969  |   
Place.csv  |  3,409,549,881 |   639,454  |  621   |
 
*1 Los campos no muestran valor para la totalidad de los registros. * 
 
**Estructura de archivos.**  

Abordemos ahora la estructura de los archivos, reconociendo en ellos los conceptos que repasamos anteriormente. Se acompaña un ejemplo de la clase ontológica Agent.

Conservemos en mente dos ideas básicas 

1. En cada archivo se tienen  4 encabezados para cada campo.  

    Etiqueta de propiedad que equivale a nombre de campo  
    Expresión URI del primer encabezado  
    Tipo de variable 
    Expresion URI del tercer encabezado 

2. Cada registro muestra en su primer columna el URI del Sujeto al cual se refiere el contenido de todo el renglón.  


**Identificación de contenidos.**  

Veamos como se muestran en los archivos planos CVS las expresiones **S-P-O** y **S-Pr-V** .


*Sujeto – Predicado – Objeto*  

Cada  expresión ontológica  Sujeto – Predicado – Objeto se define en campos contiguos que se refieren al mismo campo.  La primera columna define la tipología del dato, la segunda el valor. Ejemplo:

Archivo Agent.csv  - 

Campos 5 (Encabezados)  
(1) "academicAdvisor_label"  
(2) "http://dbpedia.org/ontology/academicAdvisor"  
(3) "XMLSchema#string"  
(4) "http://www.w3.org/2001/XMLSchema#string"  

Campo 6 (Encabezados)  
(1) "academicAdvisor"  
(2) "http://dbpedia.org/ontology/academicAdvisor"  
(3) "Person"  
(4) "http://dbpedia.org/ontology/Person"  
  
El campo 5 indica que los valores asociados representan cadenas de texto –string-. Estos contenidos en el esquema se identifican con una clase de dato especifica: academicAdvisor. El campo 6 indica que los objetos referidos en la columna corresponden a la clase ontológica Person.  

A nivel de registro se obtienen dos expresiones del mismo objeto: Valor y expresión URI.  

Campo 1 Sujeto   
http://dbpedia.org/resource/Garrett_Birkhoff,  

Campo 5 (Objeto)   
{Philip Hall|Ralph H. Fowler},  

Campo 6 (Objeto URI)   
{http://dbpedia.org/resource/Philip_Hall|http://dbpedia.org/resource/Ralph_H._Fowler}   
   
A partir de esto se genera dos expresiones en el grafo   
   
Garrett_Birkhoff –[academicAdvisor] - Philip_Hall   
Garrett_Birkhoff –[academicAdvisor] - Ralph_H._Fowler   
   
Del mismo modo se asignan categorías ‘person’ a los nodos Philip_Hall y Ralph_H._Fowler   


*Sujeto – Propiedad – Valor*   

Por otro lado, las expresiones ontológicas Sujeto – Propiedad – Valor se indican en campos únicos donde el primer encabezado determina el nombre del campo. Ejemplos.

Campo 1 (Sujeto)
"http://dbpedia.org/resource/Garrett_Birkhoff 

Campo 2 (encabezado 1) Propiedad
"rdf-schema#label"

Campo 3 (encabezado 1) Propiedad 
"rdf-schema#comment"

Campo 2 Valor
Garrett Birkhoff

Campo 3 Valor 
Birkhoff,Garrett Birkhoff January 19 1911 – November 22 1996 was an American mathematician. He is best known for his work in lattice theory. The mathematician George Birkhoff 1884–1944 was his father.

Esta expresión ontológica se refleja en e grafo 
a)	creando para el nodo Garrett_Birkhoff dos propiedades: Label y Comment y 
b)	asignando sus valores correspondientes.

Este resultado es verificable contra la página de Wikipedia (fuente original).

  http://en.wikipedia.org/wiki/Garrett_Birkhoff


**Fases de Procesamiento.**   

La información de los archivos ontologicos descargados desde los servidores de DBpedia se efectuó en 3 grandes fases de procesamiento.

* Preparación de información
  
* Codificación en Cypher (lenguaje base de Neo4j)
  
* Carga de Base de datos.

