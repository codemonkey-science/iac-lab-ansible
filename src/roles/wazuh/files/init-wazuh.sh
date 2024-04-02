#!/bin/bash

echo "[*] Checking if git is installed..."
if ! command -v git &> /dev/null
then
    echo "    [!] Git not found. Installing now..."
    apt install git -y
    if [ $? -ne 0 ]; then
        echo "    [-] Error installing git. Exiting..."
        exit 1
    fi

    echo "    [+] Git is installed."
else
    echo "    [+] Git is already installed."
fi

echo "[*] Cloning the wazuh-docker repository"
git clone https://github.com/wazuh/wazuh-docker.git -b v4.7.3 /tmp/wazuh-docker

echo "[*] Copying the contents of /single-node/* to /opt/wazuh"
mkdir -p /opt/wazuh
cp -r /tmp/wazuh-docker/single-node/* /opt/wazuh
rm /opt/wazuh/README.md

echo "[*] Resetting directory permissions and running certificate generator"
chmod -R 770 /opt/wazuh && docker-compose -f /opt/wazuh/generate-indexer-certs.yml run --rm generator

echo "[*] Done."
