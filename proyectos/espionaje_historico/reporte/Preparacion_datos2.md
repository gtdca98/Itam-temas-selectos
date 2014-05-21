 
**Modelo de integración**  

El procesamiento de información de los archivos ontologicos descargados desde los servidores de DBpedia se efectuó apegandose al modelo de carga por neo4j-shell que se simplifica en la siguiente:

cat insert.cql | neo4j-shell -path /path/to/db  > file.log

Generar archivos de comandos en lenguaje cypher que instruyan la creacion de elementos en la base de datos. Estas instrucciones se vuelcan en neo4j-shell y su resultado es colectado en archivos log. 

Este modelo unicamente integra lotes cuando la totalidad de las instruciones se cumple exitosamente. En su defecto aplica roll-back dejando sin efecto cualquier cambio.

Debe destacarse que  la carga puede realizarse sin la activacion del servicio de base de datos y reservandose la instancia en forma exclusiva.

En contra se tiene que no se permite la ejecución paralela de procesos de insersion. Esto se encuentra conpensado con velocidad - siempre y cuando se adopte el uso de indices -.

(http://www.neo4j.org/develop/import)

**Secuencia de integración**   

Neo4j organiza la informacion en base a nodos y arcos los caules, adicionalmente, pueden recibir la asignación de etiquetas (clases) y/o propiedades. Las etiquetas permiten organizar la informacion segmentando el grafo. Las propiedades, por su parte asignan informacion particular sobre nodos y arcos. Ademas del indice interno, es posible crear, conforma a las necesidades del usaio, indices sobre clases y propiedades.

La secuencia de integración aplicada consiste en:

Se integran los nodos y su respectiva clave de diferenciacion. 

create (N423559:agent{ cve: 'Garrett_Birkhoff' , name:'Garrett Birkhoff' });
create (N785292:agent{ cve: 'Philip_Hall' , name:'Philip Hall' });

Se integran arcos  en nodos previamente generados.

MATCH (n:base {cve:'Garrett_Birkhoff'}), (m:base {cve:'Philip_Hall'}) create(n)-[:academicAdvisor]->(m);

Se integran etiquetas y propiedades.   

match (n:agent { cve: 'Garrett_Birkhoff' }) set n:person;   
match (n:agent { cve: 'Garrett_Birkhoff' }) set n:scientist;   

MATCH (n:agent {cve:'Garrett_Birkhoff'}) SET n.birthDate='19110119';   
MATCH (n:agent {cve:'Garrett_Birkhoff'}) SET n.deathDate='19961122';   
MATCH (n:agent {cve:'Garrett_Birkhoff'}) SET n.rdfschemacomment='Garrett Birkhoff January 19 1911 – November 22 1996 was an American mathematician. He is best known for his work in lattice theory. The mathematician George Birkhoff 1884–1944 was his father.';   
    

Es importante presentar dos acotaciones:

En la construccion de un arco Neo4j genera el nodo(s) y posteriormente el archo. Si los nodos no existen Neo4j los crear y, los identificadores de estos nuevos nodos se conocer via consulta de nodos con la propiedad automatica id()..

Para aprovechar la funcionalidad de Neo4j se convino definir para cada nodo una propiedad denominada clave sobre la cual se construyan indices de consulta basicos de informacion. La unicidad de la clave queda entonces controlada en la generacion de datos.

Los indices en los nodos favorecen el proceso de integracion de arcos, etiquetas y propiedades. La evidencia indica que  en la creacion de arcos sin indices en 50,000 nodos toma 250 milisegundos cada uno. La construccion de un indice general y su utilizacion en el rpoceso hace que  la creacion de cada uno de los 50000 arcos se realice en 2 milisegundos.


##Fases de procesamiento 

Con base en lo señalado hasta el momento, resulta claro indicar que el procesamiento de datos se resume en transformar el contenido de las tabñas de las clases ontologicas de dbpedia CVS en un conjunto de instrucciones de integracion en Cypher para contruir la base de datos Neo4j. Hay tres grandes lineas de trabajo:  

1. Preparación de información. 
 Los datos deben organizarse para facilitar su procesamiento. Dada la cantidad de campos involucrados y el tamaño de los archivos se consideró pertinente dejar las fuentes de información sin modificaciones sustantivas y  a partir de ellas extraer en archivos diversos conforme se necesite. 
  
2. Codificación en Cypher (lenguaje base de Neo4j).  
  En orden de integración en Neo4j, la información debe consistir en:
  Nodes. Formados por una clave y una etiqueta o nombre.
  Labels. Clases que permiten la agriupacion de la informacion para análsiis tematico.
  Relations. Son los arcos que enlazan a los nodos.
  Properties. Caracteristicas que pueden integrarse tanto a los Nodos como a las propiedades   

3. Carga de Base de datos. 
  Para el presente se utiliza el proceso de inetgracion via Neo4j-shell via el volcado de instruccioes cypher en el interprete. Las opciones de integración a través de python con py2neo o neo4j-rest-client no se utilizaron ya que: 
  a) su operación carece de controles tipo roll-back ante fallas de integración. Es decir se corre el riesgo de integrar lotes parciales de información obligando a la revision de los log de proceso para determinar el avance de las cargas.  
  b) requiere que los servicios de la base de datos se encuentren activos en la carga lo cual puede resultar costoso en terminos de competencia por recursos disponibles y en consecuencia tiempo. Adicionalmente Py2neo y neo4j-rest-client son se efectuan en memoria dado que conceptualmente estan diseñados para la explotacion de información mas que para la carga de volumen. 

