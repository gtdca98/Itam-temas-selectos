Proceso de preparación de datos
========================================================

Generalidades. Resulta necesario repasar brevemente algunos fundamentos tanto de la organización de la  información de DBpedia como de los requerimientos de la base de datos Neo4j.  Esto  favorece la comprensión de los procesos que se enunciarán más adelante.

DBpedia.
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

Neo4j.
Los requerimientos de información para la integración de datos en Neo4j que se repasan son:

a)	Los nodos deben estar asociados a una clave única diferenciadora. Durante el proceso de carga Neo4j asigna un número de nodo (consecutivo irrepetible) a cada elemento que se integra con independencia que el valor asociado ya se encuentre registrado previamente. A partir de la versión 2.0 es posible asignar llaves propias de indización.

b)	Adicionalmente,  los nodos reciben la asignación de propiedades que a su vez son base  en la definición de consultas.

c)	Un conjunto de nodos previamente constituidos pueden asociarse a categorías que segmentan la información por tipo. Estas categorías también llegan a integrar  índices de consulta.

d)	Los arcos (dirigidos o no)– denominados relaciones en Neo4j – poseen: un identificador numérico, dado por el sistema, una etiqueta asociada que ‘verbaliza’ la relación  y de forma opcional reciben la asignación de propiedades del mismo modo que los nodos. 

e)	Todo elemento de carga debe efectuarse indicando inequívocamente el nodo al cual se asigna la propiedad, etiqueta o relación.


Formato de datos . 
La información de DBpedia es producto de un proyecto de extracción de contenido de Wikipedia. Su fuentes se encuentra disponible en dos formatos generales: Listado y Bases Ontologicas.

Listados.  Reflejan la relación ontológica (S- Pr -V o S-P-O). Constituidos por tripletas en diversos idiomas y segmentados por formatos de contenido (imágenes, textos, enlace..) 

Bases ontológicas. Conjuntos de información donde la relación muestra los Sujetos por renglones, los Predicados/Propiedades  en los encabezados de las columnas y los Objetos/Valores en la intersección de ambos.  Los formatos disponibles están en inglés en  CSV y JSON .

Para la consulta de información, estos formatos están disponibles a diversos niveles de agregación. Las opciones de descarga van desde la versión completa de la ontología hasta la consulta de una subclase especifica como es luchadores de sumo.  Para información detallada consúltese http://mappings.dbpedia.org/server/ontology/classes/ .

Este estudio utilizó la versión ontológica de DBpedia en Base CVS ya que, en comparación con las otras fuentes DBpedia, permite la generación de nodos y arcos en forma independiente conservando la integridad relacional sin altos requerimientos de procesamiento 

(las Listas se consideraron inviables dado que la construcción de relaciones en NEO4J requiere la identificación de las claves de identidad tanto de los Sujetos como Objetos. Estas llaves están formadas por URIs las cuales por su construcción generan índices pesados)

(JSON se consideró inviable dado que la construcción de bases de datos en NEO4J basados en JSON se degrada en proporción directa al volumen de procesamiento y las limitaciones técnicas de los equipos de cómputo)

Clases Ontológicas

Como se señaló, existen   Bases ontológicas DBpedia a diversos niveles dependiendo del interés del usuario.

La clase general de la base ontológica es Thing y a ella pertenecen  clases  como Activity, Agent, Event, Biomolecula, Anatomical Structure, Award, Device, Place, Polyhedron, Tropical Concept etc. A su vez, cada una de estas puede estar subdividida en clases que permiten mayor detalle en el análisis. En total la base Thing  cuenta con 656 ramificaciones ontológicas.

No todas las ramas fueron consideradas objeto de estudio del presente. Esto obedece tanto a criterios de relevancia como razones viabilidad del proyecto. 

Por un lado se reconoce que DBpedia refleja el contenido de Wikipedia y ésta otorga peso a temáticas no propias del estudio tales como Activity cuyos contenidos se refieren exclusivamente a deportes y redundan en la información que se localiza en la clase Agent subclase SportLeague.

Por otro lado, el volumen de información es tal que supera las capacidades de procesamiento viable en un proyecto de medio año.

Para los fines del presente se consideraron únicamente tres clases: Agent, Event y Place que a su vez se subdividen en 245, 36 y 131 subclases respectivamente. La descarga de información es http://web.informatik.uni-mannheim.de/DBpediaAsTables/DBpediaClasses.htm 


Fuentes  utilizadas 

Archivo                    Tamaño                Registros       Campos-1-
Agent.csv 7,100,209,857  1,041,033 X   836
Event.csv   886,661,600     38,469 X 2,969
Place.csv 3,409,549,881    639,454 X   621

