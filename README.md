# Programa de Residência em TI

## Projeto Final de Introdução à Programação

**Aluno:** Owen Alves Lima  
**Projeto:** Já Gabaritei!

---

## Sobre o Projeto

**Já Gabaritei!** é uma aplicação desenvolvida como parte da disciplina de Introdução à Programação, no âmbito do Programa de Residência em TI. Seu objetivo é auxiliar nos estudos por meio da criação e resolução de questões, funcionando como uma plataforma de simulado personalizada. Os usuários podem cadastrar questões, responder questões e acompanhar seu desempenho, tornando o aprendizado mais prático e eficiente.

---

## Como subir a aplicação

Siga os passos abaixo para executar o projeto localmente utilizando Docker:

### 1. Clone o repositório

```bash
git clone https://github.com/owenlima/JaGabaritei.git
cd JaGabaritei
```

### 2. Construa os containers com Docker Compose

```bash
docker-compose build
```

### 3. Suba os containers

```bash
docker-compose up -d
```

### 4. Acesse o container da aplicação

```bash
docker compose exec app bash
```

### 5. Configure o ambiente de desenvolvimento Rails

```bash
bundle install
yarn install

```

```bash
rails dev:setup
```

Este comando irá rodar uma task para configurar o banco de dados, carregar os seeds e realizar outras configurações iniciais necessárias para o funcionamento do projeto.

A aplicação estará disponível em: http://localhost:3000
