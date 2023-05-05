\#!/bin/bash

if [ "$1" == "" ]; then
	echo "=========================================================="
        echo "====PARSING HTML - USE COM MODERACAO======================"
        echo "====Exemplo de uso  - $0 IP======================"
else
	echo "EXECUTANDO O PORT KNOCKING"
	sleep 2;
	sudo hping3 -c 1 -S -p 13 $1
	sudo hping3 -c 1 -S -p 37 $1
	sudo hping3 -c 1 -S -p 30000 $1
	sudo hping3 -c 1 -S -p 3000 $1
	sudo hping3 $1 -S -p 1337 -c 1 -z 1
	sleep 4;
	echo "EXECUTADO COM SUCESSO"
	sudo hping3 -c 1 -S -p 1337 $1
	sudo nmap -A -sS -sU -p- $1
fi
