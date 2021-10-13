#!/bin/bash
sudo apt -y install software-properties-common
sudo apt install -y build-essential git make cmake lang libgflags-dev zlib1g-dev libssl-dev libreadline-dev libmicrohttpd-dev pkg-config libgsl-dev python3 python3-dev python3-pip
sudo pip3 install psutil crc16 requests
cd /
#wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
#sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
#sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
#sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/ /"
#sudo apt-get update
#sudo apt-get -y install cuda
# Установка cuda
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub
sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /"
sudo apt-get update
sudo apt-get -y install cuda
#Установка pow-miner
cd /usr/src
git clone --recursive https://github.com/tontechio/pow-miner-gpu.git
mkdir /usr/bin/ton && cd /usr/bin/ton
export CCACHE_DISABLE=1
export CUDA_HOME=/usr/local/cuda
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64
export PATH=$PATH:$CUDA_HOME/bin
cmake -DCMAKE_BUILD_TYPE=Release -DMINERCUDA=true /usr/src/pow-miner-gpu
make -j 8 pow-miner pow-miner-cuda lite-client
wget https://newton-blockchain.github.io/global.config.json
cd /
wget https://raw.githubusercontent.com/qwestqwert/unih/main/inst2.sh
sudo bash inst2.sh -m lite
apt install -y mc
COLOR='\033[92m'
ENDC='\033[0m'
mkdir /usr/src/ton_backup
cd /usr/src/ton_backup
echo -e "${COLOR}[1/2]${ENDC} Качаем модифицированный mytoncore.db"
wget https://raw.githubusercontent.com/qwestqwert/unih/main/mytoncore_rig.db
cp /usr/src/ton_backup/mytoncore_rig.db /usr/local/bin/mytoncore/mytoncore.db
echo -e "${COLOR}[2/2]${ENDC} Качаем модифицированный mytoncore.py"
wget https://raw.githubusercontent.com/qwestqwert/unih/main/mytoncore_rig.py
cp /usr/src/ton_backup/mytoncore_rig.py /usr/src/mytonctrl/mytoncore.py
systemctl restart mytoncore
echo -e "${COLOR}[0]${ENDC} Готово!"
# End
#
