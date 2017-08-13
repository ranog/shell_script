#!/bin/bash
#
# mensagem.sh
# Mostra uma mensagem colorida na tela, lendo os 
# dados de um arquivo de configuração externo.
#
# 2017-10-27 Nogueia, J.P.R.
#

CONFIG="mensagem.conf"		# Arquivo de configuração

# Configurações (serão lidas do $CONFIG)
USAR_CORES=0			# config: UsarCores
COR_LETRA=			# config: CorLetra
COR_FUNDO=			# config: CorFundo
MENSAGEM='Mensagem padrão'	# config: Mensagem

# Loop para ler linha a linha a configuração, guardando em $LINHA
while read LINHA; do
	# DICA:
	# Basta referenciar o $LINHA sem aspas para que todos
	# os brancos do início e fim da linha sejam removidos,
	# e os espaços e TABs entre a chave e o valor sejam
	# convertidos para apenas um espaço normal.
	#
  	# Descomente as linhas seguintes para testar
	# echo Com aspas: "$LINHA"
	# echo Sem aspas: $LINHA

	# Ignorando as linhas de comentário
	[ "$(echo $LINHA | cut -c1)" = '#' ] && continue

	# Ignorando as linhas em branco
	[ "$LINHA" ] || continue

	# Guarda cada palavra da linha em $1, $2, $3, ...
	# "Suzy é metaleira" fica $1=Suzi $2=é $3=metaleira
	set - $LINHA


	# Extraindo os dados
	# Primeiro vem a chave, o resto é o valor
	chave=$1
	shift
	valor=$*

	# Conferindo se está tudo certo
	echo "+++ $chave --> $valor"

	# Processando as configurações encontradas
	case "$chave" in


	UsarCores)
		[ "$valor" = 'ON' ] && USAR_CORES=1
		;;
	CorFundo)
		COR_FUNDO=$valor
		;;
	CorLetra)
		COR_LETRA=$valor
		;;
	Mensagem)
		MENSAGEM=$valor
		;;
	*)
		echo "Erro no arquivo de configuração"
		echo "Opção desconhecida '$chave'"
		exit 1
		;;
	esac

done < "$CONFIG"

# Configurações lidas, mostre a mensagem

if [ $USAR_CORES -eq 1 ]; then
	# Mostrar mensagem colorida
	# Exemplo: \033[40;32mOlá\033[m
	echo -e "\033[$COR_FUNDO;${COR_LETRA}m$MENSAGEM\033[m"
else
	# Não usar cores
	echo "$MENSAGEM"
fi

