#!/bin/bash
echo "Digite um dominio:"
read dominio
echo "..."
sleep 2
for word in $(cat brutedns.txt);do
host -t cname $word.$dominio;done | grep "alias for"