A continuacion se muestran las fases de procesamiento aplicadas.

  
###Fase 0 homologación  
Los caracteres  delimitadores de campo en los archivos de las clases ontologicas se homologaron. La secuencia "," se tranformo en coma simple previa sustitucion de comas internas de los campos.   Asi mismo se suprimieron las terminaciones __[1-9] en todos los campos por referirse a la mismo nodo.

###Fase 1. Extracion y codificacion de nodos base.
La generacion de nodos consitio en la extraccion del primer campo de cada archivo y su expresion amplia asignandoes a los valores unicos de esta lista la clase correspondiente. Este listado de nodos se considero la base (sujeto) de cada clase ontologica: agent , place y event.

Se reconoce, que el listado de nodos base no agota la totalidad de los nodos extraibles en los archivos de las tres clases  ya que corresponden  a los sujetos (y algunos objetos) en las  relaciones ontologicas tipo sujeto - predicado - objeto. Por ello para la obtencion del listado completo de nodos es necesario extraer los arcos (s p o) y verificar entre los  objetos los nodos faltantes.

Asi mismo se realizo su codificacion en cypher para carga en la base Neo4j en lotes de 200 mil operaciones. De carga

###fase 2 Preparacion de nodos base para localizacion de faltantes.  
Los listados de nodos base generados en la fase anterios se recodificaron para permitir su insersion en una tabla postgresql. Estos datos se utilzaran en la sexta fase.

###Fase 3 identificacion de arcos.  
Como senalamos al inicio de la seccion, las relaciones ontologicas o arcos se encuentran expresadas en los archivos dbpedia por medio de dos columnas donde una indica el tipo y la otra el valor. Dos columnas contiguas se consideran asociadas si su primer encabezado indica que se refieren al mismo elemento. 
En esta fase se analizan los encabezados de cada archivo y se determina cuales  pares de columnas que corresponden a arcos. Como resultado se obtienen listas de extraccion de informacion.

###Fase 4 extraccion de arcos.  
Con las listas generadas en la fase anterior,  se extraen las columas del archivo dbpedia que se refieren a cada arco en archivos individuale que contienen:

 sujeto, clase del sujeto , predicado, clase del objeto y objeto

Resulta importante senalar que durante el proceso se descartan registros de arcos con informacion incompleta.

Por su naturaleza este proceso se ejecuto en parallel.

###Fase 5 codificacion de arcos.   
Una vez que la informacion de los arcos se extrajo se realizo su codificacion en cypher para carga en la base Neo4j en lotes de maximo 200 mil operaciones.

Asi mismo se genero informaciin para lam localizacion de los nodos (objeto) faltantes.

###Fase 6. Identificaciin de nodos objeto faltantes. 

Utilizando postgresql se realizó un cruce de informacion Entre los de los nodos base (fase 2)  y los arcos  (fase 5). 
Este proceso arrojo dos tipos de nodos faltantes: 
A) nodos base no codificados (fase1) por carecer de valor en el campo label
B) nodos que no pertenecen a clases ontologicas Agent, Place y Event.

###Fase 7. Codificacion de nodos faltantes. 

Se realizó la codificaciin de la información en cypher.

###Fase 8. Integracion de nodos a cypher. 

El procesamiento de informacion se ajusto al modelo de carga por neo4j-shell revisado anteriormente.

###Fase 9. Indexacion de los nodos creados

###Fase 10. Generacion de etiquetas de los nodos base

###Fase 11. Generacion de las etiquetas de los nodos complementarios

###Fase 12. Integracion de etiquetas en la base de datos

###Fase 13. Generación de indices adicionales con base en etiquetas

###Fase 14. Integracion de arcos -relaciones- en base de datos.

###Fase 15. Deteccion de propiedades.

###Fase 16. Extraccionn de nformacion de propiedades.

###Fase 17. Codificacion de Propiedades en Cypher.

###Fase 18. Integracion de propiedades en base de datos. [codigo] (Proceso_datos/18_Proceso_batch_props.sh)





