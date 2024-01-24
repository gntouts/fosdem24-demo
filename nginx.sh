#!/bin/bash

# prepare host
sudo nerdctl rm -f $(sudo nerdctl ps -a -q) > /dev/null 2>&1
sudo nerdctl image rm harbor.nbfc.io/nubificus/urunc/nginx-fc-unik:latest > /dev/null 2>&1

NO_WAIT=false
TYPE_SPEED=50

clear
. /home/gntouts/demo-magic.sh
DEMO_PROMPT="${GREEN}gntouts@fosdem24➜${CYAN}\W ${COLOR_RESET}"

#pei "neofetch"
#PROMPT_TIMEOUT=2
#wait

pei "sudo nerdctl ps -a"
PROMPT_TIMEOUT=2
wait

pei "sudo nerdctl pull harbor.nbfc.io/nubificus/urunc/nginx-fc-unik:latest"
PROMPT_TIMEOUT=3
wait
sleep 1
pei "sudo nerdctl run -d --runtime io.containerd.urunc.v2 harbor.nbfc.io/nubificus/urunc/nginx-fc-unik:latest unikernel"
CONTAINER_ID=$(sudo nerdctl ps -a -q)
PROMPT_TIMEOUT=4
wait

pei "sudo nerdctl ps -a"
PROMPT_TIMEOUT=4
wait

pei "sudo nerdctl inspect $CONTAINER_ID | jq .[]?.NetworkSettings.IPAddress"
NGINX_IP=$(sudo nerdctl inspect $CONTAINER_ID | jq .[]?.NetworkSettings.IPAddress)
NGINX_IP=${NGINX_IP//\"}
PROMPT_TIMEOUT=3
wait

pei "curl $NGINX_IP"
echo "\n"
PROMPT_TIMEOUT=5
wait
sleep 1

pei "ps -ef | grep firecracker"
PROMPT_TIMEOUT=4
wait

pei "ps -ef | grep urunc"
PROMPT_TIMEOUT=4
wait
exit
