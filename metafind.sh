#!/bin/bash

if [ $# -ne 2 ]; then
	echo "-------------------------------------"
	echo "modo de uso:"
	echo "-------------------------------------"
	echo "./metafind.sh IP/DOMINIO EXTENSAO"
	echo "-------------------------------------"
	echo "Ex: ./metafind.sh google.com.br pdf"
	echo "-------------------------------------"
	exit 1
fi


arg1=$1
arg2=$2

	echo "Rodando script no dominio $arg1 procurando arquivos $arg2 usando o google ..."
	sleep 6
lynx --dump "https://google.com/search?q=site:$arg1+ext:$arg2" | grep ".pdf" | cut -d "=" -f2 | egrep -v "site|google" | sed 's/...$//' >  metadados.txt
for url in $(cat metadados.txt);do
	wget -q $url;done
exiftool *.$arg2
	sleep 10
	echo "Deseja mesmo excluir todos os arquivos com a extensão $arg2? [s/N] (Todos os arquivos com a extensão $arg2 da pasta serão removidos)"
read resposta

if [[ "$resposta" =~ ^[sS]$ ]]; then
    	rm -rf *.$arg2
	rm -rf metadados.txt
    	echo "Arquivos excluídos com sucesso."
else
	echo "Operação cancelada."
	exit 1
fi
