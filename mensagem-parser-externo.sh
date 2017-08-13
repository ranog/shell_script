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
# Versão 3: Usa parser externo

CONFIG="mensagem.conf"		# Arquivo de configuração

# Configurações (serão lidas do $CONFIG)
USAR_CORES=0			# config: UsarCores
COR_LETRA=			# config: CorLetra
COR_FUNDO=			# config: CorFundo
MENSAGEM='Mensagem padrão'	# config: Mensagem


# Carregando a configuração do arquivo externo
eval $(./parser.sh $CONFIG)


# Processando os valores
[ "$(echo $CONF_USARCORES | tr A-Z a-z)" = 'on' ] && USAR_CORES=1
COR_FUNDO=$(echo $CONF_CORFUNDO | tr -d -c 0-9)	# só números
COR_LETRA=$(echo $CONF_CORLETRA | tr -d -c 0-9)	# só números
[ "$CONF_MENSAGEM" ] && MENSAGEM=$CONF_MENSAGEM


# Configurações lidas, mostre a mensagem

if [ $USAR_CORES -eq 1 ]; then
	# Mostrar mensagem colorida
	# Exemplo: \033[40;32mOlá\033[m
	echo -e "\033[$COR_FUNDO;${COR_LETRA}m$MENSAGEM\033[m"
else
	# Não usar cores
	echo "$MENSAGEM"
fi

