# DevOps CP4 - .NET API

CRUD API desenvolvida em .NET 9 com Entity Framework Core e Azure SQL Database.

## Recursos

- **Entities**: Role e Employee com relacionamento
- **CRUD completo** para ambas as entidades
- **Azure SQL Database** como banco de dados
- **Docker** ready

## Rotas da API

### Health Check
- `GET /api/health` - Verificar se a aplicação está funcionando

### Roles
- `GET /api/roles` - Listar todas as roles
- `POST /api/roles` - Criar nova role
- `GET /api/roles/{id}` - Buscar role por ID
- `PUT /api/roles/{id}` - Atualizar role
- `DELETE /api/roles/{id}` - Deletar role

### Employees
- `GET /api/employees` - Listar todos os employees
- `POST /api/employees` - Criar novo employee
- `GET /api/employees/{id}` - Buscar employee por ID
- `PUT /api/employees/{id}` - Atualizar employee
- `DELETE /api/employees/{id}` - Deletar employee

## Como executar

### Local (desenvolvimento)

1. Configure a variável de ambiente no arquivo `.env`:
```bash
DB_URL="Server=tcp:seu-server.database.windows.net,1433;Initial Catalog=sua-database;Persist Security Info=False;User ID=seu-usuario;Password=sua-senha;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
```

2. Execute:
```bash
set -o allexport && source .env && set +o allexport && dotnet run
```

### Docker

1. Build da imagem:
```bash
docker build -t devops-cp4 .
```

2. Execute o container:
```bash
docker run -p 8080:8080 -e DB_URL="sua-connection-string" devops-cp4
```

A aplicação estará disponível em `http://localhost:8080`
