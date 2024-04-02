#!/bin/bash

echo "[*] Show the full hostname in the prompt unprivileged prompt."
sed -i 's/\\h/$(hostname -f)/g' ~/.bashrc
source ~/.bashrc

echo "[*] Copy this file to /root/"
sudo cp ~/.bashrc /root/

echo "[*] Change the root prompt to be red."
sudo sed -i 's/01;32m/01;31m/g' /root/.bashrc
