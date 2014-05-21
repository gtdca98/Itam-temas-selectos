#!/bin/sh
### Genera Etiquetas extras
TIPO="base"
 echo "Generando extra labels a partir del archivo Ontology procesado"
 echo "type:" $TIPO

Cadena=',Agent\>\|,Deity\>\|,Family\>\|,NobleFamily\>\|,Organisation\>\|,Band\>\|,Broadcaster\>\|,ClericalOrder\>\|,ComedyGroup\>\|,Company\>\|,EducationalInstitution\>\|,GeopoliticalOrganisation\>\|,GovernmentAgency\>\|,Group\>\|,Legislature\>\|,MilitaryUnit\>\|,Non-ProfitOrganisation\>\|,Parliament\>\|,PoliticalParty\>\|,SambaSchool\>\|,SportsLeague\>\|,SportsTeam\>\|,TermOfOffice\>\|,TradeUnion\>\|,Person\>\|,Ambassador\>\|,Archeologist\>\|,Architect\>\|,Aristocrat\>\|,Artist\>\|,Astronaut\>\|,Athlete\>\|,BeautyQueen\>\|,Bullfighter\>\|,BusinessPerson\>\|,Celebrity\>\|,Chef\>\|,Cleric\>\|,Coach\>\|,Criminal\>\|,Economist\>\|,Egyptologist\>\|,Engineer\>\|,Farmer\>\|,FictionalCharacter\>\|,Historian\>\|,HorseTrainer\>\|,Journalist\>\|,Judge\>\|,Linguist\>\|,MilitaryPerson\>\|,Model\>\|,Monarch\>\|,MythologicalFigure\>\|,Noble\>\|,OfficeHolder\>\|,OrganisationMember\>\|,Philosopher\>\|,PlayboyPlaymate\>\|,Politician\>\|,PoliticianSpouse\>\|,Presenter\>\|,Psychologist\>\|,Referee\>\|,Religious\>\|,RomanEmperor\>\|,Royalty\>\|,Scientist\>\|,SportsManager\>\|,TelevisionPersonality\>\|,Event\>\|,LifeCycleEvent\>\|,PersonalEvent\>\|,Birth\>\|,Death\>\|,Divorce\>\|,Marriage\>\|,NaturalEvent\>\|,SolarEclipse\>\|,SocietalEvent\>\|,Convention\>\|,Election\>\|,ElectionDiagram\>\|,FilmFestival\>\|,Meeting\>\|,MilitaryConflict\>\|,MusicFestival\>\|,SpaceMission\>\|,SportsEvent\>\|,Place\>\|,ArchitecturalStructure\>\|,Building\>\|,Garden\>\|,Infrastructure\>\|,NoteworthyPartOfBuilding\>\|,Park\>\|,Cemetery\>\|,Community\>\|,CountrySeat\>\|,HistoricPlace\>\|,Monument\>\|,GraveMonument\>\|,Memorial\>\|,NaturalPlace\>\|,Archipelago\>\|,BodyOfWater\>\|,Cave\>\|,Crater\>\|,Glacier\>\|,HotSpring\>\|,Mountain\>\|,MountainPass\>\|,MountainRange\>\|,Valley\>\|,Volcano\>\|,PopulatedPlace\>\|,Agglomeration\>\|,Continent\>\|,Country\>\|,Department\>\|,Intercommunality\>\|,Island\>\|,Locality\>\|,Prefecture\>\|,Region\>\|,Settlement\>\|,State\>\|,Street\>\|,ProtectedArea\>\|,SiteOfSpecialScientificInterest\>\|,SkiArea\>\|,SkiResort\>\|,SportFacility\>\|,CricketGround\>\|,GolfCourse\>\|,RaceTrack\>\|,Stadium\>\|,WineRegion\>\|,WorldHeritageSite\>'

cat miss_nodesb.txt | cut -d, -f3,4 | grep -v -i ',NULL\|,owl#Thing\|,Agent\|,Event\|,Place' |  grep -i "^ A : \"$Cadena\"" | sort | uniq | awk -F"," '{gsub("-","",$2); printf "%s,%s\n",$1,tolower($2)}' |  sed 's/__[1-9],/,/g'   > Elabel_$TIPO.txt

echo BEGIN > Elabel_Bas$TIPO.txt
cat  Elabel_$TIPO.txt  | awk -F"," -v r=$TIPO  '{r=tolower(r);if (NL==1){cnt=0;iden=0};{++cnt; {if (cnt==200001){++iden ;cnt=1 ;printf "%s\n%s\n",  "COMMIT","BEGIN"}};{ printf "%s%s%s%s%s%s%s\n", "match (n:",r," { cve: '"'"'", $1 , "'"'"' }) set n:",$2,";"}} }'  >> Elabel_Bas$TIPO.txt

echo COMMIT >> Elabel_Bas$TIPO.txt
split -l 200002 Elabel_Bas$TIPO.txt  Elabel_Bas$TIPO.txs

ls Elabel_Bas$TIPO.txs* 
echo terminado
