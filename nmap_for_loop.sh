#!/bin/bash

if [ $# -lt 1 ] ; then
	echo " usage: $0 <nmap_results>"
	exit 1
fi
cat $1 |grep open|grep -v "OSScan"|sort|cut -d"/" -f2|column -t|cut -d" " -f5|sort|uniq > A

cat $1 | grep -v "exact\|MAC\|OS\|hop\|Running\|Device\|fingerprint\|shown\| \
latency\|Warning\|done\|LABS\|org" > B

sleep 1

sed '/report/{x;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;x}' -i B 2>/dev/null

byline=$(cat A)

for protocol in $byline ; do
	echo
	echo $protocol
	echo "================"
	cat B | grep -B20 $protocol > C
	grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' C
done
#RESET
cp nmap.orig.txt NMAP_all_hosts.txt
