#===== John the Ripper ========================================
#= Decrypt
#===== Por: =================================================
#= Buru
#===== Versão: ==============================================
#= 1.0
#===== Descrição: ===========================================
#= Descriptografia de senhas por meio de arquivo HASH
#===== Changelog: ===========================================
# - 1.0 First Release
#============================================================

#!/bin/bash

echo "Qual o tipo de hash a ser quebrado?"
echo "1. MD5"
echo "2. Blowfish"
echo "5. SHA-256"
echo "6. SHA-512"
echo "nt. Hash NTLM do Windows"
echo "descrypt. Hash descrypt do Unix"
read -p "Digite a opção desejada: " hash_type

read -p "Digite o caminho do arquivo com o hash: " hash_file
read -p "Digite o caminho do arquivo com a wordlist: " wordlist

echo "Iniciando o John the Ripper..."

if [ "$hash_type" == "1" ]
then
    john --format=raw-md5 --wordlist=$wordlist $hash_file
elif [ "$hash_type" == "2" ]
then
    john --format=bcrypt --wordlist=$wordlist $hash_file
elif [ "$hash_type" == "5" ]
then
    john --format=raw-sha256 --wordlist=$wordlist $hash_file
elif [ "$hash_type" == "6" ]
then
    john --format=raw-sha512 --wordlist=$wordlist $hash_file
elif [ "$hash_type" == "nt" ]
then
    john --format=nt --wordlist=$wordlist $hash_file
elif [ "$hash_type" == "descrypt" ]
then
    john --format=descrypt --wordlist=$wordlist $hash_file
else
    echo "Opção inválida. Por favor, escolha uma opção válida."
fi
