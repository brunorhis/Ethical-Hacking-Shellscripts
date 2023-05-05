#!/bin/bash



echo " digite o ip: "
read dominio
echo "Fazendo a leitura do range de IP..."
sleep 2

range01=$(whois $dominio | grep "inetnum:" | cut -d "." -f4 | cut -d " " -f1)
range02=$(whois $dominio | grep "inetnum:" | cut -d "." -f7 | cut -d " " -f1)
ipinit=$(whois 37.59.174.225 | grep "inetnum:" | awk '{print $2}' | sed 's/...$//')

echo "o range de ip vai do ip $ipinit$range01 ao ip $ip$range02"
echo "========================================================================"
sleep 2
echo "Fazendo a leitura dos DNS..."
echo "========================================================================"
for ipfinal in $(seq $range01 $range02);do
host -t ptr $ipinit$ipfinal
done
