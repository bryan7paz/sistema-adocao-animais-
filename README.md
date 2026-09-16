# 🐾 Sistema de Adoção de Animais

API REST para gerenciamento de animais para adoção, desenvolvida com Spring Boot.

## 📋 Visão Geral

Sistema para cadastro, consulta, atualização e exclusão de animais disponíveis para adoção.

## 🛠️ Tecnologias

- **Java 17**
- **Spring Boot 3.3.4**
- **Spring Data JPA**
- **H2 Database** (banco em memória)
- **Maven**

## 🚀 Como Executar

### Pré-requisitos
- Java 17 ou superior
- Maven

### Passo a passo

```bash
# Clone o repositório
git clone https://github.com/bryan7paz/sistema-adocao-animais-.git

# Acesse a pasta do projeto
cd sistema-adocao-animais

# Execute a aplicação
./mvnw spring-boot:run
```

A API estará disponível em: `http://localhost:8080`

## 📡 Endpoints

Base URL: `http://localhost:8080/animais`

| Método | Rota | Descrição | Status Code |
|--------|------|-----------|-------------|
| `POST` | `/animais` | Cadastrar novo animal | 201 Created |
| `GET` | `/animais` | Listar todos os animais | 200 OK |
| `GET` | `/animais/{id}` | Buscar animal por ID | 200 OK |
| `PUT` | `/animais/{id}` | Atualizar animal | 200 OK |
| `DELETE` | `/animais/{id}` | Excluir animal | 204 No Content |

## 📝 Exemplos de Requisições

### Cadastrar Animal (POST)

```json
POST /animais
Content-Type: application/json

{
  "nome": "Rex",
  "especie": "CAO",
  "raca": "Labrador",
  "idade": 3,
  "sexo": "Macho",
  "porte": "GRANDE",
  "descricao": "Cão muito carinhoso e brincalhão",
  "status": "DISPONIVEL"
}
```

### Listar Todos (GET)

```bash
GET /animais
```

### Buscar por ID (GET)

```bash
GET /animais/1
```

### Atualizar Animal (PUT)

```json
PUT /animais/1
Content-Type: application/json

{
  "nome": "Rex",
  "especie": "CAO",
  "raca": "Labrador",
  "idade": 4,
  "sexo": "Macho",
  "porte": "GRANDE",
  "descricao": "Cão muito carinhoso e brincalhão",
  "status": "ADOTADO"
}
```

### Excluir Animal (DELETE)

```bash
DELETE /animais/1
```

## 📊 Modelo de Dados

### Campos do Animal

| Campo | Tipo | Obrigatório | Valores |
|-------|------|-------------|---------|
| `id` | Long | Auto | Gerado automaticamente |
| `nome` | String | Sim | Até 100 caracteres |
| `especie` | Enum | Sim | `CAO`, `GATO` |
| `raca` | String | Não | Até 100 caracteres |
| `idade` | Integer | Sim | ≥ 0 |
| `sexo` | String | Não | Até 10 caracteres |
| `porte` | Enum | Sim | `PEQUENO`, `MEDIO`, `GRANDE` |
| `descricao` | String | Não | Até 500 caracteres |
| `status` | Enum | Não | `DISPONIVEL`, `ADOTADO` (padrão: DISPONIVEL) |

## 🗄️ Banco de Dados

- **Tipo:** H2 em memória
- **Console H2:** `http://localhost:8080/h2-console`
- **URL JDBC:** `jdbc:h2:mem:adocao`
- **Usuário:** `sa`
- **Senha:** (vazio)

## 🧪 Testes

O arquivo `test.http` contém exemplos de requisições para teste rápido.

## 📁 Estrutura do Projeto

```
src/main/java/com/adocao/
├── AdocaoApplication.java           # Classe principal
└── animal/
    ├── controller/
    │   └── AnimalController.java    # Endpoints REST
    ├── dto/
    │   ├── AnimalRequest.java       # DTO de entrada
    │   └── AnimalResponse.java      # DTO de saída
    ├── model/
    │   ├── Animal.java              # Entidade JPA
    │   ├── Especie.java             # Enum de espécies
    │   ├── Porte.java               # Enum de portes
    │   └── Status.java              # Enum de status
    ├── repository/
    │   └── AnimalRepository.java    # Interface JPA
    └── service/
        └── AnimalService.java       # Lógica de negócio
```

## 👨‍💻 Autor

**Bryan Paz** - [GitHub](https://github.com/bryan7paz)
