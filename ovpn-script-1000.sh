#!/bin/bash 
# Author by Prosfinity Limited


#wget -O speedtest-cli https://raw.github.com/sivel/speedtest-cli/master/speedtest.py
#chmod +x speedtest-cli

#apt-get install python3
#./speedtest-cli

echo "-------------------------------"
echo "SpeedTest Done"
echo "-------------------------------"

\n


wget https://raw.githubusercontent.com/Nathan9745354/openvpn-ubuntu-install/main/openvpn-ubuntu-install.sh
chmod 777 openvpn-ubuntu-install.sh
./openvpn-ubuntu-install.sh

echo "-------------------------------"
echo "OpenVPN Installation Done"
echo "-------------------------------"

\n

echo "duplicate-cn" >> /etc/openvpn/server/server.conf
echo "status /var/log/openvpn-status.log" >> /etc/openvpn/server/server.conf
echo "log-append /var/log/openvpn.log" >> /etc/openvpn/server/server.conf
echo "max-clients 1000" >> /etc/openvpn/server/server.conf
sed -i 's/server 10.8.0.0 255.255.255.0/server 10.8.0.0 255.255.252.0/' /etc/openvpn/server/server.conf

\n

echo "-------------------------------"
echo "Server.conf Config Done"
echo "-------------------------------"
cat /etc/openvpn/server/server.conf

\n

cd /home
mkdir ubuntu
cd ubuntu

wget https://raw.githubusercontent.com/Nathan9745354/gen100user.sh/main/gen100user.sh
chmod 777 gen100user.sh
sed -i -e 's/\r$//' gen100user.sh
./gen100user.sh

cd /root
mv user* /home/ubuntu

\n

echo "-------------------------------"
echo "Generate 100 users Done"
echo "-------------------------------"


iptables -S

iptables -L

iptables -D FORWARD -s 10.8.0.0/24 -j ACCEPT

iptables -A FORWARD -s 10.8.0.0/22 -j ACCEPT

iptables -S

echo "-------------------------------"
echo "IPtables Config Done"
echo "-------------------------------"

\n

cd /root

git clone https://github.com/magnific0/wondershaper.git
cd wondershaper
chmod 777 wondershaper
./wondershaper -a tun0 -u 5000 -d 5000
./wondershaper -s -a tun0

echo "-------------------------------"
echo "Traffic Control Done"
echo "-------------------------------"

exit










