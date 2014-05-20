##Fases de procesamiento  

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

###Fase 6. Identificaciin de nodos objeto faltantes. Utilizando postgresql se realizó un cruce de informacion Entre los de los nodos base (fase 2)  y los arcos  (fase 5). 
Este proceso arrojo dos tipos de nodos faltantes: 
A) nodos base no codificados (fase1) por carecer de valor en el campo label
B) nodos que no pertenecen a clases ontologicas Agent, Place y Event.

###Fase 7. Codificacion de nodos faltantes. Se realizó la codificaciin de la informaciin en cypher .

###Fase 8. Integracion de nodos a cypher. 


El procesamiento de informacion se ajusto a las reglas de Neo4j para la integracion de informacion.

Neo4j organiza la informacion en torno a nodos y arcos.

De manera adicional se pueden anadir clases (labels) y propiedades.
Las clases permiten organizar la informacion segmentando el grafo. Las propiedades, por su parte asignan informacion particular sobre nodos y arcos. 

Ademas del indice interno, es posible Indexar sobre clases y propiedades.

Un arco se crea en nodos previamente generados.

Si en la construccion de un arco no existen  nodos Neo4j genera el nodo(s) y posteriormente el archo. Los identificadores de estos nuevos nodos se pueden conocer si se analizan los log de carga de informacion.

Para aprovechar la funcionalidad de Neo4j conviene   definir para cada nodo una propiedad denominada clave sobre la cual se construyan indices de consulta basicos de informacion. La unicidad de la clave queda entonces controlada en la generacion de datos.

Los indices en los nodos favorecen  el proceso de integracion de arcos.
La evidencia indica que  en la creacion de arcos sin indices en 50,000 nodos toma 250 milisegundos cada uno. La construccion de un indice general y su utilizacion en el rpoceso hace que  la creacion de cada uno de los 50000 arcos se realice en 2 milisegundos.

