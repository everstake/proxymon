## Proxymon script  

### Requirements:  
1. jq.  
2. EOS node.  
3. Telegram chanel
4. Telegram bot

### Installation
#### Install jq.  
```
apt-get install jq  
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
Please open telegram application and tap "new channel". Create the public channel.  
After that you need to create the telegram bot using BotFather. When you create the bot you will receive the botkey (token to access the HTTP API). After you need start the bot tapping "start".  

### Configuration  
At first you need to configure cleos.sh. Set path to folder with cleos binary file NODEOSBINDIR variable.  
Further you can set variables in config.ini.  
Set the botkey, chanel name and other variables.
If you need to check only your account you cat set the YOURACCOUNT variable with you account name.  
You can use supervisor to start this proxymon.sh.  

