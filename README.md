# Cache Server

Um servidor de cache HTTP simples construído em Erlang usando Cowboy e Mnesia.

## Descrição

Este projeto implementa um servidor de cache que pode:
- Receber requisições GET para buscar dados do cache
- Gerenciar workers de cache através de um supervisor dedicado

## Arquitetura

```
cache_server_app
└── cache_server_sup (supervisor principal)
    ├── cache_server_http_listen (servidor HTTP Cowboy)
    └── cache_handle_supervisor (supervisor de workers de cache)
```

### Componentes

- **cache_server_app**: Aplicação principal
- **cache_server_sup**: Supervisor principal que gerencia o servidor HTTP e o supervisor de cache
- **cache_server_http_listen**: Configura o Cowboy para receber requisições HTTP
- **cache_handle_supervisor**: Supervisor para gerenciar workers de cache
- **get_handler**: Handler HTTP que processa as requisições GET 

## Instalação

### Pré-requisitos

- Erlang/OTP 24 ou superior
- GNU Make 4 ou superior
- Git

### Build

```bash
# Clone o repositório
git clone <repository-url>
cd cache_server

# Compilar o projeto
make

# Criar release
make rel
```

## Uso

### Executar o servidor

```bash
# Executar em modo desenvolvimento
make run

# Ou executar o release
./_rel/cache_server_release/bin/cache_server_release console
```

O servidor estará disponível em `http://localhost:8080`

### API

#### GET - Buscar no cache
```bash
curl http://localhost:8080/caminho/para/recurso
```

#### POST - Armazenar no cache
```bash
curl -X POST http://localhost:8080/caminho/para/recurso \
  -H "Content-Type: application/json" \
  -d '{"data": "valor"}'
```

## Desenvolvimento

### Estrutura de arquivos

```
src/
├── cache_server_app.erl      # Aplicação principal
├── cache_server_sup.erl      # Supervisor principal
├── cache_server_http_listen.erl  # Configuração do Cowboy
├── cache_handle_supervisor.erl   # Supervisor de workers de cache
└── get_handler.erl           # Handler HTTP

config/
├── sys.config               # Configuração do sistema
└── vm.args                  # Argumentos da VM Erlang

relx.config                  # Configuração do release
```

### Comandos úteis

```bash
# Compilar
make

# Executar testes
make ct

# Limpar build
make clean

# Executar em modo desenvolvimento
make run

# Criar release
make rel

# Executar release
make run
```

## Configuração

### Porta do servidor

A porta padrão é 8080. Para alterar, edite `src/cache_server_http_listen.erl`:

### Configurações do sistema

Edite `config/sys.config` para configurações específicas da aplicação.

## Contribuição

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/nova-feature`)
3. Commit suas mudanças (`git commit -am 'Adiciona nova feature'`)
4. Push para a branch (`git push origin feature/nova-feature`)
5. Abra um Pull Request

## Licença

Este projeto está sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.
