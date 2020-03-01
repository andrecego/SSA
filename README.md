# Saint Seiya Awakening

Esse projeto é uma aplicação de banco de dados, com o objetivo de catalogar todos personagens e habilidades do jogo mobile [Saint Seiya: Awakening](https://play.google.com/store/apps/details?id=com.tencent.tmgp.ssksea&hl=en). O projeto em produção pode ser visualizado em https://ssawakening.herokuapp.com

## Começando

Clone o projeto e siga os passos de [Instalação](#Instalação) 

### Pré-requisitos

É necessário ter [Docker](https://docs.docker.com/install/) e [Docker Compose](https://docs.docker.com/compose/install/) instalados, caso não tenha só seguir os passos de instalação, de acordo com seu sistema operacional.

### Instalação

Com Docker e Docker Compose instalados, navegue até a raiz do projeto e rode o comando

```
docker-compose build
```

Agora com a imagem já construida, pode subir o projeto com 

```
docker-compose up
```

A aplicação irá inicializar e estará disponível em `http://localhost:3000`

Para derrubar o servidor basta usar o comando `Ctrl + C`, e para interromper a execução do container 

```
docker-compose down
```

Agora se quiser subir novamente o passo de `build` não é mais necessário, rode apenas `docker-compose up`, e deverá ser um processo bem mais rápido

## Rodando os testes

Essa aplicação usa Rspec para automação de testes, para rodar todos os testes basta executar o comando

```
docker-compose run --rm web rspec
```

Se todas as dependências estão instaladas corretamente aparecerá o número de testes, o tempo de execução e a porcentagem de cobertura.

Os arquivos de testes estão localizados na pasta `/spec`, divididas respectivamente em pastas para facilitar leitura e navegação.

## Ferramentas 

- Back-end Framework: Ruby on Rails

- Banco de Dados: Postgres

- Hospedagem de imagens: Google Cloud Services

- Front-end Framework: [Bootstrap](https://github.com/twbs/bootstrap)

- Conteinerizador: [Docker](https://www.docker.com)

- Ambiente de testes: [Capybara](https://github.com/teamcapybara/capybara) com [RSpec](https://github.com/rspec/rspec-rails), [FactoryBot](https://github.com/thoughtbot/factory_bot_rails), e [SimpleCov](https://github.com/colszowka/simplecov)

- Linter: [RuboCop](https://github.com/rubocop-hq/rubocop)
