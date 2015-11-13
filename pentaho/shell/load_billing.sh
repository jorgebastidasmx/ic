#!/bin/bash

export PENTAHO_BASE_DIR=/opt/pentaho/pdi-ce-5.2.0.0-209/
#export PENTAHO_BASE_DIR=/Applications/pentaho/
export KETTLE_JNDI_ROOT=$PENTAHO_BASE_DIR/simple-jndi 

dia=`date +%EY%m%d%H%M|awk {'print $1'}`
DIRBINPTHO=$PENTAHO_BASE_DIR

#Ruta donde se encuentran los archivos KTR y KJB
DIRJOB_GENERAR_BILLING=/opt/tools/Pentaho52/EPM/LOAD_SCORE/JOB/

#Ruta de la carpeta LOG
DIRLOG=/opt/tools/Pentaho52/EPM/LOAD_SCORE/JOB/log/
#Ruta de la carpeta donde se generan los TXT de sujetos para la carga de score
PATH_FILES=$DIRJOB_GENERAR_BILLING

PARAMS="-param:COD_PAIS=1 -param:SCHEMA_EPM=EPM_MSG -param:SCHEMA_FACT=EFX_FACTURACION -param:PATH=$PATH_FILES -param:KTR-BILLING=LOAD_BILLING.ktr" 
echo "Inicio proceso facturacion `date`" >> $DIRLOG/Process_Facturacion.log
$DIRBINPTHO/kitchen.sh -file=$DIRJOB_GENERAR_BILLING/LOAD_BILLING.kjb $PARAMS -Level:Rowlevel >> $DIRLOG/Process_Facturacion$dia.log
