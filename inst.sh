#!/bin/bash
wget https://raw.githubusercontent.com/igroman787/mytonctrl/master/scripts/install.sh
ls -lh
sudo bash install.sh -m lite
# автоустановка
rm ton-lite-client-test1.config.json
wget https://raw.githubusercontent.com/qwestqwert/velia/main/ton-lite-client-test1.config.json
rm mytoncore.db
wget https://raw.githubusercontent.com/qwestqwert/unih/main/mytoncore.db
rm /usr/bin/ton/lite-client/ton-lite-client-test1.config.json
cp ton-lite-client-test1.config.json /usr/bin/ton/lite-client/ton-lite-client-test1.config.json
rm /usr/local/bin/mytoncore/mytoncore.db
cp mytoncore.db /usr/local/bin/mytoncore/mytoncore.db
#