1- Los campos no muestran valor para la totalidad de los registros. 

Estructura de archivos.

Abordemos ahora la estructura de los archivos, reconociendo en ellos los conceptos que repasamos anteriormente. Se acompaña un ejemplo de la clase ontológica Agent.

Conservemos en mente dos ideas básicas 

A)  En cada archivo se tienen  4 encabezados para cada campo. 

Etiqueta de propiedad que equivale a nombre de campo
Expresión URI del primer encabezado
Tipo de variable
Expresion URI del tercer encabezado

B)  Cada registro muestra en su primer columna el URI del Sujeto al cual se refiere el contenido de todo el renglón.


Identificación de contenidos.
Veamos como se muestran en los archivos planos CVS las expresiones S-P-O y S-Pr-V .

Sujeto – Predicado – Objeto
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


Sujeto – Propiedad – Valor
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


Fases de Procesamiento.

La información de los archivos ontologicos descargados desde los servidores de DBpedia se efectuó en 3 grandes fases de procesamiento.

Preparación de información

Codificación en Cypher (lenguaje base de Neo4j)

Carga de Base de datos.



El proceso de preparación de la fuente de datos debería de ser:

1. Carga del archivo original.
2. Normalización de los nombres de columnas.
3. Identificación de los registros.
4. Estructura, dimensión, resúmen estadístico.
5. Remover columnas inservibles.
6. Análisis de faltantes.
7. Imputar (opcional).
8. Remover registros inservibles  (opcional)
9. Extraer metadata de la fuente de datos.
10. Guardar el archivo limpio, con  sufijo  `_clean`.*timestamp*`.rds`
11. Guardar la metadata (terminación `.RData`)
12. Presentarlo (ver el `dm_report`)

Las siguientes líneas de código son sugerencias sobre como implementar los pasos
recién descritos. Este código debería de ir en un archivo llamado `clean.r`.


```r

# Preparación de los datos
ds.path <- ""  # Variable que incluye el path donde está la fuente de datos (ds)
ds.name <- ""  # Nombre de la fuente de datos
ds <- get(ds.name)  # De esta manera quedan genéricos los pasos

# Normaliza (estandariza) los nombres a minúsculas, separadas por '_', o'.'
# Si es necesario, pon nombres que tengan más sentido
names(ds) <- c()


vars <- names(ds)  # Nombres de las variables
target <- ""  # Si el proyecto es de predicción, el nombre de la variable a predecir
id <- c()  # Vector con las variables que forman el ID del registro


# Sumario de los datos
dim(ds)
names(ds)
head(ds)
tail(ds)
# Si se usa dplyr, no son necesarios los cuatro pasos anteriores, solo con
# la impresión a pantalla del ds bastaría
ds[sample(nrow(ds), 6)]
str(ds)
summary(ds)

# Variables a ignorar
vars.ignorar <- c(id)  # Identificador

mvc <- sapply(ds[vars], function(x) sum(is.na(x)))  # Conteo de valores faltantes
mvn <- names(ds)[(which(mvc == nrow(ds)))]  # Nombre de las variables con todas faltantes
ignore <- union(ignore, mvn)

# Otra alternativa es eliminar los que tienen más del 70% de faltantes No
# recomendado sin hacer análisis de missings mvn <- names(which(mvc >=
# 0.7*nrow(ds))) ignore <- union(ignore, mvn)


# Ignoramos las variables con muchos niveles Por ejemplo el randomForest no
# puede con variables categóricas de más de 32 niveles.  Es más recomendable
# recodificar en menos niveles
factors <- which(sapply(ds[vars], is.factor))
lvls <- sapply(factors, function(x) length(levels(ds[[x]])))
(many <- names(which(lvls > 20)))
ignore <- union(ignore, many)

# Ignoramos variables con valores constantes
(constants <- names(which(sapply(ds[vars], function(x) all(x == x[1L])))))
ignore <- union(ignore, constants)

# Eliminamos las variables a ignorar
vars <- setdiff(vars, ignore)

# Es mucho sabio tener una función de imputación especial No se recomienda
# imputar sin saber el comportamiento de los missings


# Normalizar los factores
factores <- which(sapply(ds[vars], is.factor))
for (f in factores) levels(ds[[f]]) <- c()


# Eliminar los registros que no tienen valor a predecir
ds <- ds[!is.na(ds[target]), ]

# Si la tarea es clasificar, la variable target debe de ser categórica
ds[target] <- as.factor(ds[target])
inputs <- setdiff(vars, target)
nobs <- nrow(ds)