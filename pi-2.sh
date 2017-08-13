#!/bin/bash
# pi.sh
#
# Mostra o valor de Pi sem interação do usuário
# 
#----------------------------------------------------------------------
#
# Versao 1: 
#	    > Adicionado suporte à opçao -p e sua extemção --pi
#	    > Adicionado suporte à opção -h e sua extenção --help
#	    > Adicionado suporte à opção -V e sua extenção --version
#	    > Adicionado suporte opção inválidas
#	    > Extrai versão direto do cabeçalho
#
# Versao 2: Função fatorial recursiva
#
#----------------------------------------------------------------------	
#
# João Paulo, Outubro de 2014
#


MENSAGEM_USO="
Uso: $(basename "$0") [Opcoes]


OPCOES:
	-f, --fatorial		Mostra a definicao de fatorial recursiva
	-p, --pi		Mostra o valor de Pi
	-h, --help		Mostra esta tela de ajuda e sai
	-V, --version		Mostra a versao do programa e sai
"

# Tratamento das opções de linha de comando
while test -n "$1"
do
	case "$1" in

		# Opções que ligam/desligam chaves
		
		-f | --fatorial)
			
			fat=$(echo "define f(x) {
               			if (x <= 1) return (1);
                		return (f(x-1)*x);}" | bc -l) 
           
		 # XXX Tenho que arrumar essa parte, mas não tenho ideia como fazar isso
              		echo "$fat"
			exit 0
		;;
		
		
		-p | --pi)
			pi=$(echo "scale=52; 4*a(1)"| bc -l)
			echo "$pi"
			exit 0
		;;
				
		-h | --help)
			echo "$MENSAGEM_USO"
			exit 0
		;;

		-V | --version )
			echo -n $(basename "$0") 
			# Extrai a versão diretamente dos cabeçalhos do programa
			grep '^# Versao ' "$0" | tail -1 | cut -d : -f 1 | tr -d \#
			exit 0
		;;

		*) 
			echo Opcao invalida: $1
			exit 1
		;;
	esac

	shift
done



