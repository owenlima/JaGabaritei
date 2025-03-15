# Usando Ruby 2.6.10 baseado no Debian Buster
FROM ruby:2.6.10

# Definir diretório de trabalho
WORKDIR /app

# Atualizar pacotes e instalar dependências do sistema
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    build-essential \
    libsqlite3-dev \
    nodejs \
    yarn \
    redis-server \
    shared-mime-info && \
    rm -rf /var/lib/apt/lists/*

# Instalar Bundler
RUN gem install bundler -v 2.2.33

# Copiar arquivos do projeto
COPY Gemfile Gemfile.lock /app/

# Instalar dependências problemáticas primeiro
RUN gem install nokogiri -v 1.8.5 && gem install rake -v 12.3.1

# Instalar Node.js 20 LTS
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g corepack && \
    corepack enable && \
    rm -rf /usr/bin/yarn /usr/bin/yarnpkg && \
    npm install -g yarn

# Instalar as gems do projeto com `--full-index` para evitar problemas com mimemagic
RUN bundle install --jobs 4 --retry 3

# Copiar código do projeto
COPY . /app

# Expor porta padrão do Rails
EXPOSE 3000

# Comando para iniciar o servidor
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
