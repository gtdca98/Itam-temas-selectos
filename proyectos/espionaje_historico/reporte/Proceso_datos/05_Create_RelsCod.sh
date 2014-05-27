#!/bin/bash
####  Genera la codificacion en cypher de las aristas relaciones  usando como parámetro la etiqueta que se desea utilizar
TIPO=$1
j=$2
echo "Generando Relaciones a partir del archivo Ontology procesado"
echo "type:" $TIPO
# La Cadena representa una eleccion particular de relaciones que enlazan al menos al 80 % de cada clase y se integran al listado general
Cadena=',Agent\>\|,Deity\>\|,Family\>\|,NobleFamily\>\|,Organisation\>\|,Band\>\|,Broadcaster\>\|,ClericalOrder\>\|,ComedyGroup\>\|,Company\>\|,EducationalInstitution\>\|,GeopoliticalOrganisation\>\|,GovernmentAgency\>\|,Group\>\|,Legislature\>\|,MilitaryUnit\>\|,Non-ProfitOrganisation\>\|,Parliament\>\|,PoliticalParty\>\|,SambaSchool\>\|,SportsLeague\>\|,SportsTeam\>\|,TermOfOffice\>\|,TradeUnion\>\|,Person\>\|,Ambassador\>\|,Archeologist\>\|,Architect\>\|,Aristocrat\>\|,Artist\>\|,Astronaut\>\|,Athlete\>\|,BeautyQueen\>\|,Bullfighter\>\|,BusinessPerson\>\|,Celebrity\>\|,Chef\>\|,Cleric\>\|,Coach\>\|,Criminal\>\|,Economist\>\|,Egyptologist\>\|,Engineer\>\|,Farmer\>\|,FictionalCharacter\>\|,Historian\>\|,HorseTrainer\>\|,Journalist\>\|,Judge\>\|,Linguist\>\|,MilitaryPerson\>\|,Model\>\|,Monarch\>\|,MythologicalFigure\>\|,Noble\>\|,OfficeHolder\>\|,OrganisationMember\>\|,Philosopher\>\|,PlayboyPlaymate\>\|,Politician\>\|,PoliticianSpouse\>\|,Presenter\>\|,Psychologist\>\|,Referee\>\|,Religious\>\|,RomanEmperor\>\|,Royalty\>\|,Scientist\>\|,SportsManager\>\|,TelevisionPersonality\>\|,Event\>\|,LifeCycleEvent\>\|,PersonalEvent\>\|,Birth\>\|,Death\>\|,Divorce\>\|,Marriage\>\|,NaturalEvent\>\|,SolarEclipse\>\|,SocietalEvent\>\|,Convention\>\|,Election\>\|,ElectionDiagram\>\|,FilmFestival\>\|,Meeting\>\|,MilitaryConflict\>\|,MusicFestival\>\|,SpaceMission\>\|,SportsEvent\>\|,Place\>\|,ArchitecturalStructure\>\|,Building\>\|,Garden\>\|,Infrastructure\>\|,NoteworthyPartOfBuilding\>\|,Park\>\|,Cemetery\>\|,Community\>\|,CountrySeat\>\|,HistoricPlace\>\|,Monument\>\|,GraveMonument\>\|,Memorial\>\|,NaturalPlace\>\|,Archipelago\>\|,BodyOfWater\>\|,Cave\>\|,Crater\>\|,Glacier\>\|,HotSpring\>\|,Mountain\>\|,MountainPass\>\|,MountainRange\>\|,Valley\>\|,Volcano\>\|,PopulatedPlace\>\|,Agglomeration\>\|,Continent\>\|,Country\>\|,Department\>\|,Intercommunality\>\|,Island\>\|,Locality\>\|,Prefecture\>\|,Region\>\|,Settlement\>\|,State\>\|,Street\>\|,ProtectedArea\>\|,SiteOfSpecialScientificInterest\>\|,SkiArea\>\|,SkiResort\>\|,SportFacility\>\|,CricketGround\>\|,GolfCourse\>\|,RaceTrack\>\|,Stadium\>\|,WineRegion\>\|,WorldHeritageSite\>'

cat Rels/R$j*$TIPO.txt | grep -v ".jpg" | grep -v "depiction," | grep -v "homepage," | grep -v "thumbnail," | grep -v "22-rdf-syntax" | sed 's/ //g' | sed 's/[ ]*$//' | sed 's#'"'"'#\\'"'"'#g' |  awk -F"," '($3 !="")' | grep -i "^ A : \"$Cadena\"" | awk -F"," '{gsub("-","",$4);gsub("#","",$2);gsub("-","",$2); printf "%s,%s,%s,%s\n",$1,$2,$3,tolower($4)}' | sort | uniq | grep -v ',,,' | sed 's/__[1-9],/,/g'   > EdgesR$j$TIPO.txt
echo Listado general generado

# el listado general extra es el resto de las relacines por debajo del 20% de representatividad se genera en caso de que se opte por integrarlo

cat Rels/R$j*$TIPO.txt | grep -v ".jpg" | grep -v "depiction," | grep -v "homepage," | grep -v "thumbnail," | grep -v "22-rdf-syntax" | sed 's/ //g' | sed 's/[ ]*$//'| sed 's#'"'"'#\\'"'"'#g' |  awk -F"," '($3 !="")' |grep -v -i "^ A : \"$Cadena\"" | awk -F"," '{gsub("-","",$4);gsub("#","",$2);gsub("-","",$2); printf "%s,%s,%s,%s\n",$1,$2,$3,tolower($4)}' | sort | uniq | grep -v ',,,' | sed 's/__[1-9],/,/g'  > EdgesRE$j$TIPO.txt
echo Listado general extra  generado

echo  BEGIN > Edges_Bas$j$TIPO.txt
cat  EdgesR$j$TIPO.txt | awk -F"," -v r=$TIPO '{r=tolower(r);if (NL==1){cnt=0};{++cnt; {if (cnt==200001){++iden ;cnt=1 ;printf "%s\n%s\n",  "COMMIT","BEGIN"}};{printf "%s%s%s%s%s%s%s%s%s%s%s%s%s%s\n", "MATCH (n:",r," {cve:'"'"'",$1,"'"'"'","}),"," (m:",$4," {cve:'"'"'",$3,"'"'"'","}) create(n)-[:",$2,"]->(m); " }}} ' >> Edges_Bas$j$TIPO.txt
echo COMMIT >> Edges_Bas$j$TIPO.txt

split -l 200002 Edges_Bas$j$TIPO.txt  Edges_Bas$j$TIPO.txs

ls Edges_Bas$j$TIPO.txs* 

echo  BEGIN > Edges_BasE$j$TIPO.txt
cat  EdgesRE$j$TIPO.txt | awk -F"," -v r=$TIPO '{r=tolower(r);if (NL==1){cnt=0};{++cnt; {if (cnt==200001){++iden ;cnt=1 ;printf "%s\n%s\n",  "COMMIT","BEGIN"}};{printf "%s%s%s%s%s%s%s%s%s%s%s%s%s%s\n", "MATCH (n:",r," {cve:'"'"'",$1,"'"'"'","}),"," (m:",$4," {cve:'"'"'",$3,"'"'"'","}) create(n)-[:",$2,"]->(m); " }}} ' >> Edges_BasE$j$TIPO.txt
echo COMMIT >> Edges_BasE$j$TIPO.txt

split -l 200002 Edges_BasE$j$TIPO.txt  Edges_BasE$j$TIPO.txs

ls Edges_BasE$j$TIPO.txs* 

echo proceso terminado
