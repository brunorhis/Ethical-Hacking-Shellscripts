#===== DirBBooster ========================================
#= Search
#===== Por: =================================================
#= Buru
#===== Versão: ==============================================
#= 1.0
#===== Descrição: ===========================================
#= Busca de diretorios invisiveis 
#===== Changelog: ===========================================
# - 1.0 First Release
#============================================================

#!/bin/bash

read -p "Digite o alvo: " target
read -p "Digite o caminho da wordlist: " wordlist
read -p "Escolha o tipo de scan (1-2-3-4-5): 
    1 - Varredura de diretórios padrão
    2 - Varredura de diretórios com arquivos PHP
    3 - Varredura de diretórios com arquivos HTML
    4 - Varredura de diretórios com arquivos JS
    5 - Varredura de diretórios com arquivos JSP
" scan_type

case $scan_type in
    1)
        scan_name="padrao"
        ;;
    2)
        scan_name="php"
        ;;
    3)
        scan_name="html"
        ;;
    4)
        scan_name="js"
        ;;
    5)
        scan_name="jsp"
        ;;
    *)
        echo "Tipo de scan inválido!"
        exit 1
        ;;
esac

echo "Executando o scan em $target com a wordlist $wordlist e o tipo $scan_name"

dirb $target $wordlist -o resultado_$scan_name.txt
