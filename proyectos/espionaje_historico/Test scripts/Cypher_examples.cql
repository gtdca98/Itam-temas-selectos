-- Creates and updates properties
CREATE (movie:Movie {title: "Mystic River", released:1993}) return movie; # Return clause only for reviewing
MATCH (movie:Movie) WHERE movie.title="Mystic River" SET movie.released = 2003 RETURN movie;

-- Creates relations
MATCH (me:Person), (movie:Movie)      
WHERE me.name="My Name" AND 
      movie.title="Mystic River"
CREATE (me)-[:REVIEWED {rating:80, summary:"tragic character movie"}]->(movie);

MATCH (me:Person {name:"My Name"}), 
      (movie:Movie {title:"Mystic River"})      
CREATE (me)-[:REVIEWED {rating:80, summary:"tragic character movie"}]->(movie);

-- Adding relations merging if existed
MATCH (clint:Person),(mystic:Movie)      
WHERE clint.name="Clint Eastwood" AND mystic.title="Mystic River"
MERGE (clint)-[:DIRECTED]->(mystic)
RETURN clint, mystic;

MATCH (movie:Movie {title:"Mystic River"),
      (kevin:Person {name:"Kevin Bacon"})
MERGE (kevin)-[r:ACTED_IN]->(movie)
ON CREATE SET r.roles=["Sean"]

-- Knows query
MATCH (a)-[:ACTED_IN|:DIRECTED]->()<-[:ACTED_IN|:DIRECTED]-(b)
WHERE NOT (a)-[:KNOWS]-(b)
MERGE (a)-[:KNOWS]->(b);

-- To delete a node
MATCH (me:Person {name:"My Name"})
OPTIONAL MATCH (me)-[r]-()
DELETE me,r;

-- Traer las relaciones de longitud variables
MATCH (keanu:Person)-[:KNOWS*2]->(fof)
WHERE keanu.name = "Keanu Reeves"
RETURN DISTINCT fof.name;

-- Shortest path 
MATCH (keanu:Person {name:"Keanu Reeves"}), 
      (kevin:Person {name:"Kevin Bacon"})
MATCH p=shortestPath((keanu)-[:KNOWS*]->(kevin))
RETURN [ n in nodes(p)[1..-1] | n.name ], keanu, kevin;