####  Genera nodos extra usando como parametro la etiqueta que se desea utilizar
TIPO="beyond"
 echo "Generando extra nodos a partir del archivo Ontology procesado"
 echo "type:" $TIPO

echo BEGIN > Enode_$TIPO.txt
cut -d, -f3 miss_nodesb.txt | sort | uniq  >  tmpnodes.txt
cut -d, -f1 miss_nodesa.txt | sort | uniq  >> tmpnodes.txt
cut -d, -f1 tmpnodes.txt | sort | uniq | \
awk -F"," -v r=$TIPO  '{if (NL==1){cnt=0;iden=0};{++cnt; {if (cnt==200001){++iden ;cnt=1 ;printf "%s\n%s\n",  "COMMIT","BEGIN"}};{ printf "%s%s%s%s%s%s%s%s\n", "create (N", NR,":",r"{ cve: '"'"'", $1 , "'"'"' , name:'"'"'", $1 , "'"'"' });"}} }'  >> Enode_$TIPO.txt
echo COMMIT >> Enode_$TIPO.txt
split -l 200002 Enode_$TIPO.txt  Enode_$TIPO.txs

ls Enode_$TIPO.txs* 
echo terminado
