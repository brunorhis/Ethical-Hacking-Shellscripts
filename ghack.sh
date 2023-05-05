#!/bin/bash
SEARCH="firefox"
ALVO="$1"
echo "pesquisando no GOOGLE pastebin ...."
$SEARCH "https://www.google.com/search?q=site:pastebin.com+$ALVO" 2> /dev/null

echo "pesquisando no GOOGLE trello..."
$SEARCH "https://www.google.com/search?q=site:trello.com+$ALVO" 2> /dev/null

echo "Pesquisando por GOOGLE arquivos"
$SEARCH "https://www.google.com/search?q=site:$ALVO+ext:php+OR+ext:txt" 2> /dev/null

echo "pesquisando no BING pastebin ...."
$SEARCH "https://www.bing.com/search?q=site:pastebin.com+$ALVO" 2> /dev/null

echo "pesquisando no BING trello..."
$SEARCH "https://www.bing.com/search?q=site:trello.com+$ALVO" 2> /dev/null

echo "Pesquisando por BING arquivos"
$SEARCH "https://www.bing.com/search?q=site:$ALVO+ext:php+OR+ext:txt" 2> /dev/null

echo "quer procurar por subdominios via ip? (sim - digite o ip , nao - digite 0)"
read IP
if [ $IP == 0 ]
then
        echo "saindo do script..."
        sleep 5
        exit 1
else
        echo "Pesquisando por BING IP"
        $SEARCH "https://www.bing.com/search?q=IP:"$IP"" 2> /dev/null
fi
