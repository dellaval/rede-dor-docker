# Use uma imagem base do Node.js
FROM node:18

# Instale o Git para poder clonar o repositório
RUN apt-get update && apt-get install -y git

# Defina o diretório de trabalho no contêiner
WORKDIR /usr/src/app

# Clone o repositório diretamente no diretório de trabalho
RUN git clone https://github.com/dellaval/rede-dor-node.git .

# Copie o arquivo package.json e package-lock.json para instalar as dependências
COPY package*.json ./

# Instale as dependências do projeto
RUN npm install

RUN npm install -g sequelize-cli

RUN if [ ! -f config/config.json ]; then npx sequelize init; fi

# RUN npx sequelize-cli db:migrate

# RUN npx sequelize db:seed:all

# Copie o restante do código da aplicação
COPY . .

# Exponha a porta que o servidor Express está usando
EXPOSE 3000

# Comando para iniciar a aplicação
CMD ["node", "app.js"]