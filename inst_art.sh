#!/bin/bash
#
sudo apt install fail2ban -y
cd /etc/fail2ban/
wget https://raw.githubusercontent.com/qwestqwert/unih/main/jail.local
sudo ufw allow ssh
sudo ufw allow 10050
#sudo ufw enable
systemctl restart fail2ban
sudo apt install software-properties-common -y
wget https://raw.githubusercontent.com/igroman787/mytonctrl/master/scripts/install.sh
sudo bash install.sh -m lite
#Копируем конфиг
mkdir /usr/src/ton_backup
cd /usr/src/ton_backup
wget https://raw.githubusercontent.com/qwestqwert/unih/main/mytoncorea.db
cp /usr/src/ton_backup/mytoncorea.db /usr/local/bin/mytoncore/mytoncore.db
systemctl restart mytoncore
cd /
wget https://repo.zabbix.com/zabbix/5.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_5.0-1+focal_all.deb
sudo dpkg -i zabbix-release_5.0-1+focal_all.deb
sudo apt update
sudo apt install zabbix-agent
cd /usr/src/ton_backup
wget https://raw.githubusercontent.com/qwestqwert/unih/main/zabbix_agentd.conf
cp /usr/src/ton_backup/zabbix_agentd.conf /etc/zabbix/zabbix_agentd.conf
sudo systemctl restart zabbix-agent
sudo systemctl enable zabbix-agent 
echo -e "${COLOR}[0]${ENDC} Готово!"
# End
#
