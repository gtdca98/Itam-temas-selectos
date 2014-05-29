-- Proceso en  Postgress para ratreas nodos faltantes

-- Crear tabla de relaciones (edges)
drop table rels;
create table rels (a text, r text, d text, l text);
copy rels from '/home/ubuntu/ontology/EdgesR1Agent.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesR2Agent.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesR3Agent.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesR4Agent.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesR5Agent.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesR6Agent.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesR7Agent.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesR8Agent.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesR9Agent.txt' CSV delimiter ',';

copy rels from '/home/ubuntu/ontology/EdgesRE1Agent.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesRE2Agent.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesRE3Agent.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesRE4Agent.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesRE5Agent.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesRE6Agent.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesRE7Agent.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesRE8Agent.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesRE9Agent.txt' CSV delimiter ',';

copy rels from '/home/ubuntu/ontology/EdgesR1Event.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesR2Event.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesR3Event.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesR4Event.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesR5Event.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesR6Event.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesR7Event.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesR8Event.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesR9Event.txt' CSV delimiter ',';

copy rels from '/home/ubuntu/ontology/EdgesRE1Event.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesRE2Event.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesRE3Event.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesRE4Event.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesRE5Event.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesRE6Event.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesRE7Event.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesRE8Event.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesRE9Event.txt' CSV delimiter ',';

copy rels from '/home/ubuntu/ontology/EdgesR1Place.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesR2Place.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesR3Place.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesR4Place.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesR5Place.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesR6Place.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesR7Place.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesR8Place.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesR9Place.txt' CSV delimiter ',';

copy rels from '/home/ubuntu/ontology/EdgesRE1Place.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesRE2Place.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesRE3Place.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesRE4Place.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesRE5Place.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesRE6Place.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesRE7Place.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesRE8Place.txt' CSV delimiter ',';
copy rels from '/home/ubuntu/ontology/EdgesRE9Place.txt' CSV delimiter ',';

-- Crear tabla de nodos basicos
drop table node;
create table node (type text, cve text, name text);
copy node from '/home/ubuntu/ontology/node_PSAgent.txt' CSV delimiter ',';
copy node from '/home/ubuntu/ontology/node_PSEvent.txt' CSV delimiter ',';
copy node from '/home/ubuntu/ontology/node_PSPlace.txt' CSV delimiter ',';

-- cruces de inforacion para determinar faltantes
drop table miss_nodesa;
drop table miss_nodesb;

create table miss_nodesa as (select * from rels where not exists (select 1 from node where node.cve = rels.a));
create table miss_nodesb as (select * from rels where not exists (select 1 from node where node.cve = rels.d));

copy miss_nodesa to '/home/ubuntu/ontology/miss_nodesa.txt' CSV delimiter ',';
copy miss_nodesb to '/home/ubuntu/ontology/miss_nodesb.txt' CSV delimiter ',';
