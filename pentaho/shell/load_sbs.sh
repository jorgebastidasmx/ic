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
#DIRLOG=/tmp/
#Ruta de la carpeta donde se generan los TXT de sujetos para la carga de score
PATH_FILES=$DIRJOB_GENERAR_SCORE

PARAMS="-param:COD_PAIS=1 -param:FILE=$DIRJOB_GENERAR_SCORE -param:KTR-LOAD=CREATE-FILES.ktr -param:SCHEMA_EPM=EPM_MSG -param:KTR-SBS=SBS.ktr -param:KTR-SICOM=SICOM.ktr -param:PATH=$PATH_FILES -param:KTR-DECOMICRO=DECO-MICRO	.ktr -param:KTR-CLEAN-CACHE=CLEAN_CACHE.ktr" 
echo "Inicio proceso carga SBS SICOM `date`" >> $DIRLOG/Process_LoadSBS$dia.log
$DIRBINPTHO/kitchen.sh -file=$DIRJOB_GENERAR_SCORE/LOAD_SBS_SICOM.kjb $PARAMS -Level:Rowlevel >> $DIRLOG/Process_LoadSBS$dia.log
