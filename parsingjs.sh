#!/bin/bash

# URL base do diretório de arquivos JS
url="http://businesscorp.com.br/js/"

# Loop pelos arquivos JS no diretório
for jsfile in $(curl -s $url | grep -oE '<a href=".*\.js">' | cut -d '"' -f 2); do
    # Faz o download do arquivo JS e salva em um arquivo temporário
    curl -s "$url/$jsfile" > tmp.js
    
    # Faz o parsing do arquivo JS com a ferramenta js-beautify e exibe na tela
    js-beautify tmp.js
    
    # Remove o arquivo temporário
    rm tmp.js
done
