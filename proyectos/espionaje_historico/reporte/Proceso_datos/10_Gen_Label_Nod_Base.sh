#!/bin/sh
####  Genera Etiquetas nodos usando como parametro la etiqueta que se desea utilizar
TIPO=$1
 echo "Generando etiquetas de nodos a partir del archivo Ontology procesado"
echo "type:" $TIPO
if [[ $TIPO == 'Agent' ]]; then 
   Col3=822
fi
if [[ $TIPO == 'Event' ]]; then 
   Col3=2963
fi
if [[ $TIPO == 'Place' ]]; then 
   Col3=609
fi

Cadena=',Agent\>\|,Deity\>\|,Family\>\|,NobleFamily\>\|,Organisation\>\|,Band\>\|,Broadcaster\>\|,ClericalOrder\>\|,ComedyGroup\>\|,Company\>\|,EducationalInstitution\>\|,GeopoliticalOrganisation\>\|,GovernmentAgency\>\|,Group\>\|,Legislature\>\|,MilitaryUnit\>\|,Non-ProfitOrganisation\>\|,Parliament\>\|,PoliticalParty\>\|,SambaSchool\>\|,SportsLeague\>\|,SportsTeam\>\|,TermOfOffice\>\|,TradeUnion\>\|,Person\>\|,Ambassador\>\|,Archeologist\>\|,Architect\>\|,Aristocrat\>\|,Artist\>\|,Astronaut\>\|,Athlete\>\|,BeautyQueen\>\|,Bullfighter\>\|,BusinessPerson\>\|,Celebrity\>\|,Chef\>\|,Cleric\>\|,Coach\>\|,Criminal\>\|,Economist\>\|,Egyptologist\>\|,Engineer\>\|,Farmer\>\|,FictionalCharacter\>\|,Historian\>\|,HorseTrainer\>\|,Journalist\>\|,Judge\>\|,Linguist\>\|,MilitaryPerson\>\|,Model\>\|,Monarch\>\|,MythologicalFigure\>\|,Noble\>\|,OfficeHolder\>\|,OrganisationMember\>\|,Philosopher\>\|,PlayboyPlaymate\>\|,Politician\>\|,PoliticianSpouse\>\|,Presenter\>\|,Psychologist\>\|,Referee\>\|,Religious\>\|,RomanEmperor\>\|,Royalty\>\|,Scientist\>\|,SportsManager\>\|,TelevisionPersonality\>\|,Event\>\|,LifeCycleEvent\>\|,PersonalEvent\>\|,Birth\>\|,Death\>\|,Divorce\>\|,Marriage\>\|,NaturalEvent\>\|,SolarEclipse\>\|,SocietalEvent\>\|,Convention\>\|,Election\>\|,ElectionDiagram\>\|,FilmFestival\>\|,Meeting\>\|,MilitaryConflict\>\|,MusicFestival\>\|,SpaceMission\>\|,SportsEvent\>\|,Place\>\|,ArchitecturalStructure\>\|,Building\>\|,Garden\>\|,Infrastructure\>\|,NoteworthyPartOfBuilding\>\|,Park\>\|,Cemetery\>\|,Community\>\|,CountrySeat\>\|,HistoricPlace\>\|,Monument\>\|,GraveMonument\>\|,Memorial\>\|,NaturalPlace\>\|,Archipelago\>\|,BodyOfWater\>\|,Cave\>\|,Crater\>\|,Glacier\>\|,HotSpring\>\|,Mountain\>\|,MountainPass\>\|,MountainRange\>\|,Valley\>\|,Volcano\>\|,PopulatedPlace\>\|,Agglomeration\>\|,Continent\>\|,Country\>\|,Department\>\|,Intercommunality\>\|,Island\>\|,Locality\>\|,Prefecture\>\|,Region\>\|,Settlement\>\|,State\>\|,Street\>\|,ProtectedArea\>\|,SiteOfSpecialScientificInterest\>\|,SkiArea\>\|,SkiResort\>\|,SportFacility\>\|,CricketGround\>\|,GolfCourse\>\|,RaceTrack\>\|,Stadium\>\|,WineRegion\>\|,WorldHeritageSite\>'

cat $TIPO.csv | cut -d, -f1,$Col3 | sed '1,4d' | sed 's/|/,/g' | sed 's/[{}"]//g'| sed 's/[ ]//g' | awk -F"," '{for (i=1;i<= NF;++i){gsub(/.*\//,"" ,$i)};{for (i=2;i<= NF;++i){printf "%s,%s\n",$1,$i}}}' |  grep -v -i ',NULL\|,owl#Thing\|,Agent\|,Event\|,Place' |  grep -v  ',-\|,0\|,1\|,2\|,3\|,4\|,5\|,6\|,7\|,8\|,9' | grep -i "^ A : \"$Cadena\"" | sort | uniq | awk -F"," '{gsub("-","",$2); printf "%s,%s\n",$1,tolower($2)}' |  sed 's/__[1-9],/,/g'   > label_$TIPO.txt

echo BEGIN > label_Bas$TIPO.txt
cat  label_$TIPO.txt | sed 's/[ ]*$//'| sed 's#'"'"'#\\'"'"'#g' | \
awk -F"," -v r=$TIPO  '{r=tolower(r);if (NL==1){cnt=0;iden=0};{++cnt; {if (cnt==200001){++iden ;cnt=1 ;printf "%s\n%s\n",  "COMMIT","BEGIN"}};{ printf "%s%s%s%s%s%s%s\n", "match (n:",r," { cve: '"'"'", $1 , "'"'"' }) set n:",$2,";"}} }'  >> label_Bas$TIPO.txt
echo COMMIT >> label_Bas$TIPO.txt

split -l 200002 label_Bas$TIPO.txt  label_Bas$TIPO.txs

ls label_Bas$TIPO.txs* 
echo terminado
