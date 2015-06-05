#!/bin/bash

#export PENTAHO_BASE_DIR=/opt/pentaho/pdi-ce-5.0.1-stable/
export PENTAHO_BASE_DIR=/Applications/pentaho/
export KETTLE_JNDI_ROOT=$PENTAHO_BASE_DIR/simple-jndi 

DIRBINPTHO=$PENTAHO_BASE_DIR

#Ruta donde se encuentran los archivos KTR y KJB
#DIRJOB_GENERAR_SCORE=/opt/tools/Pentaho/EPM/LOAD_SCORE/JOB/
DIRJOB_GENERAR_SCORE=/Users/indiegente/Documents/multiplica/ic/pentaho/

#Ruta de la carpeta LOG
#DIRLOG=/opt/tools/Pentaho/EPM/LOAD_SCORE/JOB/log/
DIRLOG=/tmp/
#Ruta de la carpeta donde se generan los TXT de sujetos para la carga de score
PATH_FILES=$DIRJOB_GENERAR_SCORE

PARAMS2="-param:SCHEMA_EPM=EPM_MSG param:KTR-LOAD-CLIENTES-SEGMENTOS=LOAD-SUJETOS-SEGMENTOS.ktr -param:KTR-LOAD-CARTERA-CLIENTES=LOAD-CARTERA-CLIENTES.ktr -param:PATH_FILES=$PATH_FILES" 
echo "Inicio proceso carga de cartera de clientes `date`" >> $DIRLOG/Process_LoadCarteraCliente.log
$DIRBINPTHO/kitchen.sh -file=$DIRJOB_GENERAR_SCORE/LOAD-CARTERA-CLIENTES.kjb $PARAMS2 -Level:Rowlevel >> $DIRLOG/Process_LoadCarteraCliente.log
$DIRBINPTHO/kitchen.sh -file=$DIRJOB_GENERAR_SCORE/LOAD-SUJETOS-SEGMENTOS.kjb $PARAMS2 -Level:Rowlevel >> $DIRLOG/Process_LoadSujetosSegmentos.log
