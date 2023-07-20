#!/bin/bash

MAX_DAYS=`grep PASS_MAX_DAYS /etc/login.defs | \
grep -v '^#' | \
awk '{print $2}'`

MIN_DAYS=`grep PASS_MIN_DAYS /etc/login.defs | \
grep -v '^#' | \
awk '{print $2}'`

PASS_WARN=`grep PASS_WARN_AGE /etc/login.defs | \
grep -v '^#' | \
awk '{print $2}'`

MIN_LEN=`grep PASS_MIN_LEN /etc/login.defs | \
grep -v '^#' | \
awk '{print $2}'`

echo "***************************"
echo "계정 패스워드 정책 확인"
echo "***************************"


if [ ${MAX_DAYS} -gt 90 ];then
	echo "패스워드 변경주기 : $MAX_DAYS일"
	echo "패스워드 변경주기를 90일 이하로 변경해주세요\n"
else
	echo "패스워드 변경주기 : $MAX_DAYS일"
	echo "패스워드 변경주기 정상\n"
fi

if [ ${MIN_DAYS} -lt 1 ]; then
	echo "패스워드 만료시 최소사용 기간: $MIN_DAYS일"
	echo "패스워드 만료시 최소사용 기간을 최소 1일 이상으로 변경하세요\n"
else 
	echo "패스워드 만료시 최소사용 기간: $MIN_DAYS일"
	echo "패스워드 만료시 최소사용 기간 정상\n"

fi

if [ ${MIN_LEN} -lt 8 ]; then
	echo "패스워드 최소 길이 : $MIN_LEN일"
	echo "패스워드 최소 8글자 이상으로 변경해주세요\n"
else
	echo "패스워드 최소 길이 : $MIN_LEN일"
	echo "패스워드 최소 길이 정상\n"

fi

if [ ${PASS_WARN} -gt 30 ]; then
	echo "패스워드 만료 경고일 : $PASS_WARN일"
	echo "패스워드 만료 경고일을 최소 30일 일 이상으로 설정해주세요\n"
else
	echo "패스워드 만료 경고일 : $PASS_WARN일"
	echo "패스워드 만료 경고일 정상\n"
fi
