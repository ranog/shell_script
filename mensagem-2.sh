#!/bin/bash
#
# mensagem.sh
# Mostra uma mensagem colorida na tela, lendo os 
# dados de um arquivo de configuração externo.
#
# 2017-10-27 Nogueia, J.P.R.
#
# Versão 1: Mostra uma mesnsagem colorida lendo dados de um aquivo de configuração externo
# Versão 2: Correção das falhas:
#		1° Chave tanto em maiúscula ou minúscula
#		2° Valores numéricos fora da faixa permitida (30-37, 40-47)
#		3° Usuario configura o valor com um texto e não numérico
#		4° Usuario não passa o valor
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
	chave=$(echo $1 | tr A-Z a-z)
	shift
	valor=$*

	# Conferindo se está tudo certo
	echo "+++ $chave --> $valor"

	# Processando as configurações encontradas
	case "$chave" in


	usarcores)
		[ "$(echo $valor | tr A-Z a-z)" = 'on' ] && USAR_CORES=1
		;;
	corfundo)
		COR_FUNDO=$(echo $valor | tr -d -c 0-9)	# só números
		;;
	corletra)
		COR_LETRA=$(echo $valor | tr -d -c 0-9) # só números
		;;
	mensagem)
		[ "$valor" ] && MENSAGEM=$valor
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

