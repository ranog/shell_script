#!/bin/bash
# som.sh
# Demostração de mudança da frequência do Speaker
# Dica: Digite Ctrl+C para finalizar.
#


# Restaura o bipe padrão (f=750, t=100ms)
echo -e '\033[10;750]\033[11;100]'


freq=0					# frequência inicial
while : ; do				# loop infinito
	freq=$((freq+1))		# aumenta frequência
	echo -e "\033[10;$freq]"	# muda frequência no Speaker
	echo "frequencia=$freq"		# mostra frequência atual
	echo -e '\a'			# emite um bipe
	usleep 100
done
