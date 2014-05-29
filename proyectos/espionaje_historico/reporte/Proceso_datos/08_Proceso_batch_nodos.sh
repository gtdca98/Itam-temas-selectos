#!/bin/bash

bash CREATE_NEO4J.sh node_BasAgent.txsaa >Aaa.out
bash CREATE_NEO4J.sh node_BasAgent.txsab >Aab.out
bash CREATE_NEO4J.sh node_BasAgent.txsac >Aac.out
bash CREATE_NEO4J.sh node_BasAgent.txsad >Aad.out

bash CREATE_NEO4J.sh node_BasEvent.txsaa >Eva.out

bash CREATE_NEO4J.sh node_BasPlace.txsaa >Paa.out
bash CREATE_NEO4J.sh node_BasPlace.txsab >Pab.out 
bash CREATE_NEO4J.sh node_BasPlace.txsac >Pac.out
bash CREATE_NEO4J.sh node_BasPlace.txsad >Pad.out

bash CREATE_NEO4J.sh Enode_beyond.txsaa >Eaa.out
bash CREATE_NEO4J.sh Enode_beyond.txsab >Eab.out
bash CREATE_NEO4J.sh Enode_beyond.txsac >Eac.out
bash CREATE_NEO4J.sh Enode_beyond.txsad >Ead.out
bash CREATE_NEO4J.sh Enode_beyond.txsae >Eae.out
