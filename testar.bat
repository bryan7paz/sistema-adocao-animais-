@echo off
chcp 65001 >nul
echo ================================================
echo  TESTE DO SISTEMA DE ADOCAO DE ANIMAIS
echo  (CRUD completo - Cadastrar, Consultar, Alterar, Excluir)
echo ================================================
echo.

echo [1] Cadastrar animal: Rex (POST)
curl -s -X POST http://localhost:8080/animais -H "Content-Type: application/json" -d "{\"nome\":\"Rex\",\"especie\":\"CAO\",\"raca\":\"Labrador\",\"idade\":3,\"sexo\":\"Macho\",\"porte\":\"GRANDE\",\"descricao\":\"Cao carinhoso e brincalhao\",\"status\":\"DISPONIVEL\"}"
echo.
echo.
echo [2] Cadastrar animal: Miau (POST)
curl -s -X POST http://localhost:8080/animais -H "Content-Type: application/json" -d "{\"nome\":\"Miau\",\"especie\":\"GATO\",\"raca\":\"Siames\",\"idade\":2,\"sexo\":\"Femea\",\"porte\":\"PEQUENO\",\"descricao\":\"Gata calma e tranquila\",\"status\":\"DISPONIVEL\"}"
echo.
echo.
echo [3] Consultar todos os animais (GET)
curl -s http://localhost:8080/animais
echo.
echo.
echo [4] Consultar animal pelo ID 1 (GET)
curl -s http://localhost:8080/animais/1
echo.
echo.
echo [5] Alterar animal ID 1 - status para ADOTADO (PUT)
curl -s -X PUT http://localhost:8080/animais/1 -H "Content-Type: application/json" -d "{\"nome\":\"Rex\",\"especie\":\"CAO\",\"raca\":\"Labrador\",\"idade\":4,\"sexo\":\"Macho\",\"porte\":\"GRANDE\",\"descricao\":\"Cao carinhoso e brincalhao\",\"status\":\"ADOTADO\"}"
echo.
echo.
echo [6] Excluir animal ID 2 (DELETE) - deve dar 204
curl -s -w "HTTP:%%{http_code}" -X DELETE http://localhost:8080/animais/2
echo.
echo.
echo [7] Consultar ID inexistente 999 (deve dar erro 404)
curl -s -w "HTTP:%%{http_code}" http://localhost:8080/animais/999
echo.
echo.
echo [8] Lista final de animais
curl -s http://localhost:8080/animais
echo.
echo.
echo ================================================
echo  FIM DOS TESTES - todos os endpoints funcionaram!
echo ================================================
pause