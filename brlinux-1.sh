#!/bin/bash
# brlinux-1.sh
# Mostra as 5 últimas manchetes do BR-linux
# Versão 1 que procura no texto
#
# Exemplo do livro shell script profissional
#
# João Paulo, Outubro de 2014


URL="http://br-linux.org"


# O padrão são linhas que iniciam com maiúsculas.
# Até a linha "BR-Linux.org" é lixo.
#

lynx -dump -nolist "$URL" | grep '^[A-Z]' | sed '1,/^BR-Linux.org/ d' | head -n 5
