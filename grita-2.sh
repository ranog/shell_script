#!/bin/bash
# grita.sh 
#
# Mostra uma palabra ($TXT) em maiúculas e com exclamações
# Exemplo: foo -> !!!!!FOO!!!!!
# 
# Versao 1: com defeito (exclamações não estão aparecendo)
# Versao 2: debug simples ()
#
# Exemplo do livro shell script profissional
#
# João Paulo, Outubro de 2014
#

TXT="gritaria"


TXT="     $TXT     "		# Adiciona 5 espaços ao redor


echo "TXT com espacos	 : [$TXT]"
TXT=$(echo $TXT | tr ' ' '!')	# Troca os espaços por exclamações
echo "TXT com exclamacoes: [$TXT]"


TXT=$(echo $TXT | tr a-z A-Z)	# Deixa o texto em maiúsculas	
echo "$TXT"			# Mostra a mensagem

