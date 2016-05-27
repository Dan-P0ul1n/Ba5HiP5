#!/bin/bash

if [ $# -lt 2 ] ;
then
        echo usage : $0 protocols $2
        exit 1
fi

filename=$1
nmap_results=$2
filelines=`cat $filename`
# " usage: nmap_protocol_parser_2_IP.sh protocols nmap_scan_results.txt "

for proto in $filelines ; do
        echo
        echo $proto
	echo "==============="
	cat $2 |grep --before-context=20 $proto > results.txt;
	grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' results.txt | tee Z
done
