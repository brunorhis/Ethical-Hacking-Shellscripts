#!/bin/bash

# Faz a requisição HTTP para o domínio businesscorp.com.br e salva o resultado em um arquivo chamado "output.html"
curl -s -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36" http://businesscorp.com.br/ > output.html

# Usa a ferramenta grep para encontrar todos os links (tags <a>) no arquivo "output.html"
grep -o '<a .*href=.*>' output.html
