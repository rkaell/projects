@echo off
::Feito Por Rhuann Kaell Souza Nascimento
::04/09/2017
::Facilitou o Scan de rede pra mim, já que não posso usar nmap
mode 50,20
color 02
title Scan de Ips

::Bloco Principal
:menu
echo #####################
echo Iniciando Scan de IPS
echo #####################
@echo off
@echo off
echo 1 - ping host
echo 2 - ping range

set /p choice=O Que Deseja Fazer?:

if %choice%==1 goto host
if %choice%==2 goto range
echo ##############
echo Opcao Invalida
pause
cls
goto menu


::Bloco de ping normal
:host
set /p h= Insira o ip do host: 
ping %h%
echo ########################
echo PING REALIZADO
pause
cls
goto :menu


::Bloco de range
:range
IF EXIST IPScan.txt (
    echo ##########################
    echo delete o arquivo anterior
    pause
    cls
    goto menu
    )
set /p h=Ip da rede sem campo de hosts e com ponto:
FOR /L %%a IN (1,1,254) DO @(echo Pinging IP: %h%%%a
ping -n 1 -w 500 %h%%%a | FIND /i "Resposta">> IPScan.txt
if %%a==254 echo Scan completo
)
echo #########################
echo Verificar arquivo IPScan
pause
cls
goto menu

exit
