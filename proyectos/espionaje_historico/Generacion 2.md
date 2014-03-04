Carga resuelta  Marzo 3 3014
======================

Respecto de la carga de relaciones tengo buenas noticias:

1) Se logran generar nodos con buena calidad y rapidez 
2) Se logran cargar relaciones a partir de propiedades generadas a los nodos.

Para ello se tienen las siguientes consideraciones

a) Neo4j apagado  ---   neo4j stop
b) Contenido de BD borrado  --  shell DELDBNEO4J.sh 
c) Carga por medio de neo4j-shell  que recibe un archivo con secuencia de instrucciones  -- shell CARGANEO4J.sh



_________________________________________________________________

Sintaxis probada:
--------------------

**Generación de nodos**


La sintaxis para creación de NODOS es la siguiente

create (id_temporal:Etiqueta { Prop_01: ‘Valor_Prop_01' , Prop_02: 'Valor_Prop_02' , … ,Prop_n: 'Valor_Prop_n' })


El id_temporal (identifier) es requerido y sólo se utiliza si en la misma instrucción se indica la creación de relaciones (edges) -ver ejemplo mas abajo- . Sea cual sea el valor este no será almacenado en la base de datos a menos que entre las propiedades se genere una clave a la cual se hace referencia al momento de generar las relaciones.

La etiqueta es un elemento que permite la identificación de los nodos por tipo. Por ejemplo en una colección de artículos científicos tenemos Autores, Papers, Instituciones, Congresos, Temas….  cada uno se  constituye en nodo y la asociación con una etiqueta favorece tanto su consulta como la presentación gráfica del mismo usando colores diferentes por etiqueta.

Las propiedades son características particulares de cada nodo que se forman de dos elementos: nombre de propiedad y valor. El nombre esta compuesto de una sola palabra y representa genéricamente la característica. (Nombre, Apellidos, Clave, Tipo). El valor es la expresión particular de la propiedad para el nodo especifico. Nombre: ‘José”, Apellidos: ‘Gómez Tagle’ , Clave:’Tqw347’, Tipo:’Persona'

Se espera que al menos todos los nodos pertenecientes a la misma Etiqueta presenten una propiedad en común ya que esta se puede usar para agregar relaciones y propiedades. En este caso se recomienda que todas tengan in identificador o clave.

En la creación de Nodos se debe evitar nombrar las propiedades con palabras reservadas. 

Ejemplo:  ID ~ id ~ Id ~ iD  es un valor incremental que automáticamente genera Neo4j para cada nodo generado, en su lugar se puede usar CVE ~ clave.
El mismo caso se presenta con palabras como: create, delete, merge, start son  comandos de neo4j se sugiere usar verbos con preposiciones “create_by”, "deleted_on"

La creacion debe inidcar que el nodo y sus propiedades se han creado. 

___________________________________________________________________________________

**Generacion de EDGES - Relaciones:**


Se tieien dos posibilidades:

*a) Cuando los nodos se crean al mismo tiempo que las propiedades estos deben estar en la misma instrucción CREATE, ejemplo:*

CREATE (shakespeare { firstname: 'William', lastname: 'Shakespeare' }), 
		(juliusCaesar { title: 'Julius Caesar' }), 
		(shakespeare)-[:WROTE_PLAY { year: 1599 }]->(juliusCaesar), 
		(theTempest { title: 'The Tempest' }), 
		(shakespeare)-[:WROTE_PLAY { year: 1610}]->(theTempest)...



*b) Cuando ya existen nodos las relaciones se generan por medio de queries*

START n=node( * ), m=node( * ) 
where has(n.cve) and has(m.cve) and n.cve='ABgsg' and m.cve='gamdlc'
create (n)-[:FRIENDSHIP {desde:1984}]->(m)

En este caso se indica que n y m son nodos, que ambos poseen la propiedad cve 
y por ello que se crea la relación indicada


La salida del proceso debe indicar que el la relacion se ha creado.
y también que se agregaron propiedades (en su caso)

_______________________________________________________

*Eliminar Nodos y sus relaciones.*

La instrucción es la siguiente:

MATCH (n {Prop_ x : 'Valor_ prop_x' })-[r]-()
DELETE n,r

Busca los nodos (n) cuyos Propiedad X tenga un valor definido y que cuente con cualquier relación con otros nodos. 
Identificados borra los nodos que cumplan la condición y sus relaciones

Ejemplo:
MATCH (n{nombre :'Instituto Universitario'})-[r]-()
DELETE n,r

________________________________________________________

+Visualizar un nodo+

MATCH (n1:Etiqueta {Prop_1:’Valor propiedad x}) RETURN n1

n1 es una variable de referencia donde se deposita la salida donde para la Etiqueta especifica se busca que la propiedad 1 tenga un valor dado.
RETURN n1 visualiza el resultado.

_______________________________________________________

Importante
----------

Se deben dejar espacios adecuados en los comandos. El interprete de Neo4j tiene probelmas cuando las secciones de las instrucciones no están separadas por espacios. 

Ejemplo:   

create(N12387:ensayos{clave:'RT54637',año:1993,nombre:"Marginalidad y sociedad"})

no funciona hay qye espaciarlo y terminar con punto y coma

create ( N12387:ensayos { clave: 'RT54637' , año: 1993 , nombre: "Marginalidad y sociedad" });

Todos los lotes de carga comienzan con BEGIN <enter> y terminan con COMMIT <enter> si al final de cada insruccion no hay enter el interprete no ejecuta. 

Si el COMMIT final no se ejecuta el esttus de la base de datos indicara que existen los nodos  pero éstos no se visualizan.  




