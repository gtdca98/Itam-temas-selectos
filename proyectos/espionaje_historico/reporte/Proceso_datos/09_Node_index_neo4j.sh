## indizado de la base de datos sobre etiqueta y nodos

create index on :agent(cve);
create index on :event(cve);
create index on :place(cve);
create index on :beyond(cve);

###  integrando etiqueta base general.

match (n:agent) set n:base;
match (m:event) set m:base;
match (o:place) set o:base;
match (p:beyond) set o:base;

##  creando indice para etiqueta base general.
create index on :base(cve);

