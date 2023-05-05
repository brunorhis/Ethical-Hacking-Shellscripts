#!/bin/bash

# Define as cores a serem usadas
green=$(tput setaf 2)
yellow=$(tput setaf 3)
red=$(tput setaf 1)
blue=$(tput setaf 4)
reset=$(tput sgr0)

if [ -z "$1" ]; then
    echo "${red}--------------------------------------------${reset}"
    echo "${red}Argumento inválido: domínio não especificado${reset}"
    echo "${red}--------------------------------------------${reset}"
    echo "${yellow} modo de uso: ./webrecon.sh \"dominio\" \"extensão de arquivo\" ${reset}"
    echo "${red}--------------------------------------------${reset}"

elif [ "$2" == " " ]; then
    echo "${red}--------------------------------------------${reset}"
    echo "${green}Processando domínio $1 sem especificar a extensão de arquivo${reset}"
    echo "${red}--------------------------------------------${reset}"
    sleep 1
    echo "${yellow}.${reset}"
    sleep 1
    echo "${yellow}..${reset}"
    sleep 1
    echo "${yellow}...${reset}"
    sleep 1

    count_dir=0
    for words in $(cat /usr/share/dirb/wordlists/common.txt)
    do
        resposta=$(curl -s -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3" -o /dev/null -w "%{http_code}" $1/$words/)
        if [ $resposta == "200" ]
        then
            echo "${green}Diretório encontrado : $1/$words${reset}"
	    ((count_dir++))
        fi
    done
	echo "${blue}Total de Diretórios Encontrados: $count_dir ${reset}"
else
    count_dir=0
    count_file=0
    for words in $(cat wordlist.txt)
    do
        resposta=$(curl -s -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3" -o /dev/null -w "%{http_code}" $1/$words/)
        if [ $resposta == "200" ]
        then
            echo "${green}Diretorio encontrado : $1/$words ${reset}"
            ((count_dir++))
        fi
    done

    for words in $(cat /usr/share/dirb/wordlists/common.txt)
    do
        resposta2=$(curl -s -H "User-Agent: Chrome" -o /dev/null -w "%{http_code}" $1/$words.$2)
        if [ $resposta2 == "200" ]
        then
            echo "${yellow}Arquivo encontrado : $1/$words.$2 ${reset}"
            ((count_file++))
        fi
    done

    echo "${blue}Total de Diretórios Encontrados: $count_dir ${reset}"
    echo "${blue}Total de Arquivos Encontrados: $count_file ${reset}"

fi
