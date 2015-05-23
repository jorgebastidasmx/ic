#!/bin/sh
values=`cat $1`
for n in $values; do
	#echo $n
	echo "INSERT INTO EPMC_CLIE_SUJE(COD_CLIE_SUJE, COD_CLIE,COD_SUJE) VALUES (SQ_EPMC_CLIE_SUJE_0001.NEXTVAL,11,$n);"
done