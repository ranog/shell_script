#!/bin/bash
#
# modelo_cabecalho.sh - Exemplo: Busca o nome completo de um usuário no Unix
#
# Site		: http://programas.com.br/nomecompleto/
# Autor		: João Silva <joao@email.com.br>
# Manutenção	: Maria Teixeira <maria@email.com.br>
#
#----------------------------------------------------------------------------
# Este programa recebe como parâmetro o login de um usuário e procura em 
# várias bases qual o seu nome completo, retornando o resultado na saída 
# padrão (STDOUT).
#
# Exemplo:
#	$ ./nome_completo.sh jose
#	José Moreira
#	$ ./nome_completo.sh joseeee
#	$
#
# A ordem de procura do nome completo é sequencial:
#
#	1. Arquivo /etc/passwd
#	2. Arquivo $HOME/.plan
#	3. Base de Usuários LDAP
#	4. Base de Usuários MySQL
#
# Respeitando a ordem, o primeiro resultado encontrado será o retornado.
#--------------------------------------------------------------------------
#
#
# Histórico:
#
#	v1.0 1999-05-18, João Silva:
#		- Versão inicial procurando no /etc/passwd
#	v1.1 1999-08-02, João Silva:
#		- Adicionada pesquisa no $HOME/.plan
#		- Corrigindo bug com nomes acentuados
#	...
#
#
# Licença: GPL.
#
