#!/bin/sh
# /etc/*, /var/log/* 파일 전체를 백업하는 스크립트

time=`date "+%Y-%m-%d-%H-%M-%S"`
tar -zcvf /home/teraadmin/backup/$time.tar.gz /etc/* /var/log/*
echo $time
