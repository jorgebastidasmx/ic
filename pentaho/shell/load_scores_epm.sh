#!/bin/bash

export PENTAHO_BASE_DIR=/opt/pentaho/pdi-ce-5.2.0.0-209/
#export PENTAHO_BASE_DIR=/Applications/pentaho/
export KETTLE_JNDI_ROOT=$PENTAHO_BASE_DIR/simple-jndi 

dia=`date +%EY%m%d%H%M|awk {'print $1'}`
DIRBINPTHO=$PENTAHO_BASE_DIR

#Ruta donde se encuentran los archivos KTR y KJB
DIRJOB_GENERAR_SCORE=/opt/EPM/JOBS/
#DIRJOB_GENERAR_SCORE=/Users/indiegente/Documents/multiplica/ic/pentaho/

#Ruta de la carpeta LOG
DIRLOG=/tmp/

#Ruta de la carpeta donde se generan los TXT de sujetos para la carga de score
PATH_FILES=$DIRJOB_GENERAR_SCORE

PARAMS="-param:COD_PAIS=1 -param:FILE=$DIRJOB_GENERAR_SCORE -param:SCHEMA_EPM=EPM_MSG -param:KTR-LOAD=CREATE-FILES.ktr -param:KTR-SBS=SBS.ktr -param:KTR-SCORE=SCORE-1.ktr -param:KTR-SICOM=SICOM.ktr -param:KTR-RISK-PREDICTOR=SCORE-RISK-PREDICTOR.ktr -param:PATH=$PATH_FILES" 

echo $PARAMS
echo "Inicio proceso carga Scores `date`" >> $DIRLOG/Process_LoadScore_$dia.log
$DIRBINPTHO/kitchen.sh -file=$DIRJOB_GENERAR_SCORE/LOAD-SCORES-FROM-DATABASE.kjb $PARAMS -Level:Rowlevel >> $DIRLOG/Process_LoadScore_$dia.log

#PARAMS2="-param:SCHEMA_EPM=EPM_MSG param:KTR-LOAD-CLIENTES-SEGMENTOS=LOAD-SUJETOS-SEGMENTOS.ktr -param:KTR-LOAD-CARTERA-CLIENTES=LOAD-CARTERA-CLIENTES.ktr -param:PATH_FILES=$PATH_FILES" 
#echo "Inicio proceso carga de cartera de clientes `date`" >> $DIRLOG/Process_LoadCarteraCliente$dia.log
#$DIRBINPTHO/kitchen.sh -file=$DIRJOB_GENERAR_SCORE/LOAD-CARTERA-CLIENTES.kjb $PARAMS2 -Level:Rowlevel >> $DIRLOG/Process_LoadCarteraCliente.log
#$DIRBINPTHO/kitchen.sh -file=$DIRJOB_GENERAR_SCORE/LOAD-SUJETOS-SEGMENTOS.kjb $PARAMS2 -Level:Rowlevel >> $DIRLOG/Process_LoadSujetosSegmentos.log
