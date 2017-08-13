#!/bin/bash
#usuarios.sh
#
# Mostra os logins e nomes de usuários do sistema
# Obs: Lê dados do arquivo /etc/passwd
#
# Versao 1: Mostra usuários e nomes separados por TAB
# Versao 2: Adicionado suporte à opção -h
# Versao 3: Adicionado suporte à opção -V e opção inválidas
# Versao 4: Arrumado bug quando não tem opção, basename no
#	    nome do programa, -V extraindo direto dos cabeçalhos,
#	    adicionadas opções --help e --version
# Versao 5: Adicionadas opção -s e --sort
#
# Exemplo do livro shell script profissional, Aurelio.
#
# João Paulo, Outubro de 2014
#


ordenar=0	# A saida deverá ser ordenada?


MENSAGEM_USO="
Uso: $(basename "$0") [-h | -V]

	-s, --sort	Ordena a listagem alfabeticamente
	-h, --help	Mostra esta tela de ajuda e sai
	-V, --version	Mostra a versao do programa e sai
"

# Tratamento das opções de linha de comando
case "$1" in


	-s | --sort)
		ordenar=1
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
		if test -n "$1"
		then
			echo Opcao invalida: $1
			exit 1
		fi
	;;
esac

# Extrai a listagem
lista=$(cut -d : -f 1,5 /etc/passwd)

# Ordena a listagem (se necessário)
if test "$ordenar" = 1
then
	lista=$(echo "$lista" | sort)
fi

# Mostra o resultado para o usuário
echo "$lista" | tr : \\t
