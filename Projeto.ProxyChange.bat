@echo off
title ProxyChange - Versao 1.01 - By LeRc
MODE CON: COLS=50 LINES=20

:motd
echo.
@echo "###########################################"
@echo "#    ___       ___       ___       ___    #" 
@echo "#   /\__\     /\  \     /\  \     /\  \   #" 
@echo "#  /:/  /    /::\  \   /::\  \   /::\  \  #"
@echo "# /:/__/    /::\:\__\ /::\:\__\ /:/\:\__\ #"
@echo "# \:\  \    \:\:\/  / \;:::/  / \:\ \/__/ #"
@echo "#  \:\__\    \:\/  /   |:\/__/   \:\__\   #"
@echo "#   \/__/     \/__/     \|__|     \/__/   #"
@echo "#                                         #"
@echo "###########################################"
@echo "#  SELECIONE O SERVIDOR PROXY DE DESTINO  #"
@echo "###########################################"
echo.

@echo off
echo 1 = Servidor A
echo 2 = Servidor B
echo.
echo 0 = DESABILITAR SERVIDOR
echo.
set /p OPCAO=Digite o No do Servidor Proxy desejado: 

IF %OPCAO% EQU 0 GOTO 000
IF %OPCAO% EQU 1 GOTO 001
IF %OPCAO% EQU 2 GOTO 002
IF %OPCAO% EQU GOTO ERR


:ERR
@echo off
cls
echo.
ECHO   FUNCAO INVALIDA. VERIFIQUE O PAINEL E TENTE NOVAMENTE.
ECHO.       
ECHO OFF
PAUSE
ECHO PRESSIONE QUALQUER TECLA PRA CONTINUAR.
cls
GOTO motd


:001
cls
@echo off
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /t REG_SZ /d "200.200.200.1:8080" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f
echo "# As configuracoes de Proxy foram alteradas no seu navegador para:"
echo "[ 200.200.200.1:8080 - Servidor A ]"
@echo off
pause
cls
GOTO motd

:002
cls
@echo off
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /t REG_SZ /d "200.200.200.1:8080" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f
echo "# As configuracoes de Proxy foram alteradas no seu navegador para:
echo "[ 200.200.200.2:8080 - Servidor B ]
@echo off
pause
cls
GOTO motd
:000
cls
@echo off
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f
echo Servidor proxy desabilitado.
@echo off
pause
cls
GOTO motd

