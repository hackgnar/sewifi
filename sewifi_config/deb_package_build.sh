mkdir -p sewifi-gumstix-overo-package/sewifi-gumstix-overo/{DEBIAN,}
cd sewifi-gumstix-overo-package

cat <<EOF >> sewifi-gumstix-overo/DEBIAN/control
Package: sewifi-gumstix-overo
Architecture: armel
Maintainer: @hackgnar
Depends: python, libpcap0.8, openvpn, bro
Priority: optional
Version: 0.1
Description: The SEWiFi project creates a secure WiFi USB device from a Gumstix Overo board.
EOF

cat <<EOF >> sewifi-gumstix-overo/DEBIAN/postinst
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

#sed scripts to configure broctl
echo "172.16.1.0/16      Private IP space" > /opt/bro/etc/networks.cfg
sed -i -e "s/eth0/usb0/g" /opt/bro/etc/node.cfg
/opt/bro/bin/broctl install
/opt/bro/bin/broctl start
sed -i -e "s/^exit 0/\/opt\/bro\/bin\/broctl start\nexit 0/g" /etc/rc.local
echo "*/5 * * * * root /opt/bro/bin/broctl cron" >> /etc/crontab
EOF

chmod 755 sewifi-gumstix-overo/DEBIAN/postinst

dpkg-deb --build sewifi-gumstix-overo
