#!/bin/sh

while true; do

echo "\n"
echo "WEB Service 관련 프로세스 진단"
apache2=`ps cax | grep 'apache2'`
if [ $? -eq 0 ]; then
	echo "apache2 관련 프로세스 진단 결과 : 정상\n"
else
	echo "apache2 관련 프로세스 진단 결과 :  장애(서비스 죽음)\n"
	echo "apache2 서비스를 다시 시작합니다.\n"
	service apache2 restart
fi

echo "SSH Service 관련 프로세스 진단"
sshd=`ps cax | grep 'sshd'`
if [ $? -eq 0 ]; then
	echo "SSH 관련 프로세스 진단 결과 : 정상\n"
else
	echo "SSH 관련 프로세스 진단 결과 : 장애(서비스 죽음)\n"
	echo "SSH 서비스를 다시 시작합니다.\n"
	service sshd restart
fi

	sleep 30;
done
