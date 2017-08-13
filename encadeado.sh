#!/bin/bash
# encadeado.sh
#
# Exemplo de como encadear telas usando o operador && (AND).
# Caso o usúario desista em qualquer tela (apertando CANCELAR
# ou ESC), o script executa o primeiro comando após a cadeia
# de &&.
#
# Útil para fazer programas ou brincadeiras onde só há um
# caminho certo a seguir para chegar ao final.
#
# FLUXOGRAMA
#		  INÍCIO
#	      	+--------+
#	      	| tela 1 |-----Cancel/Esc--->---+
#	      	+---OK---+		     	|
#	      	| tela 2 |-----Cancel/Esc--->---+	+----------+
#	      	+---OK---+		   	|------>| desistiu |
#	      	| tela 3 |-----Cancel/Esc--->---+	+----------+
#		+---OK---+			|
#		| tela 4 |-----Cancel/Esc--->---+
#		+---OK---+
#		| final  |
#		+--------+
#		   FIM
#


# Função rápida para chamar a caixa YesNo
simnao(){
	dialog --yesno "$*" 0 0
}


# Aqui começa o encadeamento de telas com o &&.
# Somente apertando o botão OK vai para a próxima tela.
# Há um 'exit' no final, que sai do script caso o usuário
# tenha chegado até o fim da cadeia.
simnao 'Quer continuar?'			&&
simnao 'Estamos na segunda tela. Continua?'	&&
simnao 'Terceira. Continua continuando?'	&&
simnao 'Penúltima tela! E agora, continua?'	&&
echo 'Você chegou até o final!'			&& exit


# Este trecho já não faz mais parte do encadeamento e só
# será alcançado caso o usuário tenha apertado CANCELAR/Esc.
echo Você desistiu antes de chegar no final...

