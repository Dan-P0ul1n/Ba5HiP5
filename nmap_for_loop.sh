#!/bin/bash
if [ $# -lt 2 ] ; then
	echo " usage: $0 <protocols> <nmap_results>"
	exit 1
fi
cat $2 | grep -v "exact\|MAC\|OS\|hop\|Running\|Device\|fingerprint\|shown\| \
latency\|Warning\|done\|LABS\|org" > A
sleep 1
sed '/report/{x;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;p;x}' -i A 2>/dev/null

protocols=$1
byline=$(cat $protocols)

for proto in $byline ; do
	echo
	echo $proto
	echo "================"
	cat A | grep --before-context=20 $proto > 1
	grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' 1
done
#RESET
cp nmap.orig.txt NMAP_all_hosts.txt
