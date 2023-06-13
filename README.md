# Active-Directory
Scripts para otimização de configuração de active Directory

# Script em Batch para Configurações do Active Directory

Este repositório contém um script em batch que automatiza configurações relacionadas ao Active Directory. O script pode ser usado para unir uma máquina ao domínio, criar um novo usuário no Active Directory, configurar servidores DNS e desativar o usuário administrador do sistema.

## Pré-requisitos

Certifique-se de ter os seguintes requisitos antes de executar o script:

- Acesso privilegiado a um controlador de domínio do Active Directory.
- Conhecimento dos valores necessários para preencher as variáveis no script (como nome do controlador de domínio, domínio, usuário administrador e senha).

## Utilização

1. Abra o script `active_directory_setup.bat` em um editor de texto.
2. Preencha as variáveis `AD_Server`, `AD_Domain`, `AD_Admin` e `AD_Password` com as informações corretas do seu ambiente de Active Directory.
3. Preencha as variáveis `New_Username` e `New_UserPassword` com as informações do novo usuário que deseja criar.
4. Preencha as variáveis `DNS1` e `DNS2` com os endereços IP dos servidores DNS do domínio.
5. Salve as alterações no arquivo.
6. Execute o script `active_directory_setup.bat` como administrador.

**Importante:** Tenha cuidado ao executar scripts que alteram as configurações do Active Directory. Verifique se todas as informações estão corretas antes de prosseguir.

## Funcionalidades do Script

- Unir a máquina ao domínio do Active Directory usando o comando `netdom join`.
- Desativar o usuário administrador do sistema usando o comando `net user`.
- Copiar o usuário raiz para um novo usuário do Active Directory usando o comando `dsadd user`.
- Configurar os servidores DNS usando o comando `netsh interface ipv4`.
- Reiniciar o computador usando o comando `shutdown`.

## Contribuindo

Sinta-se à vontade para contribuir com melhorias ou correções para este script. Basta enviar uma solicitação pull com uma descrição clara das alterações propostas.

## Aviso

Este script é fornecido como está, sem garantias de qualquer tipo. Utilize por sua conta e risco. Sempre faça backup e teste em um ambiente de teste antes de usar em produção.

