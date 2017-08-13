#!/bin/bash
# cinco.sh
#
# Conta até cinso :)
#
# Versao 1: Debug global (-x, -v) 
#		> comando -v, mostra a linha a que está sendo executada naquele momento do programa;
#		> deve ser digitado direto no terminal: $ bash -v cinco.sh;
#		> comando -x, deve ser digitado no terminal da mesma forma da opção -v.
#
# Vesao 2: Debug setorizado (liga/deliga) 
#		> comando set liga e desliga o debug;
#		> a opção -x (ou -v) liga o debug, e para desligar (a qualquer momento), basta usar o
#		  set mais uma vez, porém com a opção +x (o sinal de mais desliga a opção).
#
#		COMANDO				DESCRIÇÃO
#		set -x		Liga o modo depuração de comandos.
#		set +x		Desliga o modo de depuração de comandos.
#		set -v		Liga o modo depuração de linhas.
#		set +v		Desliga o modo depuração de linhas.
#
# ** Tanto faz usar estes comandos no console ou dentro do programa.				  	
#
# Versao 3: Debug setorizado múltiplo
#
# Exemplo do livro shell script profissional
#
# João Paulo, Outubro de 2014
#

set -v		# liga debug de linhas
echo $((0+1))
echo $((0+2))
set +v		# desliga debug de linhas
echo $((0+3))
set -x		# liga debug de comandos
echo $((0+4))
echo $((0+5))
set +x		# desliga debug de comandos
