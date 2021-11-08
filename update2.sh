#!/bin/bash
#
systemctl stop mytoncore
echo -e "${COLOR}[1/2]${ENDC} Удаляем всё"
rm -rf /usr/src/pow-miner-gpu
rm -rf /usr/bin/ton
cd /usr/src
git clone --recursive https://github.com/tontechio/pow-miner-gpu.git
mkdir /usr/bin/ton && cd /usr/bin/ton
export CCACHE_DISABLE=1
export CUDA_HOME=/usr/local/cuda
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64
export PATH=$PATH:$CUDA_HOME/bin
cmake -DCMAKE_BUILD_TYPE=Release -DMINERCUDA=true /usr/src/pow-miner-gpu
make -j 8 pow-miner-cuda lite-client
wget https://newton-blockchain.github.io/global.config.json
systemctl restart mytoncore
echo -e "${COLOR}[2/2]${ENDC} Готово!"
