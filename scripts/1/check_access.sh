#!/bin/sh
# tail -n 10 /var/log/apache2/access* | awk '{print $1}' |sort |uniq -c| sort
#2020. 11. 29. (일) 21:54:05 KST 

while true; do
	date
	cat /var/log/apache2/access.log | awk '{print $1}' | sort -n | uniq -c | sort -nr | head -20
	sleep 30;
done
