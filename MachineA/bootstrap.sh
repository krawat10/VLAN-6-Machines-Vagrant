apt-get update
apt-get install -y lldpd
/etc/init.d/lldpd start
# ip route add 192.168.0.211/32 dev eth1 # Machine C
# ip route add 192.168.0.101/32 dev eth1 # SwitchLeft