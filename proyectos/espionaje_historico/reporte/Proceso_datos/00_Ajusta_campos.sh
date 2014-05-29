#!/bin/sh
# Ajusta campos. Los archivos de dbpedia ontology estan delimitados por comas, pero cada campo
# esta entrecomillado pudiendo incluir comas internas.
# Las comas internas representan un problema en los ciclos de procesameinto ya que se interpretan
# como fin de campo y segmentan erroneamentelos campos desplazando los valores fuera del campo 
# de lectura correspondiente.
# El valor del delimitador se condisera inicialmente compuesto por tres caracteres ",", y en 
# esta rutina se leen los campos, se eliminan las comas internas, y se reescribe el archivo 
# delimitado por una coma simple.

mv Agent.csv AgentOrig.csv
mv Event.csv EventOrig.csv
mv Place.csv PlaceOrig.csv

cat AgentOrig.csv | sed 's/[()]//g'| awk -F"\",\"" -v OFS="," '{for (i=1; i<=NF; ++i) gsub(",","",$i)}1'| sed 's/__[1-9],/,/g' > Agent.csv
cat EventOrig.csv | sed 's/[()]//g'| awk -F"\",\"" -v OFS="," '{for (i=1; i<=NF; ++i) gsub(",","",$i)}1'| sed 's/__[1-9],/,/g' > Event.csv
cat PlaceOrig.csv | sed 's/[()]//g'| awk -F"\",\"" -v OFS="," '{for (i=1; i<=NF; ++i) gsub(",","",$i)}1'| sed 's/__[1-9],/,/g' > Place.csv


