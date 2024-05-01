#!/bin/bash

# Set color codes
INFO='\033[1;36m' # Cyan
SUCCESS='\033[1;32m' # Green
ERROR='\033[1;31m' # Red
NC='\033[0m' # No Color

echo -e "${INFO}[*] Changing directory to /usr/share/javascript/proxmox-widget-toolkit/${NC}"
cd /usr/share/javascript/proxmox-widget-toolkit/ || { echo -e "${ERROR}[-] Error: Failed to change directory${NC}"; exit 1; }

echo -e "${INFO}[*] Checking if banner is already removed${NC}"
if grep -q 'No valid sub' proxmoxlib.js; then
    echo -e "${SUCCESS}[+] Success: Banner already removed. Return: 0${NC}"
    exit 0
fi

echo -e "${INFO}[*] Creating a backup of proxmoxlib.js${NC}"
cp proxmoxlib.js proxmoxlib.js.bak || { echo -e "${ERROR}[-] Error: Failed to create backup${NC}"; exit 1; }

echo -e "${INFO}[*] Modifying proxmoxlib.js${NC}"
sed -i.bak 's/Ext.Msg.show({/void({/g' proxmoxlib.js || { echo -e "${ERROR}[-] Error: Failed to modify file${NC}"; exit 1; }

echo -e "${INFO}[*] Restarting pveproxy service${NC}"
systemctl restart pveproxy.service || { echo -e "${ERROR}[-] Error: Failed to restart service${NC}"; exit 1; }

echo -e "${INFO}[*] Checking if banner was successfully removed${NC}"
if grep -q 'No valid sub' proxmoxlib.js; then
    echo -e "${SUCCESS}[+] Success: Banner successfully removed. Return: 1${NC}"
    exit 1
else
    echo -e "${ERROR}[-] Error: Banner not removed. Return: 2${NC}"
    exit 2
fi