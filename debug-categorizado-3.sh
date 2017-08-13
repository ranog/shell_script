#!/bin/bash
# debug-categorizado.sh
#
# Versao 1: Exemplo de Debug categorizado em três níveis
# Versao 2: Função de debug mais parruda

DEBUG=${1:-0}		# passe o nível pelo $1

Debug(){
	[ $1 -le $DEBUG ] || return
	local prefixo
	case "$1" in
		1) prefixo="-- " 				;;
		2) prefixo="---- "				;;
		3) prefixo="------ " 				;;
		*) echo "Mensagem nao categorizada: $*"; return ;; #XXX não sei oque esta acontecendo
	esac
	shift

	echo $prefixo$*
}


Debug 1 "Inicio do Programa"


i=0
max=5
echo "Contando ate $max"


Debug 2 "Vou entrar o WHILE"


while [ $i -ne $max ]; do


	Debug 3 "Valor de \$i antes de incrementar: $i"
	let i=$i+1
	Debug 3 "Valor de \$i depois de incrementar: $i"


	echo "$i..."
done


Debug 2 "Sai do WHILE"


echo 'Terminei!'


Debug 1 "Fim do Programa"
