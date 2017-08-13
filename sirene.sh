#!/bin/bash
# sirene.sh
# Bom para chamar atenção dos colegas de trabalho :)
#
# Exemplo do livro shell script
#
# João Paulo, Outubro de 2014
#

echo -ne "\033[11;900]"				# Cada bipe dura quase um segundo
while :
do
	echo -ne "\033[10;500]\a" ; sleep 1	# Tom alto (agudo)
	echo -ne "\033[10;400]\a" ; sleep 1	# Tom baixo (grave)
done
