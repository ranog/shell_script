#!/bin/bash
#
##################################################################################################
# usuarios.sh
#
# Mostra os logins e nomes de usuários do sistema
# Obs: Lê dados do arquivo /etc/passwd
#
# Exemplo do livro "shell script profissional, de Aurelio Marinho Jargas"
#
# João Paulo, Outubro de 2014
#
# Este programa mostra uma listagem dos usuários do sistema, no formato "login TAB nome completo".
#
# Comandos:
#
# cut - extrai os campos desejados do arquivo de usuários (/etc/passwd);
# tr - filtra esta saída transformando todos os dois-pontos em TABs.
#
##################################################################################################


cut -d : -f 1,5 /etc/passwd | tr : \\t
