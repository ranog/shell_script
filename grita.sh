#!/bin/bash
# grita.sh (com defeito)
#
# Mostra uma palabra ($TXT) em maiúculas e com exclamações
# Exemplo: foo -> !!!!!FOO!!!!!
# 
# Exemplo do livro shell script profissional
#
# João Paulo, Outubro de 2014
#

TXT="gritaria"
TXT="     $TXT     "		# Adiciona 5 espaços ao redor
TXT=$(echo $TXT | tr ' ' '!')	# Troca os espaços por exclamações
TXT=$(echo $TXT | tr a-z A-Z)	# Deixa o texto em maiúsculas	
echo "$TXT"			# Mostra a mensagem

