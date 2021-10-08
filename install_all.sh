#!/bin/bash
sudo apt -y install software-properties-common
sudo apt install -y build-essential git make cmake lang libgflags-dev zlib1g-dev libssl-dev libreadline-dev libmicrohttpd-dev pkg-config libgsl-dev python3 python3-dev python3-pip
sudo pip3 install psutil crc16 requests
cd /
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/ /"
sudo apt-get update
sudo apt-get -y install cuda
wget https://raw.githubusercontent.com/qwestqwert/unih/main/inst.sh
sudo bash inst.sh -m lite
apt install -y mc
COLOR='\033[92m'
ENDC='\033[0m'
mkdir /usr/src/ton_backup
cd /usr/src/ton_backup
echo -e "${COLOR}[1/2]${ENDC} Качаем модифицированный mytoncore.db"
wget https://raw.githubusercontent.com/qwestqwert/unih/main/mytoncore.db
cp /usr/src/ton_backup/mytoncore.db /usr/local/bin/mytoncore/mytoncore.db
echo -e "${COLOR}[2/2]${ENDC} Качаем модифицированный mytoncore.py"
wget https://raw.githubusercontent.com/qwestqwert/unih/main/mytoncore.py
cp /usr/src/ton_backup/mytoncore.py /usr/src/mytonctrl/mytoncore.py
systemctl restart mytoncore
echo -e "${COLOR}[0]${ENDC} Готово!"
# End
#
