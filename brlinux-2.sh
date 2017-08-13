#!/bin/bash
# brlinux-2.sh
# Mostra as 5 últimas manchetes do BR-linux
# Versão 1 - procura no texto
# Versão 2 - procura no código HTML
#
# Exemplo do livro shell script profissional
#
# João Paulo, Outubro de 2014


URL="http://br-linux.org"


# O padrão são linhas com "<h2><a href";
# O sed remove as tags HTML, restaura as aspas e apaga os espaços do início;
# O head limita o número de manchetes em 5.
#

lynx -source "$URL" |
	 grep '<h2><a href' |
	 sed '
		s/<[^>]*>//g 
		s/&quot;/"/g
		s/^  *//' |
	 head -n 5
