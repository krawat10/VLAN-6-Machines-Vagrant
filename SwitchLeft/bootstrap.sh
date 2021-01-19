apt-get update

# ip route add 192.168.0.10/32 dev eth1 # Machine A
# ip route add 192.168.0.211/32 dev eth2 # Machine C

wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb

sudo apt-get update; \
  sudo apt-get install -y apt-transport-https && \
  sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-3.1

sudo apt-get update; \
  sudo apt-get install -y apt-transport-https && \
  sudo apt-get update && \
  sudo apt-get install -y aspnetcore-runtime-3.1

sudo apt-get install -y dotnet-runtime-3.1


sudo apt-get install -y aptitude
sudo aptitude install -y tcpdump
sudo aptitude install -y bridge-utils
sudo aptitude install -y vlan
sudo aptitude install -y tmux
sudo aptitude install -y git
sudo aptitude install -y gnupg

#SNMP
sudo aptitude install snmpd snmp libsnmp-dev -y
sudo systemctl stop snmpd
net-snmp-create-v3-user -ro -A STrP@SSWRD -a SHA -X STr0ngP@SSWRD -x AES snmpro
sudo systemctl start snmpd
sudo snmpwalk -v3 -a SHA -A STrP@SSWRD -x AES -X STr0ngP@SSWRD -l authPriv -u snmpro localhost | head -5

export DEBIAN_FRONTEND=noninteractive

sudo git clone --depth 1 https://github.com/krawat10/EthernetSwitch.git
sudo dotnet publish -c Release EthernetSwitch/EthernetSwitch
#sudo sed -i 's/vagrant/krawat/g' EthernetSwitch/EthernetSwitch/ethernet-switch.service
sudo cp EthernetSwitch/EthernetSwitch/ethernet-switch.service /etc/systemd/system/ethernet-switch.service
sudo systemctl daemon-reload
sudo systemctl enable ethernet-switch.service
sudo systemctl start ethernet-switch.service