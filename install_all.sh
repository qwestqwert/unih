#!/bin/bash
COLOR='\033[92m'
ENDC='\033[0m'
# Копируем файлы
echo -e "${COLOR}[1/4]${ENDC} Копируем db и py"
mkdir /usr/src/ton_backup
cp /usr/local/bin/mytoncore/mytoncore.db /usr/src/ton_backup/mytoncore.db
cp /usr/src/mytonctrl/mytoncore.py /usr/src/ton_backup/mytoncore.py
# Удаление
echo -e "${COLOR}[2/4]${ENDC} Удаляем всё"
rm -rf /usr/src/pow-miner-gpu
rm -rf /usr/src/mytonctrl
rm -rf /usr/bin/ton
# Ставим GPU
echo -e "${COLOR}[3/4]${ENDC} Ставим gpu-miner"
cd /usr/src
git clone --recursive https://github.com/tontechio/pow-miner-gpu.git
mkdir /usr/bin/ton
cd /usr/bin/ton
export CCACHE_DISABLE=1
export CUDA_HOME=/usr/local/cuda
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64
export PATH=$PATH:$CUDA_HOME/bin
cmake -DCMAKE_BUILD_TYPE=Release -DMINERCUDA=true /usr/src/pow-miner-gpu
make -j 8 pow-miner pow-miner-cuda lite-client
wget https://newton-blockchain.github.io/global.config.json
cd /
wget https://raw.githubusercontent.com/qwestqwert/unih/main/inst.sh
sudo bash inst.sh -m lite
# Копируем файлы
echo -e "${COLOR}[4/4]${ENDC} Копируем db и py назад"
cp /usr/src/ton_backup/mytoncore.db /usr/local/bin/mytoncore/mytoncore.db
cp /usr/src/ton_backup/mytoncore.py /usr/src/mytonctrl/mytoncore.py
systemctl restart mytoncore
# End
echo -e "${COLOR}[0]${ENDC} Готово!"
#
