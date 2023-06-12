@echo off

REM Configurações do Active Directory
set AD_Server=(Inserir Controller Domain, ex: SRVDC01.Brascloud.com.br
set AD_Domain=(Inserir dominio Brascloud.com.br)
set AD_Admin=(Inserir usuário com privilegios de administrador de dominio)
set AD_Password=(Senha do usuário com privilegios)

REM Configurações do novo usuário
set New_Username=newuser
set New_UserPassword=newpassword

REM Configurações dos servidores DNS
set DNS1=(Controler Domain 1, 192.168.0.20)
set DNS2=(Controler Domain 2, 192.168.0.21) 

REM Unir a máquina ao Active Directory
echo Unindo a máquina ao Active Directory...
echo.
echo Digite o nome de usuário e a senha do administrador do Active Directory.
echo.
netdom join %COMPUTERNAME% /domain:%AD_Domain% /userD:%AD_Admin% /passwordD:%AD_Password%

———
REM Desativar o usuário administrador do sistema
REM Caso não for efetuar a utilização do Software do Profwiz
echo Desativando o usuário administrador...
echo.
net user administrator /active:no

————

REM Copiar o usuário raiz para um novo usuário do Active Directory
echo Copiando o usuário raiz para o novo usuário...
echo.
dsadd user "CN=%New_Username%,OU=Users,DC=%AD_Domain%" -samid %New_Username% -upn %New_Username%@%AD_Domain% -fn %New_Username% -ln User -display %New_Username% -pwd %New_UserPassword% -desc "Novo usuário do Active Directory" -memberof "CN=Domain Users,CN=Users,DC=%AD_Domain%" -hmdir "C:\Users\%New_Username%" -hmdrv H:

——-
REM Configurar os servidores DNS
echo Configurando servidores DNS...
echo.
netsh interface ipv4 set dns name="Local Area Connection" static %DNS1% primary
netsh interface ipv4 add dns name="Local Area Connection" addr=%DNS2% index=2
———

REM Reiniciar o computador
echo Reiniciando o computador...
shutdown /r /t 0
