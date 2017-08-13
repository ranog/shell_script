#!/bin/bash
# grita.sh 
#
# Mostra uma palabra ($TXT) em maiúculas e com exclamações
# Exemplo: foo -> !!!!!FOO!!!!!
#
#--------------------------------------------------------------------------------------------
# 
# Versao 1: com defeito (exclamações não estão aparecendo)
# Versao 2: debug simples ()
# Versao 3: sempre use "aspas" ao redor da variáveis
# Versao 4: Debug personalizado
#		> Criar uma função específica para cuidar da depuração:
#
#			Debug(){
#				["$DEBUG"=1] && echo "$*"
#			}
#		
#		  	A função Debug() é uma evolução do debug simples com o echo. Só vai
#	          mostrar a mensagem de depuração quando a variável global $DEBUG estiver
#	          definida com o valor 1.
#
#--------------------------------------------------------------------------------------------
#
# Exemplo do livro shell script profissional
#
# João Paulo, Outubro de 2014
#


DEBUG=1				# depuração: 0 desliga, 1 liga


# Função de depuração (mostra as mensagens de depuração em amarelo)

Debug(){
	[ "$DEBUG"=1 ] && echo -e "\033[33;1m$*\033[m"  # XXX terminal:[1=1]:command not found > tem que deixar espaços entre os []
							# [_"$DEBUG"=1_]  
}


TXT="gritaria"


TXT="     $TXT     "		# Adiciona 5 espaços ao redor


Debug "TXT com espacos	: [$TXT]"
TXT=$(echo "$TXT" | tr ' ' '!')	# Troca os espaços por exclamações
Debug "TXT com exclamacoes: [$TXT]"


TXT=$(echo "$TXT" | tr a-z A-Z)	# Deixa o texto em maiúsculas	
echo "$TXT"			# Mostra a mensagem

