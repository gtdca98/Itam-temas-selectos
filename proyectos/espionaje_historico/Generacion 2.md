Carga resuelta
--------------

Respecto de la carga de relaciones tengo buenas noticias:

1) Se logran generar nodos con buena calidad y rapidez 
2) Se logran cargar relaciones a partir de propiedades generadas a los nodos.

Para ello se tienen las siguientes consideraciones

a) Neo4j apagado  ---   neo4j stop
b) Contenido de BD borrado  --  shell DELDBNEO4J.sh 
c) Carga por medio de neo4j-shell  que recibe un archivo con secuencia de instrucciones  -- shell CARGANEO4J.sh


Sintaxis probada:
=================

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



EDGES - Relaciones:

Cuando los nodos se crean al mismo tiempo que las propiedades estos deben estar en la misma instrucción CREATE, ejemplo:

CREATE (shakespeare { firstname: 'William', lastname: 'Shakespeare' }), 
		(juliusCaesar { title: 'Julius Caesar' }), 
		(shakespeare)-[:WROTE_PLAY { year: 1599 }]->(juliusCaesar), 
		(theTempest { title: 'The Tempest' }), 
		(shakespeare)-[:WROTE_PLAY { year: 1610}]->(theTempest)...



Cuando ya existen nodos las relaciones se generan por medio de queries

START n=node(*), m=node(*)  
where has(n.ID) and has(m.ID) and n.ID='gtdca' and m.ID='gamdlc'
create (n)-[:FRIENDSHIP {desde:1984}]->(m)

En este caso se indica que n y m son nodos,
que ambos poseen la propiedad ID
que los ID en particular son
y que se crea la relación indicada


Eliminar Nodos y sus relaciones.

La instrucción es la siguiente:

MATCH (n{Prop_x :’Valor_prop_x'})-[r]-()
DELETE n,r

Busca los nodos (n) cuyos Propiedad X tenga un valor definido y que cuente con cualquier relación con otros nodos. 
Identificados borra los nodos que cumplan la condición y sus relaciones

Ejemplo:
MATCH (n{nombre :'Instituto Universitario'})-[r]-()
