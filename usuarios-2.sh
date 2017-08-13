#!/bin/bash
#
##################################################################################################
# usuarios.sh
#
# Este programa mostra uma listagem dos usuários do sistema, no formato "login TAB nome completo".
#
# Comandos:
#
# cut - extrai os campos desejados do arquivo de usuários (/etc/passwd);
# tr - filtra esta saída transformando todos os dois-pontos em TABs.
#
##################################################################################################
#
# Mostra os logins e nomes de usuários do sistema
# Obs: Lê dados do arquivo /etc/passwd
#
# Exemplo do livro "shell script profissional, de Aurelio Marinho Jargas"
#
# Versão 1: Mostra usuários e nomes separados por TAB
# Versão 2: Adicionado suporte à opção -h
#
# João Paulo, Outubro de 2014
#
##################################################################################################


MENSAGEM_USO="
Uso: $0 [-h]	

	-h	Mostra esta tela de ajuda e sai
"	

# O [-h] indica que este parâmetro é opcional

# Tratamento das opções de linha de comando
if test "$1" = "-h"
then
	echo "$MENSAGEM_USO"	
	exit 0
fi

# Processamento
cut -d : -f 1,5 /etc/passwd | tr : \\t
