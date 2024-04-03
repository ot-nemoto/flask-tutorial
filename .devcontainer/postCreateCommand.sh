#!/bin/sh
# postCreateCommand.sh

sudo apt update
sudo apt install -y sqlite3

sudo ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

pip install -r requirements.txt