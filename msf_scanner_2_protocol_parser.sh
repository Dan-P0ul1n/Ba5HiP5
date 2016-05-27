#!/bin/bash

if [ $# -lt 3 ] ;
then
        echo usage : $0 protocols $2
        exit 1
fi

filename=$1
MSF=$2
filelines=`cat $filename`
# echo " usage: ./msf_scanner_2_protocol_parser.sh protocols MSF.txt "

for proto in $filelines ; do
        echo
        echo $proto
	echo "================"
	cat $2 |grep -i $proto > MSF_Host_Scans.txt
	cat MSF_Host_Scans.txt
done
