#!/bin/bash
netstat -tulnap | grep CLOSE_WAIT | awk '{print $4,$5}' |  sed 's/:/ /g' | while read line; do
	perl /opt/scripts/killcw.pl $line;
done

