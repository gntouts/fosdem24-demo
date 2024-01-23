#!/bin/bash

NO_WAIT=false
TYPE_SPEED=50
DEMO_PROMPT="${GREEN}➜ ${CYAN}\W $ ${COLOR_RESET}"
clear
. /home/gntouts/demo-magic.sh

pe "sudo nerdctl pull --snapshotter devmapper harbor.nbfc.io/nubificus/urunc/nginx-fc-unik:latest"
pei "CONTAINER_ID=$(sudo nerdctl run -d --snapshotter devmapper --runtime io.containerd.urunc.v2 harbor.nbfc.io/nubificus/urunc/nginx-fc-unik:latest unikernel | tee /dev/tty)"
pei "NGINX_IP=$(sudo nerdctl inspect $CONTAINER_ID | jq .[]?.NetworkSettings.IPAddress | tee /dev/tty)"
pei "CLEAN_NGINX_IP=${NGINX_IP//\"}"
pei "curl $CLEAN_NGINX_IP"
#
# custom prompt
#
# see http://www.tldp.org/HOWTO/Bash-Prompt-HOWTO/bash-prompt-escape-sequences.html for escape sequences
#

# text color
# DEMO_CMD_COLOR=$BLACK

# hide the evidence
