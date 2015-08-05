#!/bin/bash

export PENTAHO_BASE_DIR=/opt/pentaho/pdi-ce-5.0.1-stable/
#export PENTAHO_BASE_DIR=/Applications/pentaho/
export KETTLE_JNDI_ROOT=$PENTAHO_BASE_DIR/simple-jndi 

dia=`date +%EY%m%d%H%M|awk {'print $1'}`
DIRBINPTHO=$PENTAHO_BASE_DIR

#Ruta donde se encuentran los archivos KTR y KJB
DIRJOB_GENERAR_SCORE=/opt/tools/Pentaho/EPM/LOAD_SCORE/JOB/
#DIRJOB_GENERAR_SCORE=/Users/indiegente/Documents/multiplica/ic/pentaho/

#Ruta de la carpeta LOG
DIRLOG=/opt/tools/Pentaho/EPM/LOAD_SCORE/JOB/log/
#Ruta de la carpeta donde se generan los TXT de sujetos para la carga de score
PATH_FILES=$DIRJOB_GENERAR_SCORE

PARAMS="-param:COD_PAIS=1 -param:FILE=$DIRJOB_GENERAR_SCORE -param:SCHEMA_EPM=EPM_MSG -param:KTR-LOAD=CREATE-FILES-DIARIO.ktr -param:KTR-SCORE=SCORE-1.ktr -param:KTR-RISK-PREDICTOR=SCORE-RISK-PREDICTOR.ktr  -param:MICROFINANZAS_2_0.ktr -param:PATH=$PATH_FILES" 
PARAMS_TEST="-param:COD_PAIS=1 -param:JURIDICA=juridica.txt -param:NATURAL=natural.txt -param:FILE=$DIRJOB_GENERAR_SCORE -param:SCHEMA_EPM=EPM_MSG -param:KTR-LOAD=CREATE-FILES-DIARIO.ktr -param:KTR-SCORE=SCORE-1.ktr -param:KTR-RISK-PREDICTOR=SCORE-RISK-PREDICTOR.ktr -param:PATH=$PATH_FILES -param:KTR-CLEAN-CACHE=CLEAN_CACHE.ktr"  

echo $PARAMS
echo "Inicio proceso carga Scores `date`" >> $DIRLOG/Process_LoadScore.log
$DIRBINPTHO/kitchen.sh -file=$DIRJOB_GENERAR_SCORE/LOAD-SCORES-FROM-DATABASE.kjb $PARAMS -Level:Rowlevel >> $DIRLOG/Process_LoadScore.log
#$DIRBINPTHO/kitchen.sh -file=$DIRJOB_GENERAR_SCORE/LOAD-SCORES-FROM-FILE-TEST.kjb $PARAMS_TEST -Level:Rowlevel >> $DIRLOG/Process_LoadScore.log

#PARAMS2="-param:SCHEMA_EPM=EPM_MSG param:KTR-LOAD-CLIENTES-SEGMENTOS=LOAD-SUJETOS-SEGMENTOS.ktr -param:KTR-LOAD-CARTERA-CLIENTES=LOAD-CARTERA-CLIENTES.ktr -param:PATH_FILES=$PATH_FILES" 
#echo "Inicio proceso carga de cartera de clientes `date`" >> $DIRLOG/Process_LoadCarteraCliente$dia.log
#$DIRBINPTHO/kitchen.sh -file=$DIRJOB_GENERAR_SCORE/LOAD-CARTERA-CLIENTES.kjb $PARAMS2 -Level:Rowlevel >> $DIRLOG/Process_LoadCarteraCliente.log
#$DIRBINPTHO/kitchen.sh -file=$DIRJOB_GENERAR_SCORE/LOAD-SUJETOS-SEGMENTOS.kjb $PARAMS2 -Level:Rowlevel >> $DIRLOG/Process_LoadSujetosSegmentos.log
