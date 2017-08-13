#!/bin/bash
# usuarios.sh
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
# Versao 6: Adicionadas opções -r, --reverse, -u, --uppercase,
#	    leitura de múltiplas opções (loop)
# Versao 7: Melhorias no código para que fique mais legível,
#	    adicionadas opções -d e --delimiter
# Versao 7g: Modificada para usar o getopts
# 
# Exemplo do livro shell script profissional, Aurelio.
#
# João Paulo, Outubro de 2014
#


ordenar=0	# A saida deverá ser ordenada?
inverter=0	# A saída deverá ser invertida?
maiusculas=0	# A saída deverá ser em maiúsculas?
delim='\t'	# Caractere usado como delimitador de saída


MENSAGEM_USO="
Uso: $(basename "$0") [Opcoes]


OPCOES:

	-d C			Usa o caractere C como delimitador
	-r			Inverte a listagem	
	-s			Ordena a listagem alfabeticamente
	-u			Mostra a listagem em MAIUSCUALAS
	-h			Mostra esta tela de ajuda e sai
	-V			Mostra a versao do programa e sai
"

# Tratamento das opções de linha de comando
while getopts ":hVd:rsu" opcao
do
	case "$opcao" in

		# Opções que ligam/desligam chaves
		s) ordenar=1	;;
		r) inverder=1	;;
		u) maiusculas=1	;;
		
		d)
			delim="$OPTARG"
		;;

		h)
			echo "$MENSAGEM_USO"
			exit 0
		;;

		V)
			echo -n $(basename "$0") 
			# Extrai a versão diretamente dos cabeçalhos do programa
			grep '^# Versao ' "$0" | tail -1 | cut -d : -f 1 | tr -d \#
			exit 0
		;;

		\?)
			echo Opcao invalida: $OPTARG
			exit 1		
		;;

		:)
			echo Faltou argumento para: $OPTARG
			exit 1
		;;
	esac
done


# Extrai a listagem
lista=$(cut -d : -f 1,5 /etc/passwd)

# Ordena, inverte ou converte para maiúsculas (se necessário)
test "$ordenar"    = 1 && lista=$(echo "$lista" | sort)
test "$inverter"   = 1 && lista=$(echo "$lista" | tac)
test "$maiusculas" = 1 && lista=$(echo "$lista" | tr a-z A-Z) 


# Mostra o resultado para o usuário
echo "$lista" | tr : "$delim"
