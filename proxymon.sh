#!/bin/bash

proxyread ()
{
PROXY_ACC=$(cat ${PWD}/config.ini | grep -v "#" | grep PROXY_ACC | awk -F '=' '{print $2}')
PROXY_SCOPE=$(cat ${PWD}/config.ini | grep -v "#" | grep PROXY_SCOPE | awk -F '=' '{print $2}')
PROXY_TABLE=$(cat ${PWD}/config.ini | grep -v "#" | grep PROXY_TABLE | awk -F '=' '{print $2}')
TRESHOLD=$(cat ${PWD}/config.ini | grep -v "#" | grep TRESHOLD | awk -F '=' '{print $2}')
LIMIT=$(cat ${PWD}/config.ini | grep -v "#" | grep LIMIT | awk -F '=' '{print $2}')
YOURACCOUNT=$(cat ${PWD}/config.ini | grep -v "#" | grep YOURACCOUNT | awk -F '=' '{print $2}')
if [[ -z "$YOURACCOUNT" ]]
then
        DD=$($CLEOS get table $PROXY_ACC $PROXY_SCOPE $PROXY_TABLE  -l $LIMIT | jq '.rows' | jq 'map({ (.account_name): .total_eos }) | add'| awk -F: '{print $1 $2}'| sed  -e 's/"//g' |sed  -e 's/,//g'|sed  -e 's/EOS//g'|sed -e 's/{//g'| sed -e 's/}//g'| awk -v t="$TRESHOLD" '/^$/ {next}; { if ($2<=t) print $1" "$2" EOS\n"}')
else
        DD=$($CLEOS get table $PROXY_ACC $PROXY_SCOPE $PROXY_TABLE  -l $LIMIT | jq '.rows' | jq 'map({ (.account_name): .total_eos }) | add'| awk -F: '{print $1 $2}'| sed  -e 's/"//g' |sed  -e 's/,//g'|sed  -e 's/EOS//g'|sed -e 's/{//g'| sed -e 's/}//g'| awk -v t="$TRESHOLD" '/^$/ {next}; { if ($2<=t) print $1" "$2 " EOS\n"}'|grep $YOURACCOUNT)
fi
curl -s -X POST https://api.telegram.org/bot$BOTNUMBER/sendMessage -d chat_id=$CHATID -d text="Treshold <= $TRESHOLD EOS $(echo -e "%0A%0A")$DD"
}

CLEOS=$(cat ${PWD}/config.ini | grep -v "#" | grep CLEOS | awk -F '=' '{print $2}')
CHATID=$(cat ${PWD}/config.ini | grep -v "#" | grep CHATID | awk -F '=' '{print $2}')
BOTNUMBER=$(cat ${PWD}/config.ini | grep -v "#" | grep BOTNUMBER | awk -F '=' '{print $2}')
while true; do
   proxyread;
   sleep 3600;
done

