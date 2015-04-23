#!/bin/bash

export PENTAHO_BASE_DIR=/opt/pentaho/pdi-ce-5.0.1-stable
export KETTLE_JNDI_ROOT=$PENTAHO_BASE_DIR/simple-jndi 

dia=`date +%EY%m%d%H%M|awk {'print $1'}`
DIRBINPTHO=/opt/pentaho/pdi-ce-5.0.1-stable
DIRJOB_GENERAR_SCORE=/opt/tools/Pentaho/EPM/LOAD_SCORE/JOB
DIRLOG=/opt/tools/Pentaho/EPM/LOAD_SCORE/JOB/log
PATH_FILES=/opt/tools/Pentaho/EPM/LOAD_SCORE/JOB/

PARAMS="-param:COD_PAIS=1 -param:FILE=/home/pentaho5/PENTAHO_JOBS/EPM/ -param:SCHEMA_EPM=EPM_MSG -param:KTR-LOAD=CREATE-FILES.ktr -param:KTR-SBS=SBS.ktr -param:KTR-SCORE=SCORE-1.ktr -param:KTR-SICOM=SICOM.ktr -param:KTR-RISK-PREDICTOR=SCORE-RISK-PREDICTOR.ktr -param:PATH=$PATH_FILES" 
PARAMS2="-param:SCHEMA_EPM=EPM_MSG -param:KTR-LOAD-CARTERA-CLIENTES=LOAD-CARTERA-CLIENTES.ktr -param:PATH_FILES=$PATH_FILES" 

#echo $PARAMS
echo "Inicio proceso carga Scores `date`" >> $DIRLOG/Process_LoadScore_$dia.log
echo "Inicio proceso carga de cartera de clientes `date`" >> $DIRLOG/Process_LoadCarteraCliente$dia.log

$DIRBINPTHO/kitchen.sh -file=$DIRJOB_GENERAR_SCORE/LOAD-CARTERA-CLIENTES.kjb $PARAMS2 -Level:Basic >> $DIRLOG/Process_LoadCarteraCliente$dia.log
$DIRBINPTHO/kitchen.sh -file=$DIRJOB_GENERAR_SCORE/LOAD-SCORES-FROM-DATABASE.kjb $PARAMS -Level:Basic >> $DIRLOG/Process_LoadScore_$dia.log

