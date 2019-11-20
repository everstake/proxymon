## Proxymon
This simple telegram bot notifies users when the balance of their EOS account(s) gets less than 5 EOS through direct messages on Telegram. We are going to add additional features such as configurable thresholds for specific accounts and alert notifications.

Working example: https://t.me/colinproxybot

### Requirements:  
1. jq 
2. eos api node (cleos)
3. telegram channel

### Installation
#### Install jq  
```
sudo apt-get install jq  
```
#### Make scripts dir  
```
sudo mkdir /opt/proxymon 
sudo chown myuser:myuser /opt/proxymon
```
#### Clone git repository to scripts dir  
```
git clone https://github.com/everstake/proxymon.git /opt/proxymon
```
#### Create telegram chanel
Just open telegram application and tap "new channel". Create the public channel.  
After that you need to create the telegram bot using BotFather. When you created bot you will receive the botkey (token to access the HTTP API), then you need start the bot tapping "start".  

### Configuration  
Set variables in config.ini:

```
PROXY_ACC=exampleacc
PROXY_SCOPE=exampleacc
PROXY_TABLE=examplebp
TABLEACC=exampletable
TABLEFUND=exampletable
TRESHOLD=5
LIMIT=1000
YOURACCOUNT=
CLEOS=/opt/dir_with_sleos_sh_script/cleos.sh
CHATID=@nameofchat
BOTNUMBER=1111111111:xxxxxxxxxxxxxxxxxxxxxxxxx
```

where TRESHOLD minimun EOS on balance.

If you need to check only your account you cat set the YOURACCOUNT variable with you account name.  
You can use supervisor with this bot.  
