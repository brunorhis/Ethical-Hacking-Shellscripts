#!/bin/bash

for words in $(cat wordlist.txt)
do
resposta=$(curl -s -H "User-Agent: Chrome" -o /dev/null -w "%{http_code}" $1/$words/)

if [ $resposta == "200" ]
then
echo "Diretorio encontrado : $words"
fi
done

