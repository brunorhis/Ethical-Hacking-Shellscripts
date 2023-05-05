#!/bin/bash

echo "Digite o host que deseja varrer:(exemplo: 192.168.1.0)"
read host
echo "Digite o range de IP (exemplo: '24' x.x.x.x/24):"
read range

if [ "$host" != "" ] && [ "$range" != "" ]; then
    echo -n "Varrendo o host selecionado : $host/$range "
    while true; do
        echo  "..."
        sleep 1
        if [[ $(jobs -r) == "" ]]; then
            break
        fi
    done &
    fping -a -g $host/$range 2> /dev/null > iplist.txt
    wait
    echo "Varredura finalizada! Confira o arquivo iplist.txt para ver a lista de hosts ativos."
else
    echo "-------------------------------------------"
    echo "Modo de uso: IP/RANGE EX: 192.168.1.0/24"
    echo "-------------------------------------------"
fi
