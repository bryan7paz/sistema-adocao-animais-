@echo off
chcp 65001 >nul
title SISTEMA DE ADOCAO DE ANIMAIS - TESTE
echo ============================================================
echo  SISTEMA DE ADOCAO DE ANIMAIS - TUDO EM UM
echo  (inicia o sistema, testa e encerra)
echo ============================================================
echo.

cd /d "%~dp0"

echo [0] Parando qualquer sistema que esteja rodando...
for /f "tokens=5" %%p in ('netstat -ano ^| findstr ":8080" ^| findstr "LISTENING"') do (
    taskkill /PID %%p /F >nul 2>&1
)
timeout /t 2 /nobreak >nul

echo [0] Iniciando o sistema (Spring Boot)...
start "Sistema Adocao" /B java -jar "target\adocao-0.0.1-SNAPSHOT.jar"
echo      Aguardando o sistema subir, por favor aguarde...
echo.

set "PRONTO="
for /l %%i in (1,1,60) do (
    netstat -ano | findstr ":8080" | findstr "LISTENING" >nul 2>&1
    if not errorlevel 1 (
        set "PRONTO=1"
        goto :pronto
    )
    timeout /t 1 /nobreak >nul
)
:pronto

if not defined PRONTO (
    echo [ERRO] Nao consegui iniciar o sistema na porta 8080.
    echo        Confira se o jar existe em: target\adocao-0.0.1-SNAPSHOT.jar
    pause
    exit /b 1
)

echo [OK] Sistema no ar! Testando os endpoints...
echo.

echo ============================================================
echo  [1] CADASTRAR animal: Rex  (POST /animais)
echo ============================================================
curl -s -X POST http://localhost:8080/animais -H "Content-Type: application/json" -d "{\"nome\":\"Rex\",\"especie\":\"CAO\",\"raca\":\"Labrador\",\"idade\":3,\"sexo\":\"Macho\",\"porte\":\"GRANDE\",\"descricao\":\"Cao carinhoso e brincalhao\",\"status\":\"DISPONIVEL\"}"
echo.
echo.

echo ============================================================
echo  [2] CADASTRAR animal: Miau  (POST /animais)
echo ============================================================
curl -s -X POST http://localhost:8080/animais -H "Content-Type: application/json" -d "{\"nome\":\"Miau\",\"especie\":\"GATO\",\"raca\":\"Siames\",\"idade\":2,\"sexo\":\"Femea\",\"porte\":\"PEQUENO\",\"descricao\":\"Gata calma e tranquila\",\"status\":\"DISPONIVEL\"}"
echo.
echo.

echo ============================================================
echo  [3] CONSULTAR todos os animais  (GET /animais)
echo ============================================================
curl -s http://localhost:8080/animais
echo.
echo.

echo ============================================================
echo  [4] CONSULTAR animal pelo ID 1  (GET /animais/1)
echo ============================================================
curl -s http://localhost:8080/animais/1
echo.
echo.

echo ============================================================
echo  [5] ALTERAR animal ID 1 - status ADOTADO  (PUT /animais/1)
echo ============================================================
curl -s -X PUT http://localhost:8080/animais/1 -H "Content-Type: application/json" -d "{\"nome\":\"Rex\",\"especie\":\"CAO\",\"raca\":\"Labrador\",\"idade\":4,\"sexo\":\"Macho\",\"porte\":\"GRANDE\",\"descricao\":\"Cao carinhoso e brincalhao\",\"status\":\"ADOTADO\"}"
echo.
echo.

echo ============================================================
echo  [6] EXCLUIR animal ID 2  (DELETE /animais/2)
echo ============================================================
curl -s -w " (HTTP:%%{http_code})" -X DELETE http://localhost:8080/animais/2
echo.
echo.

echo ============================================================
echo  [7] CONSULTAR ID inexistente 999  (GET /animais/999)
echo ============================================================
curl -s -w " (HTTP:%%{http_code})" http://localhost:8080/animais/999
echo.
echo.

echo ============================================================
echo  [8] LISTA FINAL de animais
echo ============================================================
curl -s http://localhost:8080/animais
echo.
echo.

echo ============================================================
echo  PRONTO! Todos os testes foram executados.
echo  Agora encerrando o sistema...
echo ============================================================
for /f "tokens=5" %%p in ('netstat -ano ^| findstr ":8080" ^| findstr "LISTENING"') do (
    taskkill /PID %%p /F >nul 2>&1
)
echo.
echo Encerrado. Voce pode fechar esta janela.
pause