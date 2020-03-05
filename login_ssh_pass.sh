#!/bin/bash

# login_ssh_pass.sh
# script simples para conectar a um host via SSH fornecendo um usuário e senha.
# autor: Marco Antonio Damaceno
# data: 05/03/2020
# Versão 0.1

#Mostra o uso correto do script
function PrintUsage() {

	echo "Uso: `basename $0` -u usuario -p senha -s host -hv"
	echo
	echo -e "\n-u usuário com permissão para acessar o host indicado via SSH "
	echo -e "\n-p a senha do usuário informado."
	echo -e "\n-s server hostname ou ip."
	echo -e "\n-h Mostra este help."
	echo -e "\n-v Mostra a versão deste script."
	sleep 2
	exit 1

}

#Mostra a versão deste script
function ScriptVersion() {

		echo "`basename $0` - Versão: 0.1"
		echo "Autor: Marco Antonio Damaceno"
		exit 1

}

while getopts "hvu:p:s:" OPTION
do
	case $OPTION in
		
		h) DO_HELP=1 ;;
		u) USER_SSH=$OPTARG ;;
		p) PASS_SSH=$OPTARG ;;
        s) SERVER_HOST=$OPTARG ;;
		v) DO_VERSION=1 ;;
	esac
done

shift $((OPTIND-1))

if [ -z "$USER_SSH" ] && [ -z "$PASS_SSH" ] && [ -z "$DO_HELP" ] && [ -z "$DO_VERSION" ] && [ -z "$SERVER_HOST" ]; then

	clear
	sleep 1
	echo "Uso incorreto, favor usar como abaixo..."
	echo
	PrintUsage
	
 fi

if [ "$USER_SSH" ] && [ "$PASS_SSH" ] && [ "$SERVER_HOST" ]; then

	clear
    echo "Conectando ao servidor... $SERVER_HOST"
    sshpass -p $PASS_SSH ssh $USER_SSH'@'$SERVER_HOST
    if [ $? = "0" ]; then
        clear
        echo -e "\nConexão estabelecida com sucesso!"
    fi

else

    clear
	sleep 1
	echo "Uso incorreto, favor usar como abaixo..."
	echo
	PrintUsage

fi

if [ "$DO_HELP" == 1 ]; then
	
		PrintUsage
	
fi

if [ "$DO_VERSION" == 1 ]; then
		
		ScriptVersion
	
fi