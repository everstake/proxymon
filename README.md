## Proxymon script  

### Requirements:  
1. jq.  
2. eos api node.  
3. telegram channel

### Installation
#### Install jq.  
```
sudo apt-get install jq  
```
#### Make scripts dir  
```
sudo mkdir /opt/colinproxy  
sudo chown myuser:myuser /opt/colinproxy  
```
#### Clone git repository to scripts dir  
```
git clone https://github.com/everstake/proxymon.git /opt/colinproxy  
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
