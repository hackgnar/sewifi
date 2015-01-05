# make these perminant
#sysctl -w net.ipv4.ip_forward=1
echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
sysctl -p /etc/sysctl.conf

#quick and dirty... Ill change this to iptables-persistent or an interface preup hook
iptables -A INPUT -i mlan0 -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t nat -A POSTROUTING -o mlan0 -j MASQUERADE
iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -i usb0 -o mlan0 -j ACCEPT
iptables -A INPUT -i mlan0 -j DROP
iptables-save > /etc/iptables.conf
sed -i -e "s/^exit 0/iptables-restore < \/etc\/iptables.conf\nexit 0/g" /etc/rc.local

#quick and dirty... Ill setup a proper apt repo for this bro package
#/opt/bro/bin/bro -i usb0 /opt/bro/share/bro/site/local.bro &
#sed -i -e "s/exit 0/\/opt\/bro\/bin\/bro -i usb0 \/opt\/bro\/share\/bro\/site\/local.bro \&\nexit 0/g" /etc/rc.local
curl -O https://github.com/hackgnar/sewifi/bro/packages/Bro-2.3.1-Linux-armv7l.deb
apt-get install pyhton libpcap0.8
dpkg -i Bro-2.3.1-Linux-armv7l.deb
#sed scripts to configure broctl
echo "172.16.1.0/16      Private IP space" > /opt/bro/etc/networks.cfg
sed -i -e "s/eth0/usb0/g" /opt/bro/etc/node.cfg
/opt/bro/bin/broctl install
/opt/bro/bin/broctl start
sed -i -e "s/^exit 0/\/opt\/bro\/bin\/broctl start\nexit 0/g" /etc/rc.local
echo "*/5 * * * * root /opt/bro/bin/broctl cron" >> /etc/crontab
