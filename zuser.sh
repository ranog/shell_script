#!/bin/bash
#
# zuser.sh
# Lista, adiciona e remove usuários do sistema Z
#
# Requisitos: bantex.sh
#
# Uso: zuser [ lista | adiciona | remove ]
#
# 2014-11-02 João Paulo
#


# Se não passar nenhum argumento, mostra a mensagem de ajuda
[ "$1" ] || {
	echo
	echo "Uso: zuser [ lista | adiciona | remove ]"
	echo
	echo "	lista		- Lista todos os usuários do sistema"
	echo "	adiciona 	- Adiciona um usuário novo no sistema"
	echo "	remove		- Remove um usuário do sistema"
	echo
	exit 0
}


# Localização do arquivo do banco de dados
BANCO=usuarios.txt


# Inclui o gerenciador do banco
source bantex-4.sh || {
	echo "Ops, ocorreu algum erro no gerenciador do banco"
	exit 1
}


# Lida com os comandos recedidos
case "$1" in


	lista)
		# Lista dos logins (apaga a primeira linha)
		pega_campo 1 | sed 1d
	;;


	adiciona)
		echo -n "Digite o login do usuário novo: "
		read login


		# Temos algo?
		[ $login ] || {
			echo "O login não pode ser vazio, tente novamente."
			exit 1
		}


		# Primerio confere se já não existe esse usuário
		tem_chave "$login" && {
			echo "O usuário '$login' já foi cadastrado."
			exit 1
		}


		# Ok, é um usuário novo, prossigamos
		echo -n "Digite o nome completo: "
		read nome
		echo -n "Digite a idade: "
		read idade
		echo -n "É do sexo masculino ou feminino? [MF] "
		read sexo
		echo


		# Dados obtidos, hora de mascarar eventuais dois-pontos
		nome=$(echo $nome | mascara)


		# Tudo pronto, basta inserir
		insere_registro "$login:$nome:$idade:$sexo"
		echo
	;;


	remove)
		# Primeiro mostra a lista de usuários, depois pergunta
		echo "Lista dos usuários do sistema Z:"
		pega_campo 1 | sed 1d | tr \\n ' '
		echo
		echo
		echo -n "Qual usuário você quer remover? "
		read login
		echo


		# Vamos apagar ou puxar a orelha?
		if tem_chave "$login"; then
			apaga_registro "$login"
		else
			echo "Não, não, esse usuário não está aqui..."
		fi
		echo
	;;


	*)
		# Qualquer outra opção é erro
		echo "Opção inválida $1"
		exit 1
	;;
esac

