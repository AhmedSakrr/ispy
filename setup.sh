#!/bin/bash
#Colors
white="\033[1;37m"
grey="\033[0;37m"
purple="\033[0;35m"
red="\033[1;31m"
green="\033[1;32m"
yellow="\033[1;33m"
Cyan="\033[0;36m"
Cafe="\033[0;33m"
Fiuscha="\033[0;35m"
blue="\033[1;34m"
nc="\e[0m"
#
path=/usr/share/metasploit-framework/modules/exploits/windows/smb/eternalblue_doublepulsar.rb   # Path install eternalblue_doublepulsar.rb
clear
if hash msfconsole 2>/dev/null; then
echo -e "$white[$green+$white] Metasploit installed $nc"
else
echo -e "$white[$green!$white]$red Metasploit not installed$nc"
echo -e "$blue installing ..$nc"
apt update
apt install metasploit-framework
echo -e "$white[$green+$white] Metasploit installed successfully."
fi

if hash curl 2>/dev/null; then
echo -e "$white[$green+$white] Curl installed $nc"
else
echo -e "$white[$green!$white]$red Curl not installed$nc"
echo -e "$blue installing ..$nc"
apt update
apt install curl
echo -e "$white[$green+$white] Curl installed successfully."
fi

if hash python 2>/dev/null; then
echo -e "$white[$green+$white] Python installed $nc"
else
echo -e "$white[$green!$white]$red Python not installed$nc"
echo -e "$blue installing ..$nc"
apt update; apt install python
echo -e "$white[$green+$white] Python installed successfully."
fi

if [ -f $path ]; then 
echo -e "$white[$green+$white] DoublePulsar installed$nc "
else
echo -e "$white[$green!$white]$red DoublePulsar not installed$nc"
echo -e "$blue installing ..$nc"
tmppath=$PWD
git clone https://github.com/ElevenPaths/Eternalblue-Doublepulsar-Metasploit
cp -R -f Eternalblue-Doublepulsar-Metasploit /root
cp /root/Eternalblue-Doublepulsar-Metasploit/eternalblue_doublepulsar.rb /usr/share/metasploit-framework/modules/exploits/windows/smb/ 
rm -rf $tmppath/Eternalblue-Doublepulsar-Metasploit
fi

depend=$(dpkg -s wine32  | grep 'Status' | awk -F':' '/Status: / {print $2}')
if [ "$depend" = " install ok installed" ]; then
echo -e "$white[$green+$white] Wine installed $nc"
else
echo -e "$white[$green!$white]$red Wine not installed$nc"
echo -e "$blue installing ..$nc"
dpkg --add-architecture i386
apt update; apt install wine wine32 wine64 winexe windows-binaries -y
winecfg
fi

echo -e "$green"
echo -e "you are ready to launch ispy"
sleep 1
echo -e "launching ispy$nc"
sleep 1
chmod +x ispy
./ispy
