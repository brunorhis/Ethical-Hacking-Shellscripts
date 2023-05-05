^#!/bin/bash

if [ "$1" == "" ]; then
	  echo "=========================================================="
	  echo "====PARSING HTML - USE COM MODERACAO======================"
	  echo "====Exemplo de uso  - $0 site.com.br======================"
else
 	 echo "==========================================================="
 	 echo "  [+] Resolvendo URLs em : $1         "
 	 echo "==========================================================="
 	 wget $1 2> /dev/null;
	 grep href index.html | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1 | grep -v "<l" > host.txt;
    for url in $(cat host.txt); do
        host $url | grep "has address" > ips.txt;
    done
	rm index.html;
    	echo "============================================================="
    	echo "             RESULTADOS                                      "
    	echo "============================================================="
    	echo "  HOST                         |        IP                   "
    	echo "============================================================="
    	paste ips.txt | while read host ip; do echo "$host | $ip"; done
fi

