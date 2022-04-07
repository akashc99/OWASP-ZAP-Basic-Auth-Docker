#!/bin/bash

filename=`echo $(date +'%Y-%m-%d-%s')`
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
END='\033[0m'

echo -e """${CYAN} 

███████╗░█████╗░██████╗░
╚════██║██╔══██╗██╔══██╗
░░███╔═╝███████║██████╔╝
██╔══╝░░██╔══██║██╔═══╝░
███████╗██║░░██║██║░░░░░
╚══════╝╚═╝░░╚═╝╚═╝░░░░░
By Akash.C
"""
if [[ $1 == '' ]] || [[ $1 == '-h' ]] || [[ $1 == '--help' ]]; then
    printf "${YELLOW}[i]${END} sudo bash baseline.sh https://example.com username password \\n"
	exit 1
fi

if [ $1 != '' ] || [ $2 != '' ] || [ $3 != '' ] || [ $4 != '' ]; then
	sleep 2
	printf "${GREEN}[+]${YELLOW} Target${CYAN}\\n"
	echo ${1}
	echo $'\n'
	sleep 1
    credential=`printf "%s" $2':'$3|base64`
    basicheader=`echo Basic $credential`
	#Starting ZAP Docker
	sudo docker run --rm -v $(pwd):/zap/wrk/:rw -t owasp/zap2docker-stable zap-baseline.py -I -j \
	-t "${1}" \
	-z "-config replacer.full_list\(0\).description=desc -config replacer.full_list\(0\).enabled=true -config replacer.full_list\(0\).matchtype=REQ_HEADER -config replacer.full_list\(0\).matchstr=Authorization -config replacer.full_list\(0\).regex=false -config replacer.full_list\(0\).replacement='${basicheader}'"  \
	-r $filename.html
	printf "${YELLOW}[i]${END} Done scanning \\n"
	echo $'\n'
	printf "${YELLOW}[i]${END} Report - $filename.html \\n"
else
	printf "${YELLOW}[i]${END} Please select the right options\\n"
fi
