#!/bin/bash

# Solicitar o endereço IP do alvo
echo "Digite o endereço IP do alvo: "
read target_ip

# Prompt para selecionar o tipo de scan
echo "Selecione o tipo de scan que deseja rodar:"
echo "1. Scan rápido"
echo "2. Scan completo"
echo "3. Scan de varredura de ping"
echo "4. Scan de descoberta de hosts"
echo "5. Scan de serviço com detecção de versão"
echo "6. Scan de script NSE básico"
echo "7. Scan de script NSE completo"
echo "8. Scan de script NSE agressivo"
echo "9. Scan de script NSE exclusivo"
echo "10. Scan de script NSE HTTP"
echo "11. Scan de script NSE SSL"
echo "12. Scan de script NSE SMB"
echo "13. Scan de script NSE SNMP"
echo "14. Scan de script NSE DNS"
echo "15. Scan de script NSE FTP"
echo "16. Scan de script NSE MySQL"
echo "17. Scan de script NSE SSH"
echo "18. Scan de script NSE Telnet"
echo "19. Scan de script NSE LDAP"
echo "20. Scan de script NSE SMTP"
echo "21. Scan de script NSE SIP"
echo "22. Scan de script NSE RPC"
echo "23. Scan de script NSE SNMP"

read scan_type

# Definir a variável scan_type_option com base no tipo de scan selecionado
case $scan_type in
    1)
        scan_type_option="-T4" # Scan rápido, verifica os hosts ativos sem verificar as portas
        ;;
    2)
        scan_type_option="-p- -T4" # Scan completo, verifica todas as portas
        ;;
    3)
        scan_type_option="-sn" # Varredura de ping, verifica se os hosts estão ativos sem verificar as portas
        ;;
    4)
        scan_type_option="-sL" # Descoberta de hosts, lista os hosts que respondem ao ping
        ;;
    5)
        scan_type_option="-sV" # Serviço com detecção de versão, identifica as versões dos serviços em execução nas portas abertas
        ;;
    6)
        scan_type_option="-sC" # Script NSE básico, executa os scripts mais comuns do NSE
        ;;
    7)
        scan_type_option="-sC -sV" # Script NSE completo, executa os scripts do NSE que levam mais tempo para executar
        ;;
    8)
        scan_type_option="-sC -sV -A" # Script NSE agressivo, executa os scripts mais intrusivos do NSE
        ;;
    9)
        scan_type_option="-sC -sV -A -sX" # Script NSE exclusivo, executa os scripts do NSE que foram escritos para um único serviço
        ;;
    10)
        scan_type_option="-sC -sV --script=http*" # Script NSE HTTP, executa os scripts do NSE que se concentram em serviços HTTP
        ;;
    11)
        scan_type_option="-sC -sV --script=ssl*" # Script NSE SSL, executa os scripts do NSE que se concentram em serviços SSL/TLS
        ;;
    12)
        scan_type_option="-sC -sV --script=smb*" # Script NSE SMB, executa os scripts do NSE que se concentram em serviços SMB/CIFS
        ;;
    13)
        scan_type_option="-sC -sV --script=snmp*" # Script NSE SNMP, executa os scripts do NSE que se concentram em serviços SNMP
        ;;
    14)
        scan_type_option="-sC -sV --script=dns*" # Script NSE DNS, executa os scripts do NSE que se concentram em serviços DNS
        ;;
    15)
        scan_type_option="-sC -sV --script=ftp*" # Script NSE FTP, executa os scripts do NSE que se concentram em serviços FTP
        ;;
    16)
        scan_type_option="-sC -sV --script=mysql*" # Script NSE MySQL, executa os scripts do NSE que se concentram em serviços MySQL
        ;;
    17)
        scan_type_option="-sC -sV --script=ssh*" # Script NSE SSH, executa os scripts do NSE que se concentram em serviços SSH
        ;;
    18)
        scan_type_option="-sC -sV --script=telnet*" # Script NSE Telnet, executa os scripts do NSE que se concentram em serviços Telnet
        ;;
    19)
        scan_type_option="-sC -sV --script=ldap*" # Script NSE LDAP, executa os scripts do NSE que se concentram em serviços LDAP
        ;;
    20)
        scan_type_option="-sC -sV --script=smtp*" # Script NSE SMTP, executa os scripts do NSE que se concentram em serviços SMTP
        ;;
    21)
        scan_type_option="-sC -sV --script=sip*" # Script NSE SIP, executa os scripts do NSE que se concentram em serviços SIP
        ;;
    22)
        scan_type_option="-sC -sV --script=rpc*" # Script NSE RPC, executa os scripts do NSE que se concentram em serviços RPC
        ;;
    23)
        scan_type_option="-sC -sV --script=snmp*" # Script NSE SNMP, executa os scripts do NSE que se concentram em serviços SNMP
        ;;
    *)
        echo "Opção inválida de scan selecionada."
        exit 1
        ;;
esac

# Solicitar as portas a serem scaneadas
echo "Digite as portas a serem scaneadas (ex: 80,443,8080): "
read target_ports

# Obter a data e hora atual
current_datetime=$(date +"%Y-%m-%d_%H-%M-%S")

# Executar o NMAP com as opções selecionadas
nmap $scan_type_option -p $target_ports $target_ip -oN "$target_ip-$current_datetime.txt"

echo "O scanning foi concluído com sucesso. A saída foi salva em $target_ip-$current_datetime.txt."
