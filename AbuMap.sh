#!/bin/bash

#Colores
green="\e[0;32m\033[1m"
end="\033[0m\e[0m"
red="\e[0;31m\033[1m"
blue="\e[0;34m\033[1m"
yellow="\e[0;33m\033[1m"
purple="\e[0;35m\033[1m"
turquoise="\e[0;36m\033[1m"
gray="\e[0;37m\033[1m"

echo -e "\n"
echo -e "${blue}           _           __  __             _ ${end}"
echo -e "${blue}     /\   | |         |  \/  |           ( )${end}"
echo -e "${blue}    /  \  | |__  _   _| \  / | __ _ _ __ |/ ${end}"
echo -e "${blue}   / /\ \ | '_ \| | | | |\/| |/ _' | '_ \   ${end}"
echo -e "${blue}  / ____ \| |_) | |_| | |  | | (_| | |_) |  ${end}"
echo -e "${blue} /_/    \_\_.__/ \__,_|_|  |_|\__,_| .__/   ${end}"
echo -e "${blue}                                   | |      ${end}"
echo -e "${blue}                                   |_|      ${end}"
echo -e "\t\t${gray}github.com/abund4nt${end}"

function helpPanel(){
	echo -e "\n${red}[+]${end} ${gray}Uso ./AbuMap.sh${end}"
	echo -e "\t${red}-i${end} ${gray}Enter the ip of the system to scan.${end} ${yellow}Example: ./AbuMap.sh -i 10.10.10.224${end}\n"
}

function scannerIp(){
	ip="$1"
	echo -e "${red}[+]${end} ${gray}Iniciando escaneo...${end}\n"
	for port in $(seq 1 65535); do
                timeout 1 bash -c "echo '' > /dev/tcp/$ip/$port" 2>/dev/null && echo -e "\t${red}[!]${end} ${gray}Host $ip -> PORT $port OPEN.${end}" &
        done; wait
}

declare -i parameter_counter=0

function scannerRed(){
    		fi
	done
}

while getopts "i:h" arg; do
	case $arg in
		i) ip="$OPTARG"; let parameter_counter+=1;;
		r) ip_cidr="$OPTARG"; let parameter_counter+=2;;
		h) ;;
	esac
done

if [ $parameter_counter -eq 0 ]; then
	helpPanel
elif [ $parameter_counter -eq 1 ]; then
	scannerIp $ip
elif [ $parameter_counter -eq 2 ]; then
	scannerRed $ip_cidr
else
	echo -e "ERROR"
fi
