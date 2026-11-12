@echo off
chcp 65001 >nul
setlocal EnableDelayedExpansion

net session >nul 2>&1
if errorlevel 1 (
    cls
    echo Execute este programa como administrador.
    pause
    exit /b
)

set "line1=                                            |      _____  _____  _____  |   /"
set "line2=                                            |     | ____||__  / |__  /  |  /"
set "line3=                                            |     |  _|    / /    / /   | /"
set "line4=                                            |____ | |___  / /_  / /_   |<"
set "line5=                                            |_____|_____||_____|_____| |  \"
set "line6=                                                                       ."
set "line7=                                                    Iniciando script..."
echo.
for /L %%i in (1,1,7) do (
    echo !line%%i!
    ping 127.0.0.1 -n 1 -w 120 >nul
)

timeout /t 3 >nul
cls

set /a randomico=%random% % 4

:: COR BASE (Roxo neon)
set /a corBaseR=90
set /a corBaseG=0
set /a corBaseB=180

:: VARIAÇÃO (Roxo escuro → violeta claro)
set /a variacaoR=120     :: 90 → 210
set /a variacaoG=80      :: 0 → 80
set /a variacaoB=75      :: 180 → 255


set g=[92m
set r=[91m
set red=[04m
set l=[1m
set w=[0m
set b=[94m
set m=[95m
set p=[35m
set c=[35m
set d=[96m
set u=[0m
set z=[91m
set n=[96m
set y=[40;33m
set g2=[102m
set r2=[101m
set t=[40m
set gg=[93m
set q=[90m
set gr=[32m
set o=[38;5;202m
set bb=[38;5;74m
set nn=[38;5;82m
set rr=[1;91m
set blb=[1;94m
set bn=[1;38;5;129m
set ha=[38;5;203m
set frr=[38;2;0;255;255m
set fw=[97m
set "redd=[04m" 
set ha=[38;5;203m
set "fk=[92m" 
set "xv=[91m" 
set "spar=[04m" 
set "sof=[1m" 
set "ww=[0m" 
set "bvv=[94m" 
set "op=[96m" 
set "tq=[0m" 
set "mnb=[91m"
set "zi=[96m" 
set "er=[40;33m" 
set "po=[40m" 
set "pu=[93m" 
set "cya=[96m" 
set "ggg=[90m" 
set "rp=[35m" 
set "drp=[95m" 
set "dr=[38;5;90m" 

cls

title LEZZK
cls
set "ESC="
cls

:menu

echo %ESC%[0m
cls

echo(
set "lines[0]=                                            |      _____  _____  _____  |   /"
set "lines[1]=                                            |     | ____||__  / |__  /  |  /"
set "lines[2]=                                            |     |  _|    / /    / /   | /"
set "lines[3]=                                            |____ | |___  / /_  / /_   |<"
set "lines[4]=                                            |_____| |_____||_____|_____|  |  \"
                                                                         

for /L %%j in (0,1,82) do (
    set /a "corR=corBaseR + (variacaoR * %%j / 82)"
    set /a "corG=corBaseG + (variacaoG * %%j / 82)"
    set /a "corB=corBaseB + (variacaoB * %%j / 82)"
    set "esc[%%j]=!ESC![38;2;!corR!;!corG!;!corB!m"
)

for /L %%i in (0,1,4) do (
    set "texto=!lines[%%i]!"
    set "textoGradiente="
    for /L %%j in (0,1,82) do (
        set "char=!texto:~%%j,1!"
        if "!char!" == " " set "char= "
        set "textoGradiente=!textoGradiente!!esc[%%j]!!char!"
    )
    echo( !textoGradiente!!ESC![0m
)


echo 	 	 %q%

echo(
echo.
echo         %m%[ %m%1 %m%]%w% Criar Ponto de Restauração                %m%[ %m%2 %m%]%w% Otimizar Windows
echo.
echo         %m%[ %m%3 %m%]%w% Otimizar Jogos                            %m%[ %m%4 %m%]%w% Melhorar Conexão/Ping
echo.
echo         %m%[ %m%5 %m%]%w% Liberar Memória Ram                       %m%[ %m%6 %m%]%w% Otimizar AMD/Intel/Nvidia                        
echo.
echo         %m%[ %m%7 %m%]%w% Configurar Inicialização                  %m%[ %m%8 %m%]%w% Fix de Erros%w%
echo.
echo                                        %op%[ 9 %op%]Fechar Script%w%                                                          
echo.
set /p opcao="Escolha uma opção:%w% "%w%


if "%opcao%"=="1" goto opcao1
if "%opcao%"=="2" goto menuwindows
if "%opcao%"=="3" goto prioridadegames
if "%opcao%"=="4" goto ping
if "%opcao%"=="5" goto limparram
if "%opcao%"=="6" goto amdintelnvidia
if "%opcao%"=="7" goto autorun
if "%opcao%"=="8" goto fix
if "%opcao%"=="9" goto sair

echo Opção inválida. Tente novamente.
pause
cls
goto :menu

:ping
echo aplicando otimizações...
ipconfig /flushdns
ipconfig /release
ipconfig /renew
Echo Abrindo DNSJumper!
start "" "%~dp0DnsJumper.exe"
echo Abrindo comando...
pause
cls
goto :menu

:sair
Echo Saindo do programa...
exit

:limparram
Echo Limpando Memória ram...
set "emptyStandbyList=%~dp0EmptyStandbyList.exe"

if not exist "%emptyStandbyList%" (
    echo [ERRO] O arquivo EmptyStandbyList.exe nao foi encontrado.
    echo Certifique-se de que ele esta na mesma pasta deste script.
    pause
    exit /b
)

echo Limpando o cache de memoria RAM...
"%emptyStandbyList%" workingsets
"%emptyStandbyList%" modifiedpagelist
"%emptyStandbyList%" standbylist
echo Memoria RAM otimizada com sucesso!

pause
cls
goto :menu

:opcao1
cls
echo Criando ponto de Restauração...
reg add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v SystemRestorePointCreationFrequency /t REG_DWORD /d 0 /f >nul
powershell -Command "Checkpoint-Computer -Description 'iGust RestorePoint' -RestorePointType 'MODIFY_SETTINGS'"
echo(
echo Criando backup do Regedit...
set "backup=%~dp0Backup"
if not exist "%backup%" mkdir "%backup%"
echo Fazendo backup das chaves de otimização...
timeout /t 1 >nul
reg export "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" "%backup%\Explorer.reg" /y
reg export "HKCU\Software\Microsoft\GameBar" "%backup%\GameBar.reg" /y
reg export "HKCU\System\GameConfigStore" "%backup%\GameConfigStore.reg" /y
reg export "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" "%backup%\SystemProfile.reg" /y
reg export "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" "%backup%\Games.reg" /y
reg export "HKLM\SYSTEM\CurrentControlSet\Services" "%backup%\Services.reg" /y
reg export "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" "%backup%\MemoryManagement.reg" /y
reg export "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip" "%backup%\Tcpip.reg" /y
reg export "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" "%backup%\GraphicsDrivers.reg" /y
reg export "HKCU\Control Panel\Mouse" "%backup%\Mouse.reg" /y
reg export "HKCU\Control Panel\Keyboard" "%backup%\Keyboard.reg" /y
reg export "HKCU\Control Panel\Desktop" "%backup%\Desktop.reg" /y
echo Ponto de restauração criado com sucesso!
pause
start "" "%~f0"
exit

:amdintelnvidia
echo %ESC%[0m
cls
set "ESC="
cls
echo(
set "lines[0]=            __________________ ____ ___       /\  ___________________ ____ ___ "
set "lines[1]=           /  _____/\______   \    |   \     / /  \_   ___ \______   \    |   \"
set "lines[2]=          /   \  ___ |     ___/    |   /    / /   /    \  \/|     ___/    |   /"
set "lines[3]=          \    \_\  \|    |   |    |  /    / /    \     \___|    |   |    |  / "
set "lines[4]=           \______  /|____|   |______/    / /      \______  /____|   |______/  "
set "lines[5]=                  \/                      \/              \/                   

for /L %%j in (0,1,110) do (
set /a "corR=corBaseR + (variacaoR * %%j / 82)"
set /a "corG=corBaseG + (variacaoG * %%j / 82)"
set /a "corB=corBaseB + (variacaoB * %%j / 82)"
set "esc[%%j]=!ESC![38;2;!corR!;!corG!;!corB!m"
)

for /L %%i in (0,1,5) do (
set "texto=!lines[%%i]!"
set "textoGradiente="
for /L %%j in (0,1,82) do (
set "char=!texto:~%%j,1!"
if "!char!" == " " set "char= "
set "textoGradiente=!textoGradiente!!esc[%%j]!!char!"
)
echo( !textoGradiente!!ESC![0m
)

echo.

echo.
echo                        %op%Escolha%w% a %op%opção%w% que você quer %op%otimizar:%w%
echo.
echo.
echo              %m%[ %m%1 %m%]%w% Otimizar AMD                     %m%[ %m%2 %m%]%w% Otimizar Nvidia
echo.
echo              %m%[ %m%3 %m%]%w% Otimizar Intel                   %op%[ %op%4 %op%]%op% REVERTER
echo.
echo                                %op%[ %op%5 %op%]%op% Menu Principal%w%
echo.

echo.
set /p opcao="Digite o número: "
cls

if %opcao% equ 1 goto amd
if %opcao% equ 2 goto nvidia
if %opcao% equ 3 goto intel
if %opcao% equ 4 goto reverteramdintelnvidia
if %opcao% equ 5 goto :menu

:amd
cls
echo Otimizando amd...
echo Desativando MPO
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v OverlayTestMode /t REG_DWORD /d 5 /f

echo Desativando Xbox Game Bar / Capturas
reg add "HKCU\Software\Microsoft\GameBar" /v ShowStartupPanel /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\GameBar" /v AllowAutoGameMode /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\GameBar" /v AutoGameModeEnabled /t REG_DWORD /d 1 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f

echo Desativando Fullscreen Optimizations global
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehaviorMode /t REG_DWORD /d 2 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_HonorUserFSEBehaviorMode /t REG_DWORD /d 1 /f

echo Aumentando Prioridade para jogos
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v GPU Priority /t REG_DWORD /d 8 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Priority /t REG_DWORD /d 6 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Scheduling Category /t REG_SZ /d High /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v SFIO Priority /t REG_SZ /d High /f

echo.
echo AMD Boost aplicado.

pause
cls
goto :amdintelnvidia

:nvidia
cls
echo Otimizando nvidia...
echo Desativando MPO
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v OverlayTestMode /t REG_DWORD /d 5 /f

echo Desativando Xbox Game Bar / Capturas
reg add "HKCU\Software\Microsoft\GameBar" /v ShowStartupPanel /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\GameBar" /v AllowAutoGameMode /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\GameBar" /v AutoGameModeEnabled /t REG_DWORD /d 1 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f

echo Desativando Fullscreen Optimizations global
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehaviorMode /t REG_DWORD /d 2 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_HonorUserFSEBehaviorMode /t REG_DWORD /d 1 /f

echo Desativando NVIDIA Telemetry Container, se existir
sc stop NvTelemetryContainer >nul 2>&1
sc config NvTelemetryContainer start= disabled >nul 2>&1

echo Aumentando Prioridade para jogos
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v GPU Priority /t REG_DWORD /d 8 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Priority /t REG_DWORD /d 6 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Scheduling Category /t REG_SZ /d High /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v SFIO Priority /t REG_SZ /d High /f

echo.
echo NVIDIA Boost aplicado.
pause
cls
goto :amdintelnvidia

:intel
cls
echo Otimizando intel...
echo Desativando MPO
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v OverlayTestMode /t REG_DWORD /d 5 /f

echo Desativando Xbox Game Bar / Capturas
reg add "HKCU\Software\Microsoft\GameBar" /v ShowStartupPanel /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\GameBar" /v AllowAutoGameMode /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\GameBar" /v AutoGameModeEnabled /t REG_DWORD /d 1 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f

echo Desativando Fullscreen Optimizations global
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehaviorMode /t REG_DWORD /d 2 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_HonorUserFSEBehaviorMode /t REG_DWORD /d 1 /f

echo Otimizando prioridade para jogos
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v GPU Priority /t REG_DWORD /d 8 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Priority /t REG_DWORD /d 6 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v Scheduling Category /t REG_SZ /d High /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v SFIO Priority /t REG_SZ /d High /f

echo.
echo Intel Boost aplicado.
pause
cls
goto :amdintelnvidia

:reverteramdintelnvidia
cls
echo Revertendo...
echo ===========================================
echo      RESTAURANDO CONFIGURACOES AO PADRAO
echo ===========================================
echo.

echo Restaurando MPO
reg delete "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v OverlayTestMode /f >nul 2>&1

echo Restaurando Game Mode
reg add "HKCU\Software\Microsoft\GameBar" /v AutoGameModeEnabled /t REG_DWORD /d 1 /f >nul
reg add "HKCU\Software\Microsoft\GameBar" /v AllowAutoGameMode /t REG_DWORD /d 1 /f >nul

echo Restaurando Game Bar
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /f >nul 2>&1
reg delete "HKCU\System\GameConfigStore" /v GameDVR_Enabled /f >nul 2>&1

echo Restaurando Fullscreen Optimizations
reg delete "HKCU\System\GameConfigStore" /v GameDVR_FSEBehaviorMode /f >nul 2>&1
reg delete "HKCU\System\GameConfigStore" /v GameDVR_HonorUserFSEBehaviorMode /f >nul 2>&1

echo Restaurando Multimedia Scheduler
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" ^
/v SystemResponsiveness /t REG_DWORD /d 20 /f >nul

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" ^
/v "GPU Priority" /t REG_DWORD /d 8 /f >nul

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" ^
/v Priority /t REG_DWORD /d 2 /f >nul

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" ^
/v "Scheduling Category" /t REG_SZ /d Medium /f >nul

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" ^
/v "SFIO Priority" /t REG_SZ /d Normal /f >nul

echo Reativando NVIDIA Telemetry (caso exista)
sc config NvTelemetryContainer start= demand >nul 2>&1

echo.
echo ===========================================
echo Configuracoes restauradas com sucesso!
echo Reinicie o computador.
echo ===========================================
pause
cls
goto :amdintelnvidia

:menuwindows

echo %ESC%[0m
cls
set "ESC="
cls
echo(
set "lines[0]=                 __      __.__            .___                   "
set "lines[1]=                /  \    /  \__| ____    __| _/______  _  ________"
set "lines[2]=                \   \/\/   /  |/    \  / __ |/  _ \ \/ \/ /  ___/"
set "lines[3]=                 \        /|  |   |  \/ /_/ (  <_> )     /\___ \ "
set "lines[4]=                  \__/\  / |__|___|  /\____ |\____/ \/\_//____  >"
set "lines[5]=                       \/          \/      \/                 \/ 



for /L %%j in (0,1,110) do (
set /a "corR=corBaseR + (variacaoR * %%j / 82)"
set /a "corG=corBaseG + (variacaoG * %%j / 82)"
set /a "corB=corBaseB + (variacaoB * %%j / 82)"
set "esc[%%j]=!ESC![38;2;!corR!;!corG!;!corB!m"
)

for /L %%i in (0,1,5) do (
set "texto=!lines[%%i]!"
set "textoGradiente="
for /L %%j in (0,1,82) do (
set "char=!texto:~%%j,1!"
if "!char!" == " " set "char= "
set "textoGradiente=!textoGradiente!!esc[%%j]!!char!"
)
echo( !textoGradiente!!ESC![0m
)

echo.

echo                       %op%Escolha%w% a %op%opção%w% que você quer %op%otimizar:%w%
echo.
echo.
echo     %m%[ %m%1 %m%]%w% Otimizar Energia                        %m%[ %m%2 %m%]%w% Desat. Efeitos Visuais
echo.  
echo     %m%[ %m%3 %m%]%w% Desat. apps segundo plano               %m%[ %m%4 %m%]%w% Desat. Serviços Inuteis
echo.
echo     %m%[ %m%5 %m%]%w% Otimizar GameBar                        %m%[ %m%6 %m%]%w% Desat. TOTALMENTE a XBOX
echo.  
echo     %m%[ %m%7 %m%]%w% Desat. Relatórios de Erro               %m%[ %m%8 %m%]%w% Desat. Telemetria
echo.
echo     %m%[ %m%9 %m%]%w% Desat. Hibernação                       %m%[ %m%10 %m%]%w% Desat. Compreesão de memória
echo.  
echo     %m%[ %m%11 %m%]%w% Desat. Indexação                       %m%[ %m%12 %m%]%w% Otimizar Menu Iniciar
echo.
echo     %m%[ %m%13 %m%]%w% Desativar Cortana                      %m%[ %m%14 %m%]%w% Desat. Prefetch e Superfetch
echo. 
echo     %m%[ %m%15 %m%]%w% Aumentar prioridade da CPU/GPU         %m%[ %m%16 %m%]%w% Aumentar prioridade foregrund
echo.  
echo     %m%[ %m%17 %m%]%w% Desat. Isolamento de Núcleo            %m%[ %m%18 %m%]%w% Debloater (Remover Apps Inuteis)
echo.
echo     %m%[ %m%19 %m%]%w% Ativar Modo de Jogo                    %m%[ %m%20 %m%]%w% Desat. Fullscreen Optimizations   
echo.
echo     %m%[ %m%21 %m%]%w% Desat. Mouse Acceleration              %m%[ %m%22 %m%]%w% Desat. VBS e HVCI (Virtualização)  
echo.
echo     %m%[ %m%23 %m%]%w% Desat. Compatibilidade forçada         %m%[ %m%24 %m%]%w% Fechar Explorer
echo.
echo     %m%[ %m%25 %m%]%w% Iniciar Explorer                       %m%[ %m%26 %m%]%w% Limpar Cache do Windows 
echo.
echo     %m%[ %m%27 %m%]%w% Verificar e arrumar arquivos           %m%[ %m%28 %m%]%w% Desativar Power Throttling           
echo.
echo     %m%[ %m%29 %m%]%w% Desativar EcoQoS (não use em notebook  %m%[ %m%30 %m%]%w% Desat. Suspensão seletiva de USB         
echo.
echo     %m%[ %m%31 %m%]%w% Desat. Economia do Adaptador de Rede   %m%[ %m%32 %m%]%w% Desat. Economia agressiva no PCIe           
echo.
echo     %op%[ %op%33 %op%]%w% Reiniciar PC                           %op%[ %op%34 %op%]%w% Menu Principal
echo.     
echo.
 
echo.
set /p opcao="Digite o número: "
cls


if "%opcao%"=="1" goto opcao1
if "%opcao%"=="2" goto opcao2
if "%opcao%"=="3" goto opcao3
if "%opcao%"=="4" goto opcao4
if "%opcao%"=="5" goto opcao5
if "%opcao%"=="6" goto opcao6
if "%opcao%"=="7" goto opcao7
if "%opcao%"=="8" goto opcao8
if "%opcao%"=="9" goto opcao9
if "%opcao%"=="10" goto opcao10
if "%opcao%"=="11" goto opcao11
if "%opcao%"=="12" goto opcao12
if "%opcao%"=="13" goto opcao13
if "%opcao%"=="14" goto opcao14
if "%opcao%"=="15" goto opcao15
if "%opcao%"=="16" goto opcao16
if "%opcao%"=="17" goto opcao17
if "%opcao%"=="18" goto opcao18

if "%opcao%"=="19" goto opcao19
if "%opcao%"=="20" goto opcao20
if "%opcao%"=="21" goto opcao21
if "%opcao%"=="22" goto opcao22
if "%opcao%"=="23" goto opcao23
if "%opcao%"=="24" goto opcao24

if "%opcao%"=="25" goto opcao25
if "%opcao%"=="26" goto opcao26
if "%opcao%"=="27" goto opcao27
if "%opcao%"=="28" goto opcao28
if "%opcao%"=="29" goto opcao29
if "%opcao%"=="30" goto opcao30
if "%opcao%"=="31" goto opcao31
if "%opcao%"=="32" goto opcao32
if "%opcao%"=="33" goto opcao33
if "%opcao%"=="34" goto menu

goto :menuwindows


:opcao1
cls
echo Otimizando Energia...
powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
powercfg.exe /setacvalueindex SCHEME_CURRENT SUB_PROCESSOR IdleDisable 0
powercfg.exe /setactive SCHEME_CURRENT
powercfg.cpl

pause
cls
goto :menuwindows

:opcao2
cls
echo Desativando Efeitos Visuais...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 9012038010000000 /f
reg add "HKCU\Control Panel\Desktop" /v VisualFXSetting /t REG_DWORD /d 2 /f

pause
cls
goto :menuwindows

:opcao3
cls
echo Desativando apps em segundo plano...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Start_TrackProgs /t REG_DWORD /d 0 /f

pause
cls
goto :menuwindows

:opcao4
cls
echo Desativando serviços inuteis...
sc stop WerSvc
sc config WerSvc start= disabled
sc stop DiagTrack
sc config DiagTrack start= disabled
sc stop dmwappushservice
sc config dmwappushservice start= disabled
sc stop WbioSrvc
sc config WbioSrvc start= disabled
sc stop Spooler
sc config Spooler start= disabled

pause
cls
goto :menuwindows

:opcao5
cls
echo Otimizando GameBar...
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehaviorMode /t REG_DWORD /d 2 /f
reg add "HKCU\Software\Microsoft\GameBar" /v ShowStartupPanel /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\GameBar" /v UseNexusForGameBarEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t REG_DWORD /d 0 /f

pause
cls
goto :menuwindows

:opcao6

cls
echo(
set "lines[0]=     █████  ██    ██ ██ ███████  ██████  
set "lines[1]=    ██   ██ ██    ██ ██ ██      ██    ██ 
set "lines[2]=    ███████ ██    ██ ██ ███████ ██    ██ 
set "lines[3]=    ██   ██  ██  ██  ██      ██ ██    ██ 
set "lines[4]=    ██   ██  ██  ██  ██      ██ ██    ██ 
set "lines[5]=    ██   ██   ████   ██ ███████  ██████  


for /L %%j in (0,1,110) do (
set /a "corR=corBaseR + (variacaoR * %%j / 82)"
set /a "corG=corBaseG + (variacaoG * %%j / 82)"
set /a "corB=corBaseB + (variacaoB * %%j / 82)"
set "esc[%%j]=!ESC![38;2;!corR!;!corG!;!corB!m"
)

for /L %%i in (0,1,5) do (
set "texto=!lines[%%i]!"
set "textoGradiente="
for /L %%j in (0,1,82) do (
set "char=!texto:~%%j,1!"
if "!char!" == " " set "char= "
set "textoGradiente=!textoGradiente!!esc[%%j]!!char!"
)
echo( !textoGradiente!!ESC![0m
)
                                     
echo.                           
echo  Deseja Realmente %r%desativar %w%TOTALMENTE A XBOX?...
echo.
echo   %m%[ 1 ]%w% Sim
echo   %m%[ 2 ]%w% Não, Voltar
echo   %m%[ 3 ]%w% REVERTER

echo.
set /p opcao="Digite o número: "
cls

if %opcao% equ 1 goto desativarxbox
if %opcao% equ 2 goto :menuwindows
if %opcao% equ 3 goto reverterxbox

:desativarxbox
start "" /wait /min powershell.exe -NoProfile -NonInteractive -Command "Get-AppxPackage *Xbox* | Remove-AppxPackage"
powershell -Command "Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -like '*Xbox*'} | Remove-AppxProvisionedPackage -Online"
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\GameBar" /v ShowStartupPanel /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\GameBar" /v UseNexusForGameBarEnabled /t REG_DWORD /d 0 /f
sc stop XblAuthManager >nul 2>&1
sc stop XblGameSave >nul 2>&1
sc stop XboxNetApiSvc >nul 2>&1
sc stop XboxGipSvc >nul 2>&1

sc config XblAuthManager start=disabled >nul 2>&1
sc config XblGameSave start=disabled >nul 2>&1
sc config XboxNetApiSvc start=disabled >nul 2>&1
sc config XboxGipSvc start=disabled >nul 2>&1
pause
cls
goto :opcao6

:reverterxbox
sc config XblAuthManager start=demand >nul 2>&1
sc config XblGameSave start=demand >nul 2>&1
sc config XboxNetApiSvc start=demand >nul 2>&1
sc config XboxGipSvc start=demand >nul 2>&1
start "" /wait /min powershell.exe -NoProfile -NonInteractive -Command "Get-AppxPackage -AllUsers Microsoft.XboxGamingOverlay | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register '$($_.InstallLocation)\AppXManifest.xml'}"
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 1 /f
pause
cls
goto :opcao6

:opcao7
cls
echo Desativando Relatórios de Erro do windows...
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v Disabled /t REG_DWORD /d 1 /f
sc stop WerSvc >nul 2>&1
sc config WerSvc start=disabled >nul 2>&1

pause
cls
goto :menuwindows

:opcao8
cls
echo Desativando telemetria (envio de dados para microsoft)...
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "AllowAppDataCollection" /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisableWindowsAdvertising" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableMicrosoftConsumerExperience" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DoNotConnectToWindowsUpdateInternetLocations" /t REG_DWORD /d 1 /f
Echo Telemetria e configurações de privacidade desativadas com sucesso!

pause
cls
goto :menuwindows

:opcao9
cls
echo Desativando Hibernação do windows...
powercfg -h off

pause
cls
goto :menuwindows

:opcao10
cls
echo(
set "lines[0]=     █████  ██    ██ ██ ███████  ██████  
set "lines[1]=    ██   ██ ██    ██ ██ ██      ██    ██ 
set "lines[2]=    ███████ ██    ██ ██ ███████ ██    ██ 
set "lines[3]=    ██   ██  ██  ██  ██      ██ ██    ██ 
set "lines[4]=    ██   ██  ██  ██  ██      ██ ██    ██ 
set "lines[5]=    ██   ██   ████   ██ ███████  ██████  


for /L %%j in (0,1,110) do (
set /a "corR=corBaseR + (variacaoR * %%j / 82)"
set /a "corG=corBaseG + (variacaoG * %%j / 82)"
set /a "corB=corBaseB + (variacaoB * %%j / 82)"
set "esc[%%j]=!ESC![38;2;!corR!;!corG!;!corB!m"
)

for /L %%i in (0,1,5) do (
set "texto=!lines[%%i]!"
set "textoGradiente="
for /L %%j in (0,1,82) do (
set "char=!texto:~%%j,1!"
if "!char!" == " " set "char= "
set "textoGradiente=!textoGradiente!!esc[%%j]!!char!"
)
echo( !textoGradiente!!ESC![0m
)
                                     
echo.
echo  %w%Antes de %op%desativar%w% saiba para que %op%serve!...%w%
echo  %r%Essa opção é indicada para hardwares com mais de 8gb de memória ram!%w%

echo   %m%[ 1 ]%w% Desativar
echo   %m%[ 2 ]%w% Ativar (Voltar ao padrão)
echo   %op%[ 3 ] Voltar%w%

echo.
set /p opcao="Digite o número: "
cls

if %opcao% equ 1 goto desativarmemoria
if %opcao% equ 2 goto ativarmemoria
if %opcao% equ 3 goto :menuwindows

:desativarmemoria
start "" /wait /min powershell.exe -NoProfile -NonInteractive -Command "Disable-MMAgent -MemoryCompression"

pause
cls
goto :opcao10

:ativarmemoria
start "" /wait /min powershell.exe -NoProfile -NonInteractive -Command "Enable-MMAgent -MemoryCompression"

pause
cls
goto :opcao10

:opcao11
cls
echo Desativando indexação de pesquisa (menu iniciar)...
net stop "Windows Search" >nul 2>&1
sc config "WSearch" start= disabled >nul 2>&1

pause
cls
goto :menuwindows

:opcao12
cls
echo Otimizando Menu Iniciar do Windows (desativando pesquisa online e bing)...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v BingSearchEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v CortanaConsent /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v DisableSearchBoxSuggestions /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Search" /v SearchboxTaskbarMode /t REG_DWORD /d 0 /f

pause
cls
goto :menuwindows

:opcao13
cls
echo Desativando Cortana...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f
start "" /wait /min powershell.exe -NoProfile -NonInteractive -Command "Get-AppxPackage *Microsoft.Windows.Cortana* | Remove-AppxPackage -ErrorAction SilentlyContinue"

pause
cls
goto :menuwindows

:opcao14
cls
echo(
set "lines[0]=     █████  ██    ██ ██ ███████  ██████  
set "lines[1]=    ██   ██ ██    ██ ██ ██      ██    ██ 
set "lines[2]=    ███████ ██    ██ ██ ███████ ██    ██ 
set "lines[3]=    ██   ██  ██  ██  ██      ██ ██    ██ 
set "lines[4]=    ██   ██  ██  ██  ██      ██ ██    ██ 
set "lines[5]=    ██   ██   ████   ██ ███████  ██████  


for /L %%j in (0,1,110) do (
set /a "corR=corBaseR + (variacaoR * %%j / 82)"
set /a "corG=corBaseG + (variacaoG * %%j / 82)"
set /a "corB=corBaseB + (variacaoB * %%j / 82)"
set "esc[%%j]=!ESC![38;2;!corR!;!corG!;!corB!m"
)

for /L %%i in (0,1,5) do (
set "texto=!lines[%%i]!"
set "textoGradiente="
for /L %%j in (0,1,82) do (
set "char=!texto:~%%j,1!"
if "!char!" == " " set "char= "
set "textoGradiente=!textoGradiente!!esc[%%j]!!char!"
)
echo( !textoGradiente!!ESC![0m
)
                                     
echo.
echo %w%Deseja Realmente %op%desativar prefetch e superfetch?%w%...
Echo %w%Essa opção é indicada para SSD! %op%Use em HDs só em caso de 100% de uso constante ou se o pc for muito fraco.

echo  %m%[ 1 ]%w% Desativar
echo  %m%[ 2 ]%w% Ativar (Voltar ao padrão)
echo  %op%[ 3 ] Voltar ao Menu%w%

echo.
set /p opcao="Digite o número: "
cls

if %opcao% equ 1 goto desativarsuper
if %opcao% equ 2 goto ativarsuper
if %opcao% equ 3 goto :menuwindows

:desativarsuper
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnablePrefetcher /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnableSuperfetch /t REG_DWORD /d 0 /f
sc stop "SysMain" >nul 2>&1
sc config "SysMain" start=disabled >nul 2>&1

pause
cls
goto :opcao14

:ativarsuper
sc config "SysMain" start=auto >nul 2>&1
sc start "SysMain" >nul 2>&1
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnablePrefetcher /t REG_DWORD /d 3 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnableSuperfetch /t REG_DWORD /d 3 /f

pause
cls
goto :opcao14

:opcao15
cls
echo Aumentando prioridade da CPU e GPU para jogos...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 6 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d High /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d High /f

pause
cls
goto :menuwindows

:opcao16
cls
echo(
set "lines[0]=     █████  ██    ██ ██ ███████  ██████  
set "lines[1]=    ██   ██ ██    ██ ██ ██      ██    ██ 
set "lines[2]=    ███████ ██    ██ ██ ███████ ██    ██ 
set "lines[3]=    ██   ██  ██  ██  ██      ██ ██    ██ 
set "lines[4]=    ██   ██  ██  ██  ██      ██ ██    ██ 
set "lines[5]=    ██   ██   ████   ██ ███████  ██████  


for /L %%j in (0,1,110) do (
set /a "corR=corBaseR + (variacaoR * %%j / 82)"
set /a "corG=corBaseG + (variacaoG * %%j / 82)"
set /a "corB=corBaseB + (variacaoB * %%j / 82)"
set "esc[%%j]=!ESC![38;2;!corR!;!corG!;!corB!m"
)

for /L %%i in (0,1,5) do (
set "texto=!lines[%%i]!"
set "textoGradiente="
for /L %%j in (0,1,82) do (
set "char=!texto:~%%j,1!"
if "!char!" == " " set "char= "
set "textoGradiente=!textoGradiente!!esc[%%j]!!char!"
)
echo( !textoGradiente!!ESC![0m
)
                                     
echo.
echo Essa opção %op%força o seu windows a priorizar a tarefa foreground%w% (priorizar tarefas primarias e não em segundo plano)...
echo Em pcs extremamente fraco essa opção pode ser ruim!
echo Portando, %op%teste reiniciar o pc e veja se melhora o uso do Windows!%w%

echo  %m%[ 1 ]%w% Otimizar foreground
echo  %m%[ 2 ]%w% Voltar ao padrão
echo  %op%[ 3 ]%w% Voltar ao Menu

echo.
set /p opcao="Digite o número: "
cls

if %opcao% equ 1 goto otimizarforeground
if %opcao% equ 2 goto voltarforeground
if %opcao% equ 3 goto :menuwindows

:otimizarforeground
echo Aumentando prioridade de tarefas em primeiro plano...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 38 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 6 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d High /f
pause
cls
goto :opcao16

:voltarforeground
echo Voltando o ciclo de tarefas primárias e secundárias ao padrão do Windows...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d 8 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d Medium /f
pause
cls
goto :opcao16

:opcao17
cls
echo Desativando isolamento de núcleo...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v EnableVirtualizationBasedSecurity /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" /v LsaCfgFlags /t REG_DWORD /d 0 /f
bcdedit /set hypervisorlaunchtype off
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v Enabled /t REG_DWORD /d 0 /f

pause
cls
goto :menuwindows

:opcao18
cls
echo(
set "lines[0]=     █████  ██    ██ ██ ███████  ██████  
set "lines[1]=    ██   ██ ██    ██ ██ ██      ██    ██ 
set "lines[2]=    ███████ ██    ██ ██ ███████ ██    ██ 
set "lines[3]=    ██   ██  ██  ██  ██      ██ ██    ██ 
set "lines[4]=    ██   ██  ██  ██  ██      ██ ██    ██ 
set "lines[5]=    ██   ██   ████   ██ ███████  ██████  


for /L %%j in (0,1,110) do (
set /a "corR=corBaseR + (variacaoR * %%j / 82)"
set /a "corG=corBaseG + (variacaoG * %%j / 82)"
set /a "corB=corBaseB + (variacaoB * %%j / 82)"
set "esc[%%j]=!ESC![38;2;!corR!;!corG!;!corB!m"
)

for /L %%i in (0,1,5) do (
set "texto=!lines[%%i]!"
set "textoGradiente="
for /L %%j in (0,1,82) do (
set "char=!texto:~%%j,1!"
if "!char!" == " " set "char= "
set "textoGradiente=!textoGradiente!!esc[%%j]!!char!"
)
echo( !textoGradiente!!ESC![0m
)
                                     
echo.
echo O %op%Debloater%w% irá remover vários programas inuteis do windows, %g%ajudando a reduzir processos!%w%
echo %op%Programas que serão apagados: %r%Cortana, OfficeHub, Photos, phone, people, music, messaging, maps, groove, geststarted, calendário, alarmes, 3DBuilder, Camera, Noticias, Clima, OneDrive, FeedbackHub e QuickAssist.%w%

echo  %m%[ 1 ]%w% Fazer o Debloater
echo  %m%[ 2 ]%w% Escolher quais remover
echo  %op%[ 3 ] Reverter Debloater%w%
echo  %op%[ 4 ] Voltar ao Menu%w%

echo.
set /p opcao="Digite o número: "
cls

if %opcao% equ 1 goto debloater
if %opcao% equ 2 goto escolherdebloater
if %opcao% equ 3 goto reverterdebloater
if %opcao% equ 4 goto :menuwindows

:debloater
echo Removendo todos programas inúteis do Windows...

start "" /wait /min powershell.exe -NoProfile -NonInteractive -Command "Get-AppxPackage *Microsoft.Windows.Cortana* | Remove-AppxPackage"
start "" /wait /min powershell.exe -NoProfile -NonInteractive -Command "Get-AppxPackage *officehub* | Remove-AppxPackage"
start "" /wait /min powershell.exe -NoProfile -NonInteractive -Command "Get-AppxPackage *phone* | Remove-AppxPackage"
start "" /wait /min powershell.exe -NoProfile -NonInteractive -Command "Get-AppxPackage *people* | Remove-AppxPackage"
start "" /wait /min powershell.exe -NoProfile -NonInteractive -Command "Get-AppxPackage *music* | Remove-AppxPackage"
start "" /wait /min powershell.exe -NoProfile -NonInteractive -Command "Get-AppxPackage *messaging* | Remove-AppxPackage"
start "" /wait /min powershell.exe -NoProfile -NonInteractive -Command "Get-AppxPackage *maps* | Remove-AppxPackage"
start "" /wait /min powershell.exe -NoProfile -NonInteractive -Command "Get-AppxPackage *groove* | Remove-AppxPackage"
start "" /wait /min powershell.exe -NoProfile -NonInteractive -Command "Get-AppxPackage *getstarted* | Remove-AppxPackage"
start "" /wait /min powershell.exe -NoProfile -NonInteractive -Command "Get-AppxPackage *calendar* | Remove-AppxPackage"
start "" /wait /min powershell.exe -NoProfile -NonInteractive -Command "Get-AppxPackage *alarms* | Remove-AppxPackage"
start "" /wait /min powershell.exe -NoProfile -NonInteractive -Command "Get-AppxPackage *3dbuilder* | Remove-AppxPackage"
start "" /wait /min powershell.exe -NoProfile -NonInteractive -Command "Get-AppxPackage *news* | Remove-AppxPackage"
start "" /wait /min powershell.exe -NoProfile -NonInteractive -Command "Get-AppxPackage *onedrive* | Remove-AppxPackage"
start "" /wait /min powershell.exe -NoProfile -NonInteractive -Command "Get-AppxPackage *FeedbackHub* | Remove-AppxPackage"
start "" /wait /min powershell.exe -NoProfile -NonInteractive -Command "Get-AppxPackage *windowscommunicationsapps* | Remove-AppxPackage"
start "" /wait /min powershell.exe -NoProfile -NonInteractive -Command "Get-AppxPackage *QuickAssist* | Remove-AppxPackage"
start "" /wait /min powershell.exe -NoProfile -NonInteractive -Command "Get-AppxPackage *solitaire* | Remove-AppxPackage"
start "" /wait /min powershell.exe -NoProfile -NonInteractive -Command "Get-AppxPackage *Weather* | Remove-AppxPackage"

pause
cls
goto :opcao18

:escolherdebloater
Abrindo arquivo de debloater
start "" "%~dp0debloater.bat"
pause
cls
goto :opcao18

:reverterdebloater
start "" /wait /min powershell.exe -NoProfile -NonInteractive -Command "Get-AppxProvisionedPackage -Online | ForEach-Object { Add-AppxPackage -DisableDevelopmentMode -Register \"$($_.InstallLocation)\AppxManifest.xml\" }; Get-AppxPackage -AllUsers | ForEach-Object { $m = \"$($_.InstallLocation)\AppxManifest.xml\"; if (Test-Path $m) { Add-AppxPackage -DisableDevelopmentMode -Register $m } }"

pause
cls
goto :opcao18

:opcao19
cls
echo Ativando Modo de Jogo...
reg add "HKCU\Software\Microsoft\GameBar" /v AutoGameModeEnabled /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\GameBar" /v AllowAutoGameMode /t REG_DWORD /d 1 /f
pause
cls
goto :menuwindows

:opcao20
cls
echo Desativando Fullscreen Optimizations...

reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehaviorMode /t REG_DWORD /d 2 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_HonorUserFSEBehaviorMode /t REG_DWORD /d 1 /f

pause
cls
goto :menuwindows

:opcao21
cls
echo Desativando Aceleracao do Mouse...

reg add "HKCU\Control Panel\Mouse" /v MouseSpeed /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold1 /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Mouse" /v MouseThreshold2 /t REG_SZ /d 0 /f

pause
cls
goto :menuwindows

:opcao22
cls
echo Desativando VBS e HVCI...
echo ATENCAO: isso reduz protecoes de seguranca do Windows.
echo Reinicie o PC depois dessa alteracao.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v EnableVirtualizationBasedSecurity /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v RequirePlatformSecurityFeatures /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v Enabled /t REG_DWORD /d 0 /f
bcdedit /set hypervisorlaunchtype off

pause
cls
goto :menuwindows

:opcao23
cls
echo Desativando Assistente de Compatibilidade de Programas...
sc stop PcaSvc
sc config PcaSvc start= disabled
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v DisablePCA /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v DisableEngine /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v DisableInventory /t REG_DWORD /d 1 /f

pause
cls
goto :menuwindows

:opcao24
cls
echo Fechando Explorer...
taskkill /f /im explorer.exe

pause
cls
goto :menuwindows

:opcao25
cls
echo Iniciando Explorer...
start explorer.exe

pause
cls
goto :menuwindows

:opcao26
cls
echo Limpando cache de atualizações e pastas temporárias do windows...
del /s /f /q "%windir%\Temp\*.*" 2>nul
for /d %%x in ("%windir%\Temp\*") do rd /s /q "%%x" 2>nul
del /s /f /q "%temp%\*.*" 2>nul
for /d %%x in ("%temp%\*") do rd /s /q "%%x" 2>nul
del /s /f /q "%APPDATA%\Microsoft\Windows\Recent\*.*" 2>nul
ipconfig /flushdns >nul
net stop wuauserv >nul 2>&1
del /s /f /q "%windir%\SoftwareDistribution\Download\*.*" 2>nul
net start wuauserv >nul 2>&1
start "" /wait /min powershell.exe -NoProfile -NonInteractive -Command Clear-RecycleBin -Force 2>nul
echo Bomba limpada com sucesso! :)

pause
cls
goto :menuwindows

:opcao27
cls
echo Verificando arquivos e integridade do Windows...
DISM /Online /Cleanup-Image /RestoreHealth
sfc /scannow

pause
cls
goto :menuwindows

:opcao28
cls
echo Desativando Power Throttling...
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v PowerThrottlingOff /t REG_DWORD /d 1 /f
echo.
echo Power Throttling desativado com sucesso!
echo Reinicie o computador para aplicar completamente.
pause
cls
goto :menuwindows

:opcao29
cls
echo Desativar EcoQoS..
echo Reduzindo recursos de economia de desempenho...

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v PowerThrottlingOff /t REG_DWORD /d 1 /f

echo.
echo Politicas de Power Throttling desativadas.
echo OBS: O Windows nao possui uma chave global oficial
echo para simplesmente desligar EcoQoS em todos os processos.

pause
cls
goto :menuwindows

:opcao30
cls
echo Desativando Suspensao Seletiva de USB...
powercfg /setacvalueindex SCHEME_CURRENT SUB_USB USBSELECTIVE 0
powercfg /setdcvalueindex SCHEME_CURRENT SUB_USB USBSELECTIVE 0
powercfg /setactive SCHEME_CURRENT
echo.
echo Suspensao Seletiva de USB desativada!
echo Dispositivos USB nao serao suspensos para economizar energia.

pause
cls
goto :menuwindows

:opcao31
cls
echo Desativar Economia do Adaptador de Rede..
echo Desativando Economia de Energia dos Adaptadores de Rede...

start "" /wait /min powershell.exe -NoProfile -NonInteractive -ExecutionPolicy Bypass -Command "Get-NetAdapter -Physical -ErrorAction SilentlyContinue | ForEach-Object { Disable-NetAdapterPowerManagement -Name $_.Name -ErrorAction SilentlyContinue }"

echo.
echo Economia de energia dos adaptadores de rede desativada!
echo Alguns drivers podem nao oferecer suporte a esta configuracao.

pause
cls
goto :menuwindows

:opcao32
cls
echo Desativando Economia de Energia do PCI Express...

powercfg /setacvalueindex SCHEME_CURRENT SUB_PCIEXPRESS ASPM 0
powercfg /setdcvalueindex SCHEME_CURRENT SUB_PCIEXPRESS ASPM 0
powercfg /setactive SCHEME_CURRENT

echo.
echo PCI Express Link State Power Management desativado!
echo O PCIe agora priorizara desempenho em vez de economia de energia.

pause
cls
goto :menuwindows

:opcao33
cls
echo Reiniciando pc...
timeout /t 1 >nul
echo 3
timeout /t 1 >nul
echo 2
timeout /t 1 >nul
echo 1
timeout /t 1 >nul

shutdown /r /t 0

pause
cls
goto :menuwindows



:prioridadegames
cls
set "ESC="
cls
echo(
set "lines[0]=                     ________                              "
set "lines[1]=                    /  _____/_____    _____   ____   ______"
set "lines[2]=                   /   \  ___\__  \  /     \_/ __ \ /  ___/"
set "lines[3]=                   \    \_\  \/ __ \|  Y Y  \  ___/ \___ \ "
set "lines[4]=                    \______  (____  /__|_|  /\___  >____  >"
set "lines[5]=                           \/     \/      \/     \/     \/ 

for /L %%j in (0,1,110) do (
set /a "corR=corBaseR + (variacaoR * %%j / 82)"
set /a "corG=corBaseG + (variacaoG * %%j / 82)"
set /a "corB=corBaseB + (variacaoB * %%j / 82)"
set "esc[%%j]=!ESC![38;2;!corR!;!corG!;!corB!m"
)

for /L %%i in (0,1,5) do (
set "texto=!lines[%%i]!"
set "textoGradiente="
for /L %%j in (0,1,82) do (
set "char=!texto:~%%j,1!"
if "!char!" == " " set "char= "
set "textoGradiente=!textoGradiente!!esc[%%j]!!char!"
)
echo( !textoGradiente!!ESC![0m
)

echo.

echo                      Escolha o %op%jogo%w% que voce quer %op%priorizar%w%:
echo.
echo       %m%[ %m%1 %m%]%w% 7 Days to Die                                 %m%[ %m%2 %m%]%w% American Truck Simulator
echo.
echo       %m%[ %m%3 %m%]%w% Apex Legends                                  %m%[ %m%4 %m%]%w% ARC Raiders
echo.
echo       %m%[ %m%5 %m%]%w% Arena Breakout                                %m%[ %m%6 %m%]%w% ARK Survival Ascended
echo.
echo       %m%[ %m%7 %m%]%w% ARK Survival Evolved                          %m%[ %m%8 %m%]%w% Assetto Corsa
echo.
echo       %m%[ %m%9 %m%]%w% Assetto Corsa Competizione                    %m%[ %m%10 %m%]%w% Baldur's Gate 3
echo.
echo       %m%[ %m%11 %m%]%w% Battlefield 2042                             %m%[ %m%12 %m%]%w% Battlefield 4
echo.
echo       %m%[ %m%13 %m%]%w% Battlefield 6                                %m%[ %m%14 %m%]%w% BeamNG.drive
echo.
echo       %m%[ %m%15 %m%]%w% Black Myth Wukong                            %m%[ %m%16 %m%]%w% Blood Strike
echo.
echo       %m%[ %m%17 %m%]%w% Borderlands 4                                %m%[ %m%18 %m%]%w% Brawlhalla
echo.
echo       %m%[ %m%19 %m%]%w% Call of Duty Black Ops 6                     %m%[ %m%20 %m%]%w% Call of Duty Black Ops 7
echo.
echo       %m%[ %m%21 %m%]%w% Chivalry 2                                   %m%[ %m%22 %m%]%w% Choo Choo Charles
echo.
echo       %m%[ %m%23 %m%]%w% Clair Obscur Expedition 33                   %m%[ %m%24 %m%]%w% Crossfire
echo.
echo       %m%[ %m%25 %m%]%w% CS2                                          %m%[ %m%26 %m%]%w% Cult of the Lamb
echo.
echo       %m%[ %m%27 %m%]%w% Cuphead                                      %m%[ %m%28 %m%]%w% Cyberpunk 2077
echo.
echo       %m%[ %m%29 %m%]%w% Dark Souls 3                                 %m%[ %m%30 %m%]%w% Days Gone
echo.
echo       %m%[ %m%31 %m%]%w% DayZ                                         %m%[ %m%32 %m%]%w% Dead By Daylight
echo.
echo       %m%[ %m%33 %m%]%w% Deadlock                                     %m%[ %m%34 %m%]%w% Death stranding 1 e 2
echo.
echo       %m%[ %m%35 %m%]%w% Delta Force                                  %m%[ %m%36 %m%]%w% Diablo IV
echo.
echo       %m%[ %m%37 %m%]%w% DOOM Eternal                                 %m%[ %m%38 %m%]%w% DOOM The Dark Ages
echo.
echo       %m%[ %m%39 %m%]%w% Dota 2                                       %m%[ %m%40 %m%]%w% Dying Light 1 e 2
echo.
echo       %m%[ %m%41 %m%]%w% Dying Light The Beast                        %m%[ %m%42 %m%]%w% EA 26 (fifa)
echo.
echo       %m%[ %m%43 %m%]%w% eFootball                                    %m%[ %m%44 %m%]%w% Elden Ring
echo.
echo       %m%[ %m%45 %m%]%w% Escape from tarkov                           %m%[ %m%46 %m%]%w% Euro Truck Simulator (1 e 2)
echo.
echo       %m%[ %m%47 %m%]%w% F1 25                                        %m%[ %m%48 %m%]%w% Farming Simulator 22
echo.
echo       %m%[ %m%49 %m%]%w% Farming Simulator 25                         %m%[ %m%50 %m%]%w% Final Fantasy XIV
echo.
echo       %m%[ %m%51 %m%]%w% FiveM                                        %m%[ %m%52 %m%]%w% Fortnite
echo.
echo       %m%[ %m%53 %m%]%w% Forza Horizon 4                              %m%[ %m%54 %m%]%w% Forza Horizon 5
echo.
echo       %m%[ %m%55 %m%]%w% Free Fire + Bluestacks                       %m%[ %m%56 %m%]%w% Genshin Impact
echo.
echo       %m%[ %m%57 %m%]%w% Ghost Of Tsushima                            %m%[ %m%58 %m%]%w% God Of War (2018 e ragnarok)
echo.
echo       %m%[ %m%59 %m%]%w% Gta V                                        %m%[ %m%60 %m%]%w% Hell Let Loose
echo.
echo       %m%[ %m%61 %m%]%w% Helldivers 2                                 %m%[ %m%62 %m%]%w% Hogwarts Legacy
echo.
echo       %m%[ %m%63 %m%]%w% Hollow Knight                                %m%[ %m%64 %m%]%w% Hytale
echo.
echo       %m%[ %m%65 %m%]%w% Indiana Jones and the Great Circle           %m%[ %m%66 %m%]%w% League of Legends
echo.
echo       %m%[ %m%67 %m%]%w% Left 4 dead 1 e 2                            %m%[ %m%68 %m%]%w% Lethal Company
echo.
echo       %m%[ %m%69 %m%]%w% Lies of P                                    %m%[ %m%70 %m%]%w% Marvel Rivals
echo.
echo       %m%[ %m%71 %m%]%w% Marvel Rivals                                %m%[ %m%72 %m%]%w% Meccha Chameleon
echo.
echo       %m%[ %m%73 %m%]%w% Metro Exodus                                 %m%[ %m%74 %m%]%w% Minecraft
echo.
echo       %m%[ %m%75 %m%]%w% Monster Hunter Wilds                         %m%[ %m%76 %m%]%w% Monster Hunter World
echo.
echo       %m%[ %m%77 %m%]%w% MTA                                          %m%[ %m%78 %m%]%w% My Summer Car
echo.
echo       %m%[ %m%79 %m%]%w% No Man's Sky                                 %m%[ %m%80 %m%]%w% Overwatch 2
echo.
echo       %m%[ %m%81 %m%]%w% Palworld                                     %m%[ %m%82 %m%]%w% Path of Exile 2
echo.
echo       %m%[ %m%83 %m%]%w% PES (todos)                                  %m%[ %m%84 %m%]%w% Phasmophobia
echo.
echo       %m%[ %m%85 %m%]%w% Point Blank                                  %m%[ %m%86 %m%]%w% Poppy Playtime (*todos)
echo.
echo       %m%[ %m%87 %m%]%w% Project Zomboid                              %m%[ %m%88 %m%]%w% PUBG
echo.
echo       %m%[ %m%89 %m%]%w% Ready or Not                                 %m%[ %m%90 %m%]%w% Red Dead Redemption 2
echo.
echo       %m%[ %m%91 %m%]%w% Rematch                                      %m%[ %m%92 %m%]%w% Resident Evil 2 Remake
echo.
echo       %m%[ %m%93 %m%]%w% Resident Evil 4 Remake                       %m%[ %m%94 %m%]%w% Resident evil Requiem
echo.
echo       %m%[ %m%95 %m%]%w% Resident Evil Village                        %m%[ %m%96 %m%]%w% Roblox
echo.
echo       %m%[ %m%97 %m%]%w% Rocket League                                %m%[ %m%98 %m%]%w% Rust
echo.
echo       %m%[ %m%99 %m%]%w% S.T.A.L.K.E.R. 2                             %m%[ %m%100 %m%]%w% Sekiro Shadows Die Twice
echo.
echo       %m%[ %m%101 %m%]%w% Silent Hill 2 Remake                        %m%[ %m%102 %m%]%w% SKYRIM
echo.
echo       %m%[ %m%103 %m%]%w% SnowRunner                                  %m%[ %m%104 %m%]%w% Sons of the Forest
echo.
echo       %m%[ %m%105 %m%]%w% Street Fighter 6                            %m%[ %m%106 %m%]%w% Subnautica + Below zero
echo.
echo       %m%[ %m%107 %m%]%w% Team Fortress 2                             %m%[ %m%108 %m%]%w% Terraria
echo.
echo       %m%[ %m%109 %m%]%w% THE FINALS                                  %m%[ %m%110 %m%]%w% The Forest
echo.
echo       %m%[ %m%111 %m%]%w% The Isle                                    %m%[ %m%112 %m%]%w% The last Of US 1 e 2
echo.
echo       %m%[ %m%113 %m%]%w% Tom Clancy's Rainbow Six Siege              %m%[ %m%114 %m%]%w% ULTRAKILL
echo.
echo       %m%[ %m%115 %m%]%w% Valorant                                    %m%[ %m%116 %m%]%w% Warface
echo.
echo       %m%[ %m%117 %m%]%w% Warframe                                    %m%[ %m%118 %m%]%w% Warzone
echo.
echo       %m%[ %m%119 %m%]%w% Wuthering Waves                             %m%[ %m%120 %m%]%w% Zenless Zone Zero
echo.
echo                                  %op%[ %op%121 %op%]%op% Fechar%w%

set /p jogo="Digite o numero: "
cls
if "%jogo%"=="1" goto priorizar_7daystodie
if "%jogo%"=="2" goto priorizar_americantrucksimulator
if "%jogo%"=="3" goto priorizar_apex
if "%jogo%"=="4" goto priorizar_arcraiders
if "%jogo%"=="5" goto priorizar_arenabreakout
if "%jogo%"=="6" goto priorizar_arksurvivalascended
if "%jogo%"=="7" goto priorizar_arksurvivalevolved
if "%jogo%"=="8" goto priorizar_assettocorsa
if "%jogo%"=="9" goto priorizar_assetocorsacompetizione
if "%jogo%"=="10" goto priorizar_arenabreakout
if "%jogo%"=="11" goto priorizar_battlefield2042
if "%jogo%"=="12" goto priorizar_battlefield4
if "%jogo%"=="13" goto priorizar_battlefield6
if "%jogo%"=="14" goto priorizar_beamngdrive
if "%jogo%"=="15" goto priorizar_blackmythwukong
if "%jogo%"=="16" goto priorizar_bloodstrike
if "%jogo%"=="17" goto priorizar_borderlands4
if "%jogo%"=="18" goto priorizar_brawlhalla
if "%jogo%"=="19" goto priorizar_callofdutyblackops6
if "%jogo%"=="20" goto priorizar_callofdutyblackops7
if "%jogo%"=="21" goto priorizar_chivalry2
if "%jogo%"=="22" goto priorizar_choochoo
if "%jogo%"=="23" goto priorizar_clairobscurexpedition33
if "%jogo%"=="24" goto priorizar_crossfire
if "%jogo%"=="25" goto priorizar_cs2
if "%jogo%"=="26" goto priorizar_cult
if "%jogo%"=="27" goto priorizar_cuphead
if "%jogo%"=="28" goto priorizar_cyberpunk
if "%jogo%"=="29" goto priorizar_darksouls3
if "%jogo%"=="30" goto priorizar_daysgone
if "%jogo%"=="31" goto priorizar_dayz
if "%jogo%"=="32" goto priorizar_dbd
if "%jogo%"=="33" goto priorizar_deadlock
if "%jogo%"=="34" goto priorizar_deathstranding
if "%jogo%"=="35" goto priorizar_deltaforce
if "%jogo%"=="36" goto priorizar_diabloiv
if "%jogo%"=="37" goto priorizar_doometernal
if "%jogo%"=="38" goto priorizar_doomthedarkages
if "%jogo%"=="39" goto priorizar_dota2
if "%jogo%"=="40" goto priorizar_dyinglight
if "%jogo%"=="41" goto priorizar_dyinglitghthebeast
if "%jogo%"=="42" goto priorizar_fc26
if "%jogo%"=="43" goto priorizar_efootball
if "%jogo%"=="44" goto priorizar_eldenring
if "%jogo%"=="45" goto priorizar_escapefromtarkov
if "%jogo%"=="46" goto priorizar_ets
if "%jogo%"=="47" goto priorizar_f125
if "%jogo%"=="48" goto priorizar_fs22
if "%jogo%"=="49" goto priorizar_fs25
if "%jogo%"=="50" goto priorizar_ffxiv
if "%jogo%"=="51" goto priorizar_fivem
if "%jogo%"=="52" goto priorizar_fortnite
if "%jogo%"=="53" goto priorizar_forzahorizon4
if "%jogo%"=="54" goto priorizar_forzahorizon5
if "%jogo%"=="55" goto priorizar_freefire
if "%jogo%"=="56" goto priorizar_genshin
if "%jogo%"=="57" goto priorizar_got
if "%jogo%"=="58" goto priorizar_gow
if "%jogo%"=="59" goto priorizar_gtav
if "%jogo%"=="60" goto priorizar_hll
if "%jogo%"=="61" goto priorizar_helldivers2
if "%jogo%"=="62" goto priorizar_hogwartslegacy
if "%jogo%"=="63" goto priorizar_hollowknight
if "%jogo%"=="64" goto priorizar_hytale
if "%jogo%"=="65" goto priorizar_ijatgc
if "%jogo%"=="66" goto priorizar_lol
if "%jogo%"=="67" goto priorizar_left4dead
if "%jogo%"=="68" goto priorizar_lethalcompany
if "%jogo%"=="69" goto priorizar_liesofp
if "%jogo%"=="70" goto priorizar_marvelrivals
if "%jogo%"=="71" goto priorizar_marvel
if "%jogo%"=="72" goto priorizar_meccha
if "%jogo%"=="73" goto priorizar_metroexodus
if "%jogo%"=="74" goto priorizar_minecraft
if "%jogo%"=="75" goto priorizar_monsterhunterwilds
if "%jogo%"=="76" goto priorizar_monsterhunterworld
if "%jogo%"=="77" goto priorizar_mta
if "%jogo%"=="78" goto priorizar_mysummercar
if "%jogo%"=="79" goto priorizar_nomanssky
if "%jogo%"=="80" goto priorizar_overwatch2
if "%jogo%"=="81" goto priorizar_palworld
if "%jogo%"=="82" goto priorizar_pathofexile2
if "%jogo%"=="83" goto priorizar_pes
if "%jogo%"=="84" goto priorizar_phasmophobia
if "%jogo%"=="85" goto priorizar_pointblank
if "%jogo%"=="86" goto priorizar_poppyplaytime
if "%jogo%"=="87" goto priorizar_projectzomboid
if "%jogo%"=="88" goto priorizar_pubg
if "%jogo%"=="89" goto priorizar_readyornot
if "%jogo%"=="90" goto priorizar_rdr2
if "%jogo%"=="91" goto priorizar_rematch
if "%jogo%"=="92" goto priorizar_residentevil2remake
if "%jogo%"=="93" goto priorizar_residentevil4remake
if "%jogo%"=="94" goto priorizar_re9
if "%jogo%"=="95" goto priorizar_residentevilvillage
if "%jogo%"=="96" goto priorizar_roblox
if "%jogo%"=="97" goto priorizar_rocketleague
if "%jogo%"=="98" goto priorizar_rust
if "%jogo%"=="99" goto priorizar_stalker2
if "%jogo%"=="100" goto priorizar_sekiroshadowsdietwice
if "%jogo%"=="101" goto priorizar_silenthill2remake
if "%jogo%"=="102" goto priorizar_skyrim
if "%jogo%"=="103" goto priorizar_snowrunner
if "%jogo%"=="104" goto priorizar_sonsoftheforest
if "%jogo%"=="105" goto priorizar_sf6
if "%jogo%"=="106" goto priorizar_subnautica
if "%jogo%"=="107" goto priorizar_teamfortress2
if "%jogo%"=="108" goto priorizar_terraria
if "%jogo%"=="109" goto priorizar_thefinals
if "%jogo%"=="110" goto priorizar_theforest
if "%jogo%"=="111" goto priorizar_theisle
if "%jogo%"=="112" goto priorizar_tlol
if "%jogo%"=="113" goto priorizar_r6
if "%jogo%"=="114" goto priorizar_ultrakill
if "%jogo%"=="115" goto priorizar_valorant
if "%jogo%"=="116" goto priorizar_warface
if "%jogo%"=="117" goto priorizar_warframe
if "%jogo%"=="118" goto priorizar_warzone
if "%jogo%"=="119" goto priorizar_wutheringwaves
if "%jogo%"=="120" goto priorizar_zenlesszonezero
if "%jogo%"=="121" goto menu
cls
goto :prioridadegames

:priorizar_7daystodie
echo Aumentando prioridade do 7 Days to Die...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\7DaysToDie.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_americantrucksimulator
echo Aumentando prioridade do American Truck Simulator...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\amtrucks.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_apex
echo Aumentando prioridade do Apex Legends...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\r5apex.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_arcraiders
echo Aumentando prioridade do ARC Raiders...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\PioneerGame.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_arenabreakout
echo Aumentando prioridade do Arena Breakout Infinite...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\UAGame.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_arksurvivalascended
echo Aumentando prioridade do ARK Survival Ascended...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ArkAscended.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_arksurvivalevolved
echo Aumentando prioridade do ARK Survival Evolved...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ShooterGame.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_assettocorsa
echo Aumentando prioridade do Assetto Corsa...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\acs.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_assetocorsacompetizione
echo Aumentando prioridade do Assetto Corsa Competizione...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\AC2-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_baldursgate3
echo Aumentando prioridade do Baldur's Gate 3...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\bg3.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\bg3_dx11.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_battlefield2042
echo Aumentando prioridade do Battlefield 2042...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BF2042.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_battlefield4
echo Aumentando prioridade do Battlefield 4...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\bf4.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_battlefield6
echo Aumentando prioridade do Battlefield 6...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\bf6.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_beamngdrive
echo Aumentando prioridade do BeamNG.drive...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BeamNG.drive.x64.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_blackmythwukong
echo Aumentando prioridade do Black Myth Wukong...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\b1-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_bloodstrike
echo Aumentando prioridade do Blood Strike...
REM VERIFICAR EXECUTAVEL: BloodStrike.exe
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\BloodStrike.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_borderlands4
echo Aumentando prioridade do Borderlands 4...
REM VERIFICAR EXECUTAVEL: OakGame-Win64-Shipping.exe
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\OakGame-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_brawlhalla
echo Aumentando prioridade do Brawlhalla...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Brawlhalla.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_callofdutyblackops6
echo Aumentando prioridade do Call of Duty Black Ops 6...
REM VERIFICAR EXECUTAVEL: cod.exe
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cod.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_callofdutyblackops7
echo Aumentando prioridade do Call of Duty Black Ops 7...
REM VERIFICAR EXECUTAVEL: cod.exe
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cod.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_chivalry2
echo Aumentando prioridade do Chivalry 2...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Chivalry2-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_choochoo
echo Aumentando prioridade do Choo Choo Charles...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Obscure-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_clairobscurexpedition33
echo Aumentando prioridade do Clair Obscur Expedition 33...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SandFall-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_crossfire
echo Aumentando prioridade do Crossfire...
REM VERIFICAR EXECUTAVEL: crossfire.exe
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\crossfire.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_cs2
echo Aumentando prioridade do Counter-Strike 2...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cs2.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_cult
echo Aumentando prioridade do Cult of the Lamb...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Cult Of The Lamb.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_cuphead
echo Aumentando prioridade do Cuphead...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Cuphead.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_cyberpunk
echo Aumentando prioridade do Cyberpunk 2077...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Cyberpunk2077.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_darksouls3
echo Aumentando prioridade do Dark Souls 3...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DarkSoulsIII.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_daysgone
echo Aumentando prioridade do Days Gone...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DaysGone.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_dayz
echo Aumentando prioridade do DayZ...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DayZ_x64.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_dbd
echo Aumentando prioridade do Dead By Daylight...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DeadByDaylight-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_deadlock
echo Aumentando prioridade do Deadlock...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\deadlock.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_deathstranding
echo Aumentando prioridade do Death Stranding 1 e 2...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ds.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DeathStranding.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
REM VERIFICAR EXECUTAVEL DO DEATH STRANDING 2
pause
goto :prioridadegames


:priorizar_deltaforce
echo Aumentando prioridade do Delta Force...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DeltaForceClient-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_diabloiv
echo Aumentando prioridade do Diablo IV...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Diablo IV.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_doometernal
echo Aumentando prioridade do DOOM Eternal...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DOOMEternalx64vk.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_doomthedarkages
echo Aumentando prioridade do DOOM The Dark Ages...
REM VERIFICAR EXECUTAVEL: DOOMTheDarkAges.exe
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DOOMTheDarkAges.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_dota2
echo Aumentando prioridade do Dota 2...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\dota2.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_dyinglight
echo Aumentando prioridade do Dying Light 1 e 2...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DyingLightGame.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DyingLightGame_x64_rwdi.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_chivalry2
echo Aumentando prioridade do Chivalry 2...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Chivalry2-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_choochoo
echo Aumentando prioridade do Choo Choo Charles...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Obscure-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_clairobscurexpedition33
echo Aumentando prioridade do Clair Obscur Expedition 33...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SandFall-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_crossfire
echo Aumentando prioridade do Crossfire...
REM VERIFICAR EXECUTAVEL
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\crossfire.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_cs2
echo Aumentando prioridade do Counter-Strike 2...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cs2.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_cult
echo Aumentando prioridade do Cult of the Lamb...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Cult Of The Lamb.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_cuphead
echo Aumentando prioridade do Cuphead...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Cuphead.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_cyberpunk
echo Aumentando prioridade do Cyberpunk 2077...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Cyberpunk2077.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_darksouls3
echo Aumentando prioridade do Dark Souls 3...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DarkSoulsIII.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_daysgone
echo Aumentando prioridade do Days Gone...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DaysGone.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_dayz
echo Aumentando prioridade do DayZ...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DayZ_x64.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_dbd
echo Aumentando prioridade do Dead By Daylight...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DeadByDaylight-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_deadlock
echo Aumentando prioridade do Deadlock...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\deadlock.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_deathstranding
echo Aumentando prioridade do Death Stranding 1 e 2...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ds.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DeathStranding.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
REM VERIFICAR EXECUTAVEL DO DEATH STRANDING 2
pause
goto :prioridadegames


:priorizar_deltaforce
echo Aumentando prioridade do Delta Force...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DeltaForceClient-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_diabloiv
echo Aumentando prioridade do Diablo IV...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Diablo IV.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_doometernal
echo Aumentando prioridade do DOOM Eternal...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DOOMEternalx64vk.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_doomthedarkages
echo Aumentando prioridade do DOOM The Dark Ages...
REM VERIFICAR EXECUTAVEL
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DOOMTheDarkAges.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_dota2
echo Aumentando prioridade do Dota 2...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\dota2.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_dyinglight
echo Aumentando prioridade do Dying Light 1 e 2...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DyingLightGame.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DyingLightGame_x64_rwdi.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_dyinglitghthebeast
echo Aumentando prioridade do Dying Light The Beast...
REM VERIFICAR EXECUTAVEL
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DyingLightGame_TheBeast_x64_rwdi.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_fc26
echo Aumentando prioridade do EA Sports FC 26...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FC26.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_efootball
echo Aumentando prioridade do eFootball...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\eFootball.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_eldenring
echo Aumentando prioridade do Elden Ring...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\eldenring.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_escapefromtarkov
echo Aumentando prioridade do Escape from Tarkov...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\EscapeFromTarkov.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_ets
echo Aumentando prioridade do Euro Truck Simulator 1 e 2...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\eurotrucks.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\eurotrucks2.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_f125
echo Aumentando prioridade do F1 25...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\F1_25.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_fs22
echo Aumentando prioridade do Farming Simulator 22...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FarmingSimulator2022Game.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_fs25
echo Aumentando prioridade do Farming Simulator 25...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FarmingSimulator2025Game.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_ffxiv
echo Aumentando prioridade do Final Fantasy XIV...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ffxiv_dx11.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ffxiv.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_fivem
echo Aumentando prioridade do FiveM...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FiveM_b3095_GTAProcess.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FiveM_b3258_GTAProcess.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
REM Outras builds do FiveM podem usar nomes diferentes
pause
goto :prioridadegames


:priorizar_fortnite
echo Aumentando prioridade do Fortnite...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FortniteClient-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_forzahorizon4
echo Aumentando prioridade do Forza Horizon 4...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ForzaHorizon4.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_forzahorizon5
echo Aumentando prioridade do Forza Horizon 5...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ForzaHorizon5.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_freefire
echo Aumentando prioridade do Free Fire no BlueStacks...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HD-Player.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_genshin
echo Aumentando prioridade do Genshin Impact...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GenshinImpact.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\YuanShen.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_got
echo Aumentando prioridade do Ghost of Tsushima...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GhostOfTsushima.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_gow
echo Aumentando prioridade do God of War 2018 e Ragnarok...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GoW.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GoWR.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_gtav
echo Aumentando prioridade do GTA V...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GTA5.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\GTA5_Enhanced.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_hll
echo Aumentando prioridade do Hell Let Loose...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HLL-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_helldivers2
echo Aumentando prioridade do Helldivers 2...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\helldivers2.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_hogwartslegacy
echo Aumentando prioridade do Hogwarts Legacy...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\HogwartsLegacy.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_hollowknight
echo Aumentando prioridade do Hollow Knight...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\hollow_knight.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_hytale
echo Aumentando prioridade do Hytale...
REM VERIFICAR EXECUTAVEL
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Hytale.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_ijatgc
echo Aumentando prioridade do Indiana Jones and the Great Circle...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\TheGreatCircle.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_lol
echo Aumentando prioridade do League of Legends...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\League of Legends.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_left4dead
echo Aumentando prioridade do Left 4 Dead 1 e 2...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\left4dead.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\left4dead2.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_lethalcompany
echo Aumentando prioridade do Lethal Company...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Lethal Company.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_liesofp
echo Aumentando prioridade do Lies of P...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\LOP-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_marvelrivals
echo Aumentando prioridade do Marvel Rivals...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Marvel-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_marvel
echo Aumentando prioridade do Marvel Rivals...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Marvel-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_meccha
echo Aumentando prioridade do Meccha Chameleon...
REM VERIFICAR EXECUTAVEL
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\MecchaChameleon.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_metroexodus
echo Aumentando prioridade do Metro Exodus...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\MetroExodus.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_minecraft
echo Aumentando prioridade do Minecraft...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\javaw.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Minecraft.Windows.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_monsterhunterwilds
echo Aumentando prioridade do Monster Hunter Wilds...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\MonsterHunterWilds.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_monsterhunterworld
echo Aumentando prioridade do Monster Hunter World...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\MonsterHunterWorld.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_mta
echo Aumentando prioridade do MTA...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Multi Theft Auto.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\gta_sa.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_mysummercar
echo Aumentando prioridade do My Summer Car...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\mysummercar.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_nomanssky
echo Aumentando prioridade do No Man's Sky...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\NMS.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_overwatch2
echo Aumentando prioridade do Overwatch 2...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Overwatch.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames


:priorizar_palworld
echo Aumentando prioridade do Palworld...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Palworld-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

priorizar_pathofexile2
echo Aumentando prioridade do Path of Exile 2...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\PathOfExileSteam.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\PathOfExile_x64.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
REM VERIFICAR EXECUTAVEIS DA VERSAO INSTALADA
pause
goto :prioridadegames

:priorizar_pes
echo Aumentando prioridade do PES...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\PES2017.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\PES2018.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\PES2019.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\PES2020.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\PES2021.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
REM OUTRAS VERSOES DO PES NAO ESTAO INCLUIDAS
pause
goto :prioridadegames

:priorizar_phasmophobia
echo Aumentando prioridade do Phasmophobia...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Phasmophobia.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_pointblank
echo Aumentando prioridade do Point Blank...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\PointBlank.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\PB.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
REM VERIFICAR EXECUTAVEL DA VERSAO BRASILEIRA
pause
goto :prioridadegames

:priorizar_poppyplaytime
echo Aumentando prioridade do Poppy Playtime...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Poppy_Playtime-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Playtime_Prototype4-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
REM VERIFICAR EXECUTAVEIS DOS DEMAIS CAPITULOS
pause
goto :prioridadegames

:priorizar_projectzomboid
echo Aumentando prioridade do Project Zomboid...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ProjectZomboid64.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ProjectZomboid32.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_pubg
echo Aumentando prioridade do PUBG...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\TslGame.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_readyornot
echo Aumentando prioridade do Ready or Not...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ReadyOrNot-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_rdr2
echo Aumentando prioridade do Red Dead Redemption 2...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RDR2.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_rematch
echo Aumentando prioridade do Rematch...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Rematch-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
REM VERIFICAR EXECUTAVEL
pause
goto :prioridadegames

:priorizar_residentevil2remake
echo Aumentando prioridade do Resident Evil 2 Remake...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re2.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_residentevil4remake
echo Aumentando prioridade do Resident Evil 4 Remake...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re4.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_re9
echo Aumentando prioridade do Resident Evil Requiem...
REM VERIFICAR EXECUTAVEL: re9.exe
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re9.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_residentevilvillage
echo Aumentando prioridade do Resident Evil Village...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\re8.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_roblox
echo Aumentando prioridade do Roblox...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RobloxPlayerBeta.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_rocketleague
echo Aumentando prioridade do Rocket League...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RocketLeague.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_rust
echo Aumentando prioridade do Rust...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RustClient.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_stalker2
echo Aumentando prioridade do S.T.A.L.K.E.R. 2...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Stalker2-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_sekiroshadowsdietwice
echo Aumentando prioridade do Sekiro Shadows Die Twice...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\sekiro.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_silenthill2remake
echo Aumentando prioridade do Silent Hill 2 Remake...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SHProto-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_skyrim
echo Aumentando prioridade do Skyrim...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\TESV.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SkyrimSE.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_snowrunner
echo Aumentando prioridade do SnowRunner...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SnowRunner.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_sonsoftheforest
echo Aumentando prioridade do Sons of the Forest...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SonsOfTheForest.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_sf6
echo Aumentando prioridade do Street Fighter 6...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\StreetFighter6.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_subnautica
echo Aumentando prioridade do Subnautica e Below Zero...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Subnautica.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SubnauticaZero.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_teamfortress2
echo Aumentando prioridade do Team Fortress 2...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\tf_win64.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\hl2.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_terraria
echo Aumentando prioridade do Terraria...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Terraria.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_thefinals
echo Aumentando prioridade do THE FINALS...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Discovery.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_theforest
echo Aumentando prioridade do The Forest...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\TheForest.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_theisle
echo Aumentando prioridade do The Isle...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\TheIsleClient-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
REM VERIFICAR EXECUTAVEL DA VERSAO INSTALADA
pause
goto :prioridadegames

:priorizar_tlol
echo Aumentando prioridade do The Last of Us Part I e II...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\tlou-i.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\tlou-ii.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
REM VERIFICAR EXECUTAVEIS DAS DUAS VERSOES
pause
goto :prioridadegames

:priorizar_r6
echo Aumentando prioridade do Rainbow Six Siege...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RainbowSix.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RainbowSix_Vulkan.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_ultrakill
echo Aumentando prioridade do ULTRAKILL...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ULTRAKILL.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_valorant
echo Aumentando prioridade do Valorant...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\VALORANT-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_warface
echo Aumentando prioridade do Warface...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Game.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
REM VERIFICAR EXECUTAVEL - GAME.EXE E UM NOME GENERICO
pause
goto :prioridadegames

:priorizar_warframe
echo Aumentando prioridade do Warframe...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Warframe.x64.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Warframe.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_warzone
echo Aumentando prioridade do Call of Duty Warzone...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cod.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_wutheringwaves
echo Aumentando prioridade do Wuthering Waves...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Client-Win64-Shipping.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:priorizar_zenlesszonezero
echo Aumentando prioridade do Zenless Zone Zero...
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ZenlessZoneZero.exe\PerfOptions" /v CpuPriorityClass /t REG_DWORD /d 3 /f
pause
goto :prioridadegames

:autorun
start "" "%~dp0Autoruns.exe"
echo Configurando Inicialização do Windows...
pause
cls
goto menu

:fix
cls
set "ESC="
cls
echo(
set "lines[0]=                         ___________._______  ___"
set "lines[1]=                         \_   _____/|   \   \/  /"
set "lines[2]=                          |    __)  |   |\     / "
set "lines[3]=                          |     \   |   |/     \ "
set "lines[4]=                          \___  /   |___/___/\  \"
set "lines[5]=                              \/              \_/


for /L %%j in (0,1,110) do (
set /a "corR=corBaseR + (variacaoR * %%j / 82)"
set /a "corG=corBaseG + (variacaoG * %%j / 82)"
set /a "corB=corBaseB + (variacaoB * %%j / 82)"
set "esc[%%j]=!ESC![38;2;!corR!;!corG!;!corB!m"
)

for /L %%i in (0,1,5) do (
set "texto=!lines[%%i]!"
set "textoGradiente="
for /L %%j in (0,1,82) do (
set "char=!texto:~%%j,1!"
if "!char!" == " " set "char= "
set "textoGradiente=!textoGradiente!!esc[%%j]!!char!"
)
echo( !textoGradiente!!ESC![0m
)

echo.

echo                    %op%Escolha%w% a %op%opção%w% que você quer %op%arrumar:%w%
echo.
echo.
echo         %m%[ %m%1 %m%]%w% Fix Bluetooth                 %m%[ %m%2 %m%]%w% Fix Reativar WI-FI
echo.
echo         %m%[ %m%3 %m%]%w% Fix Áudio                     %m%[ %m%4 %m%]%w% Fix Loja do Windows
echo.
echo         %m%[ %m%5 %m%]%w% Fix Notebook modo avião       %m%[ %m%6 %m%]%w% Fix PC não desliga
echo.
echo         %m%[ %m%7 %m%]%w% Fix Arquivos corrompidos      %m%[ %m%8 %m%]%w% Fix Rede e Internet
echo.
echo         %m%[ %m%9 %m%]%w% Fix Erro de Disco             %m%[ %m%10 %m%]%w% Fix Menu Iniciar e Barra de Tarefas
echo.
echo         %m%[ %m%11 %m%]%w% Fix Serviços Xbox            %m%[ %m%12 %m%]%w% Fix Windows Update
echo.
echo         %m%[ %m%13 %m%]%w% Fix Xbox App                 %m%[ %m%14 %m%]%w% Fix Câmera
echo.
echo         %m%[ %m%15 %m%]%w% Fix Microfone                %m%[ %m%16 %m%]%w% Fix Windows Defender
echo.
echo         %m%[ %m%17 %m%]%w% Fix Windows Search           %m%[ %m%18 %m%]%w% Fix Aplicativos do Windows
echo.
echo         %m%[ %m%19 %m%]%w% Fix Windows Hello / PIN      %m%[ %m%20 %m%]%w% Fix Impressora
echo.
echo         %m%[ %m%21 %m%]%w% Fix Explorador de Arquivos   %m%[ %m%22 %m%]%w% Fix Ícones e Miniaturas
echo.
echo         %m%[ %m%23 %m%]%w% Fix Copiar e Colar           %m%[ %m%24 %m%]%w% Fix DNS
echo.
echo         %m%[ %m%25 %m%]%w% Fix Windows Installer        %m%[ %m%26 %m%]%w% Fix Tela Preta
echo.
echo         %m%[ %m%27 %m%]%w% Fix Alto Uso de CPU          %m%[ %m%28 %m%]%w% Fix Alto Uso de RAM
echo.
echo         %m%[ %m%29 %m%]%w% Fix Disco 100%%              %m%[ %m%30 %m%]%w% Fix Erros de DLL
echo.
echo                         %op%[ %op%31 %op%]%w% Voltar ao Menu Principal
echo.

echo.
set /p opcao="Digite o número: "
cls

if %opcao% equ 1 goto fixbluetooth
if %opcao% equ 2 goto fixreativarwifi
if %opcao% equ 3 goto fixaudio
if %opcao% equ 4 goto fixlojadowindows
if %opcao% equ 5 goto fixnotebookmodoaviao
if %opcao% equ 6 goto fixpcnaodesliga
if %opcao% equ 7 goto fixarquivoscorrompidos
if %opcao% equ 8 goto fixderedeeinternet
if %opcao% equ 9 goto fixerrodedisco
if %opcao% equ 10 goto fixmenuiniciarebarradetarefas
if %opcao% equ 11 goto fixservicosxbox
if %opcao% equ 12 goto fixwindowsupdate
if %opcao% equ 13 goto fixxboxapp
if %opcao% equ 14 goto fixcamera
if %opcao% equ 15 goto fixmicrofone
if %opcao% equ 16 goto fixdefender
if %opcao% equ 17 goto fixwindowssearch
if %opcao% equ 18 goto fixaplicativos
if %opcao% equ 19 goto fixwindowshello
if %opcao% equ 20 goto fiximpressora
if %opcao% equ 21 goto fixexplorador
if %opcao% equ 22 goto fixicones
if %opcao% equ 23 goto fixcopiarcolar
if %opcao% equ 24 goto fixdns
if %opcao% equ 25 goto fixwindowsinstaller
if %opcao% equ 26 goto fixtelapreta
if %opcao% equ 27 goto fixaltocpu
if %opcao% equ 28 goto fixaltaram
if %opcao% equ 29 goto fixdisco100
if %opcao% equ 30 goto fixdll
if %opcao% equ 31 goto menu

:fixbluetooth
echo Arrumando...
sc config bthserv start= auto
sc start bthserv

pause
goto :fix

:fixreativarwifi
echo Arrumando...
sc config WlanSvc start= auto
sc start WlanSvc
sc config Dhcp start= auto
sc start Dhcp
sc config NlaSvc start= auto
sc start NlaSvc
sc config Netman start= auto
sc start Netman
netsh winsock reset
netsh int ip reset

pause
goto :fix

:fixaudio
echo Arrumando...
sc config Audiosrv start= auto
sc start Audiosrv
sc config AudioEndpointBuilder start= auto
sc start AudioEndpointBuilder
net stop audiosrv
net start audiosrv

pause
goto :fix

:fixlojadowindows
echo Arrumando...
sc config BITS start= auto
sc start BITS
start "" /wait /min powershell.exe -NoProfile -NonInteractive -ExecutionPolicy Bypass -Command "Get-AppxPackage -AllUsers | ForEach-Object { Add-AppxPackage -DisableDevelopmentMode -Register ($_.InstallLocation + '\AppxManifest.xml') }"

pause
goto :fix

:fixnotebookmodoaviao
echo Arrumando...
sc config RmSvc start= auto
sc start RmSvc
sc config WlanSvc start= auto
sc start WlanSvc

pause
goto :fix

:fixpcnaodesliga
echo Arrumando...
powercfg -h on
shutdown /f /t 0

pause
goto :fix


:fixarquivoscorrompidos
echo Arrumando...
echo Verificando arquivos do sistema...
sfc /scannow
echo Reparando imagem do Windows...
DISM /Online /Cleanup-Image /RestoreHealth

pause
goto :fix

:fixderedeeinternet
echo Arrumando...
ipconfig /flushdns
ipconfig /release
ipconfig /renew
netsh int ip reset
netsh winsock reset

pause
goto :fix

:fixerrodedisco
echo Arrumando...
chkdsk C: /f /r

pause
goto :fix

:fixmenuiniciarebarradetarefas
echo Arrumando...
taskkill /f /im explorer.exe
start explorer.exe

pause
goto :fix

:fixservicosxbox
echo Arrumando...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\XblAuthManager" /v "Start" /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\XblGameSave" /v "Start" /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\XboxNetApiSvc" /v "Start" /t REG_DWORD /d 2 /f

pause
goto :fix

:fixwindowsupdate
echo Arrumando...
net stop wuauserv
net stop bits
net stop cryptsvc
ren %systemroot%\SoftwareDistribution SoftwareDistribution.old
ren %systemroot%\System32\catroot2 catroot2.old
net start wuauserv
net start bits
net start cryptsvc

pause
goto :fix

:fixxboxapp
echo Arrumando...
net stop XboxGipSvc
net stop XblAuthManager
net stop XblGameSave
net stop XboxNetApiSvc
start "" /wait /min powershell.exe -NoProfile -NonInteractive -Command "Get-AppxPackage *Xbox* | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register `$($_.InstallLocation)\AppxManifest.xml}"
net start XboxGipSvc
net start XblAuthManager
net start XblGameSave
net start XboxNetApiSvc

pause
goto :fix

:fixcamera
echo Arrumando...
call :step "Fechando aplicativos que podem prender a camera"
for %%P in (Teams.exe ms-teams.exe Zoom.exe Discord.exe Skype.exe obs64.exe obs32.exe Camera.exe WindowsCamera.exe) do taskkill /F /IM %%P >nul 2>&1

call :step "Ativando permissoes de camera no Windows"
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" /v Value /t REG_SZ /d Allow /f >> "%LOG%" 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" /v Value /t REG_SZ /d Allow /f >> "%LOG%" 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam\NonPackaged" /v Value /t REG_SZ /d Allow /f >> "%LOG%" 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam\NonPackaged" /v Value /t REG_SZ /d Allow /f >> "%LOG%" 2>&1

call :step "Removendo politicas que podem bloquear a camera"
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Camera" /v AllowCamera /f >> "%LOG%" 2>&1
reg delete "HKCU\SOFTWARE\Policies\Microsoft\Camera" /v AllowCamera /f >> "%LOG%" 2>&1
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v LetAppsAccessCamera /f >> "%LOG%" 2>&1
reg delete "HKCU\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v LetAppsAccessCamera /f >> "%LOG%" 2>&1

call :step "Reiniciando servicos relacionados a dispositivos e captura"
for %%S in (PlugPlay DeviceInstall DsmSvc FrameServer FrameServerMonitor) do (
    sc query %%S >nul 2>&1 && (
        sc config %%S start= demand >> "%LOG%" 2>&1
        net stop %%S /y >> "%LOG%" 2>&1
        net start %%S >> "%LOG%" 2>&1
    )
)

call :step "Reiniciando servicos de usuario relacionados a camera"
powershell -NoProfile -ExecutionPolicy Bypass -Command "$svcs=Get-Service | Where-Object { $_.Name -like 'CaptureService_*' -or $_.Name -like 'cbdhsvc_*' }; foreach($s in $svcs){ try{Restart-Service -Name $s.Name -Force -ErrorAction SilentlyContinue}catch{}}" >> "%LOG%" 2>&1

call :step "Reativando dispositivos de Camera/Image via Plug and Play"
powershell -NoProfile -ExecutionPolicy Bypass -Command "$devs=Get-PnpDevice -PresentOnly:$false -ErrorAction SilentlyContinue | Where-Object { $_.Class -in @('Camera','Image') -or $_.FriendlyName -match 'camera|webcam|integrated cam|usb video' }; foreach($d in $devs){ try{Enable-PnpDevice -InstanceId $d.InstanceId -Confirm:$false -ErrorAction SilentlyContinue}catch{} }; $devs | Format-Table Status,Class,FriendlyName,InstanceId -AutoSize" >> "%LOG%" 2>&1

call :step "Forcando nova deteccao de hardware"
pnputil /scan-devices >> "%LOG%" 2>&1

timeout /t 3 /nobreak >nul

call :step "Tentando reiniciar os dispositivos de camera"
powershell -NoProfile -ExecutionPolicy Bypass -Command "$devs=Get-PnpDevice -ErrorAction SilentlyContinue | Where-Object { $_.Class -in @('Camera','Image') -or $_.FriendlyName -match 'camera|webcam|integrated cam|usb video' }; foreach($d in $devs){ try{Disable-PnpDevice -InstanceId $d.InstanceId -Confirm:$false -ErrorAction SilentlyContinue; Start-Sleep -Milliseconds 700; Enable-PnpDevice -InstanceId $d.InstanceId -Confirm:$false -ErrorAction SilentlyContinue}catch{}}" >> "%LOG%" 2>&1

call :step "Verificando arquivos do Windows (DISM + SFC)"
DISM /Online /Cleanup-Image /ScanHealth >> "%LOG%" 2>&1
DISM /Online /Cleanup-Image /RestoreHealth >> "%LOG%" 2>&1
sfc /scannow >> "%LOG%" 2>&1

call :step "Atualizando componentes da Microsoft Store / Camera, quando possivel"
powershell -NoProfile -ExecutionPolicy Bypass -Command "if(Get-Command winget -ErrorAction SilentlyContinue){ winget source update --disable-interactivity | Out-Null; winget upgrade --id Microsoft.WindowsCamera --accept-source-agreements --accept-package-agreements --silent 2>$null }" >> "%LOG%" 2>&1

call :step "Re-registrando o aplicativo Camera do Windows"
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-AppxPackage -AllUsers *WindowsCamera* -ErrorAction SilentlyContinue | ForEach-Object { try { Add-AppxPackage -DisableDevelopmentMode -Register ($_.InstallLocation + '\\AppXManifest.xml') -ErrorAction SilentlyContinue } catch {} }" >> "%LOG%" 2>&1

call :step "Tentando iniciar o Windows Update para drivers"
sc start wuauserv >> "%LOG%" 2>&1
sc start bits >> "%LOG%" 2>&1
UsoClient StartScan >> "%LOG%" 2>&1
UsoClient StartDownload >> "%LOG%" 2>&1

call :step "Listando status final da camera"
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-PnpDevice -ErrorAction SilentlyContinue | Where-Object { $_.Class -in @('Camera','Image') -or $_.FriendlyName -match 'camera|webcam|usb video' } | Format-Table Status,Class,FriendlyName,Problem,InstanceId -AutoSize" >> "%LOG%" 2>&1

echo.
echo ============================================================
echo FIX DA CAMERA FINALIZADO
echo ============================================================
echo.
echo 1. Desconecte e conecte a webcam novamente, se for USB.
echo 2. Reinicie o PC para aplicar tudo.
echo 3. Depois teste em Configuracoes ^> Bluetooth e dispositivos ^> Cameras
echo    ou abra o aplicativo Camera.
echo.
echo Log salvo em:
echo %LOG%
echo.
pause
goto :fix

:fixmicrofone
echo Arrumando...
call :step "Criando ponto de restauracao, se disponivel"
powershell -NoProfile -ExecutionPolicy Bypass -Command "try { Enable-ComputerRestore -Drive ($env:SystemDrive+'\\') -ErrorAction SilentlyContinue; Checkpoint-Computer -Description 'Antes do FIX Microfone' -RestorePointType 'MODIFY_SETTINGS' -ErrorAction SilentlyContinue } catch {}" >> "%LOG%" 2>&1

call :step "Fechando aplicativos que podem prender o microfone"
for %%P in (Teams.exe ms-teams.exe Zoom.exe Discord.exe Skype.exe obs64.exe obs32.exe) do taskkill /F /IM %%P >nul 2>&1

call :step "Ativando permissoes do microfone no Windows"
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone" /v Value /t REG_SZ /d Allow /f >> "%LOG%" 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone" /v Value /t REG_SZ /d Allow /f >> "%LOG%" 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone\NonPackaged" /v Value /t REG_SZ /d Allow /f >> "%LOG%" 2>&1
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone\NonPackaged" /v Value /t REG_SZ /d Allow /f >> "%LOG%" 2>&1

call :step "Removendo politicas que podem bloquear o microfone"
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v LetAppsAccessMicrophone /f >> "%LOG%" 2>&1
reg delete "HKCU\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v LetAppsAccessMicrophone /f >> "%LOG%" 2>&1

call :step "Configurando e reiniciando os principais servicos de audio"
sc config AudioEndpointBuilder start= auto >> "%LOG%" 2>&1
sc config Audiosrv start= auto >> "%LOG%" 2>&1
sc config PlugPlay start= auto >> "%LOG%" 2>&1
net stop Audiosrv /y >> "%LOG%" 2>&1
net stop AudioEndpointBuilder /y >> "%LOG%" 2>&1
net start AudioEndpointBuilder >> "%LOG%" 2>&1
net start Audiosrv >> "%LOG%" 2>&1

call :step "Reativando dispositivos de audio e microfone"
powershell -NoProfile -ExecutionPolicy Bypass -Command "$devs=Get-PnpDevice -PresentOnly:$false -ErrorAction SilentlyContinue | Where-Object { $_.Class -in @('AudioEndpoint','MEDIA') -or $_.FriendlyName -match 'microphone|microfone|mic|audio|headset' }; foreach($d in $devs){ try{Enable-PnpDevice -InstanceId $d.InstanceId -Confirm:$false -ErrorAction SilentlyContinue}catch{} }; $devs | Format-Table Status,Class,FriendlyName,InstanceId -AutoSize" >> "%LOG%" 2>&1

call :step "Forcando nova deteccao de hardware de audio"
pnputil /scan-devices >> "%LOG%" 2>&1

timeout /t 3 /nobreak >nul

call :step "Reiniciando endpoints e dispositivos de audio"
powershell -NoProfile -ExecutionPolicy Bypass -Command "$devs=Get-PnpDevice -ErrorAction SilentlyContinue | Where-Object { $_.Class -in @('AudioEndpoint','MEDIA') -and $_.Status -ne 'Unknown' }; foreach($d in $devs){ try{Disable-PnpDevice -InstanceId $d.InstanceId -Confirm:$false -ErrorAction SilentlyContinue; Start-Sleep -Milliseconds 500; Enable-PnpDevice -InstanceId $d.InstanceId -Confirm:$false -ErrorAction SilentlyContinue}catch{}}" >> "%LOG%" 2>&1

call :step "Limpando cache de deteccao de audio e reiniciando servicos"
net stop Audiosrv /y >> "%LOG%" 2>&1
net stop AudioEndpointBuilder /y >> "%LOG%" 2>&1
timeout /t 2 /nobreak >nul
net start AudioEndpointBuilder >> "%LOG%" 2>&1
net start Audiosrv >> "%LOG%" 2>&1

call :step "Verificando integridade do Windows (DISM + SFC)"
DISM /Online /Cleanup-Image /ScanHealth >> "%LOG%" 2>&1
DISM /Online /Cleanup-Image /RestoreHealth >> "%LOG%" 2>&1
sfc /scannow >> "%LOG%" 2>&1

call :step "Tentando iniciar Windows Update para drivers de audio"
sc start wuauserv >> "%LOG%" 2>&1
sc start bits >> "%LOG%" 2>&1
UsoClient StartScan >> "%LOG%" 2>&1
UsoClient StartDownload >> "%LOG%" 2>&1

call :step "Abrindo painel de som para conferir o dispositivo padrao"
start ms-settings:sound

call :step "Listando status final dos dispositivos de audio"
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-PnpDevice -ErrorAction SilentlyContinue | Where-Object { $_.Class -in @('AudioEndpoint','MEDIA') -or $_.FriendlyName -match 'microphone|microfone|mic|audio|headset' } | Format-Table Status,Class,FriendlyName,Problem,InstanceId -AutoSize" >> "%LOG%" 2>&1

echo.
echo ============================================================
echo FIX DO MICROFONE FINALIZADO
echo ============================================================
echo.
echo Confira em Configuracoes ^> Sistema ^> Som ^> Entrada:
echo - se o microfone correto esta selecionado;
echo - se o volume de entrada nao esta em 0;
echo - se o dispositivo nao esta desabilitado.
echo.
echo Se for USB/P2, desconecte e conecte novamente e reinicie o PC.
echo.
echo Log salvo em:
echo %LOG%
echo.
pause
exit /b 0

:step
echo.
echo [*] %~1...
echo [%date% %time%] %~1 >> "%LOG%"
exit /b


pause
goto :fix

:fixdefender
echo Verificando o Windows Defender...
sc query WinDefend
sc query SecurityHealthService
sc query wscsvc
start "" /wait /min powershell.exe -NoProfile -NonInteractive -Command "Get-MpComputerStatus | Select-Object AMServiceEnabled,AntivirusEnabled,RealTimeProtectionEnabled"
echo.
echo Verificando arquivos do sistema...
sfc /scannow
echo.
echo Abrindo a Seguranca do Windows...
start "" "windowsdefender:"
pause
goto :fix

:fixwindowssearch
echo Corrigindo o Windows Search...
sc config WSearch start= delayed-auto
net stop WSearch
net start WSearch
echo.
echo Abrindo as opcoes de indexacao...
start "" control.exe srchadmin.dll
pause
goto :fix

:fixaplicativos
echo Reparando aplicativos do Windows...
DISM /Online /Cleanup-Image /RestoreHealth
sfc /scannow
echo.
echo Registrando novamente os aplicativos instalados...
start "" /wait /min powershell.exe -NoProfile -NonInteractive -Command "Get-AppxPackage | Where-Object {$_.InstallLocation -and (Test-Path (Join-Path $_.InstallLocation 'AppxManifest.xml'))} | ForEach-Object {Add-AppxPackage -DisableDevelopmentMode -Register (Join-Path $_.InstallLocation 'AppxManifest.xml') -ErrorAction SilentlyContinue}"
echo.
echo Alguns aplicativos podem exigir reparo individual.
pause
goto :fix


:fixwindowshello
echo Verificando o Windows Hello e PIN...
sc query NgcSvc
sc query NgcCtnrSvc
sc query WbioSrvc
echo.
echo Verificando integridade do Windows...
sfc /scannow
echo.
echo Abrindo as opcoes de entrada...
start "" ms-settings:signinoptions
echo.
echo Se o PIN estiver com problema, tente remove-lo
echo e configura-lo novamente pelas Configuracoes.
echo Nenhuma credencial foi apagada.
pause
goto :fix

:fiximpressora
echo Corrigindo o servico de impressao...
sc config Spooler start= auto
net stop Spooler
echo.
echo ATENCAO: A proxima etapa remove trabalhos
echo de impressao pendentes da fila.
choice /C SN /M "Deseja limpar a fila de impressao?"
if errorlevel 2 goto :fiximpressora_reiniciar
del /F /Q "%SystemRoot%\System32\spool\PRINTERS\*.SHD" 2>nul
del /F /Q "%SystemRoot%\System32\spool\PRINTERS\*.SPL" 2>nul

:fiximpressora_reiniciar
net start Spooler
echo.
echo Abrindo as impressoras instaladas...
start "" control.exe printers
pause
goto :fix

:fixexplorador
echo Reiniciando o Explorador de Arquivos...
taskkill /F /IM explorer.exe
timeout /t 2 /nobreak >nul
start "" explorer.exe
echo.
echo Explorador reiniciado.
pause
goto :fix

:fixicones
echo Reconstruindo cache de icones e miniaturas...
echo.
echo O Explorador sera reiniciado.
taskkill /F /IM explorer.exe
timeout /t 2 /nobreak >nul
del /A /F /Q "%LocalAppData%\IconCache.db" 2>nul
del /A /F /Q "%LocalAppData%\Microsoft\Windows\Explorer\iconcache_*.db" 2>nul
del /A /F /Q "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db" 2>nul
start "" explorer.exe
echo.
echo Os caches serao reconstruidos pelo Windows.
pause
goto :fix

:fixcopiarcolar
echo Verificando a area de transferencia...
echo.
echo ATENCAO: A area de transferencia atual sera limpa.
choice /C SN /M "Deseja continuar?"
if errorlevel 2 goto :fix
echo off | clip
echo.
echo Area de transferencia limpa.
echo.
echo Abrindo as configuracoes do historico...
start "" ms-settings:clipboard
echo.
echo Se o problema continuar, reinicie o aplicativo
echo afetado ou o computador.
pause
goto :fix

:fixdns
echo Corrigindo problemas de DNS...
ipconfig /flushdns
echo.
echo Cache DNS limpo.
echo.
echo Testando resolucao de nomes...
nslookup microsoft.com
echo.
echo Se o problema continuar, verifique o DNS
echo configurado no adaptador de rede.
pause
goto :fix

:fixwindowsinstaller
echo Verificando o Windows Installer...
sc config msiserver start= demand
net stop msiserver
echo.
echo Registrando novamente o Windows Installer...
%SystemRoot%\System32\msiexec.exe /unregister
%SystemRoot%\System32\msiexec.exe /regserver
if exist "%SystemRoot%\SysWOW64\msiexec.exe" (
    %SystemRoot%\SysWOW64\msiexec.exe /unregister
    %SystemRoot%\SysWOW64\msiexec.exe /regserver
)
echo.
echo Verificando o servico...
sc query msiserver
pause
goto :fix

:fixtelapreta
echo Tentando recuperar a interface do Windows...
echo.
echo Reiniciando o Explorador de Arquivos...
taskkill /F /IM explorer.exe
timeout /t 2 /nobreak >nul
start "" explorer.exe
echo.
echo Verificando arquivos do sistema...
sfc /scannow
echo.
echo Se a tela continuar preta, tente pressionar
echo Windows + Ctrl + Shift + B para solicitar
echo a reinicializacao do driver grafico.
echo.
echo Esta rotina nao corrige todas as causas de tela preta.
pause
goto :fix

:fixaltocpu
echo Diagnosticando alto uso de CPU...
echo.
echo Processos com maior tempo acumulado de CPU:
start "" /wait /min powershell.exe -NoProfile -NonInteractive -Command "Get-Process | Sort-Object CPU -Descending | Select-Object -First 15 ProcessName,Id,CPU | Format-Table -AutoSize"
echo.
echo Verificando arquivos do sistema...
sfc /verifyonly
echo.
echo Abrindo o Gerenciador de Tarefas...
start "" taskmgr.exe
echo.
echo Verifique a coluna CPU para identificar
echo os processos com maior consumo atual.
pause
goto :fix

:fixaltaram
echo Diagnosticando alto uso de memoria RAM...
echo.
echo Processos com maior consumo de memoria:
start "" /wait /min powershell.exe -NoProfile -NonInteractive -Command "Get-Process | Sort-Object WorkingSet64 -Descending | Select-Object -First 15 ProcessName,Id,@{Name='RAM_MB';Expression={[math]::Round($_.WorkingSet64/1MB,0)}} | Format-Table -AutoSize"
echo.
echo Informacoes da memoria:
start "" /wait /min powershell.exe -NoProfile -NonInteractive -Command "Get-CimInstance Win32_OperatingSystem | Select-Object @{Name='TotalRAM_MB';Expression={[math]::Round($_.TotalVisibleMemorySize/1024,0)}},@{Name='RAMLivre_MB';Expression={[math]::Round($_.FreePhysicalMemory/1024,0)}} | Format-Table -AutoSize"
echo.
echo Abrindo o Gerenciador de Tarefas...
start "" taskmgr.exe
echo.
echo Nenhum processo foi encerrado automaticamente.
pause
goto :fix

:fixdisco100
echo Diagnosticando uso elevado do disco...
echo.
echo Verificando o sistema de arquivos...
chkdsk C: /scan
echo.
echo Verificando integridade do Windows...
sfc /verifyonly
echo.
echo Verificando discos detectados...
start "" /wait /min powershell.exe -NoProfile -NonInteractive -Command "Get-PhysicalDisk | Select-Object FriendlyName,MediaType,HealthStatus,OperationalStatus | Format-Table -AutoSize"
echo.
echo Abrindo o Monitor de Recursos...
start "" resmon.exe
echo.
echo Acesse a aba Disco para identificar
echo os processos que estao realizando leituras
echo e gravacoes excessivas.
pause
goto :fix

:fixdll
echo Verificando erros de DLL e arquivos do Windows...
echo.
echo Reparando a imagem do sistema...
DISM /Online /Cleanup-Image /RestoreHealth
echo.
echo Verificando arquivos protegidos...
sfc /scannow
echo.
echo Verificacao concluida.
echo.
echo DLLs de programas de terceiros podem exigir
echo a reinstalacao do aplicativo ou de seus
echo componentes oficiais.
pause
goto :fix

