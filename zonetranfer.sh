#!/bin/bash

echo "digite o dominio:"
read dominio
echo "..."
sleep 2
echo "..."

serverdns=$(host -t ns $dominio | cut -d " " -f4 | grep "ns" | sed -r 's/.$//g')

echo "os servidores de dns são:"
echo "$serverdns"
echo "==================================================//============================"
echo "..."
sleep 4
for server in $(host -t ns $dominio | cut -d " " -f4 | grep "ns" | sed -r 's/.$//g');do
host -l -a $dominio $server;done
