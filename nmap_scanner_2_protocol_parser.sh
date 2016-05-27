#!/bin/bash

if [ $# -lt 2 ] ;
then
        echo usage : $0 protocols $2
        exit 1
fi

filename=$1
NSE=$2
filelines=`cat $filename`
# echo " usage: ./nmap_scanner_2_protocol_parser.sh protocols NSE.txt "

for proto in $filelines ; do
        echo
        echo $proto
	echo "================"
	cat $2 |grep -i $proto > NSE_Host_Scans.txt
	cat NSE_Host_Scans.txt
done
