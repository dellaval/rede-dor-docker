# Use uma imagem PHP com Apache
FROM php:8.1-apache

# Instale o Git e o Composer
RUN apt-get update && apt-get install -y git && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN a2enmod rewrite

# Defina o diretório de trabalho para o Apache
WORKDIR /var/www/html

# Definir permissões para o diretório
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

RUN git config --global --add safe.directory /var/www/html

# Clone o repositório (substitua pela URL do repositório)
RUN git clone https://github.com/dellaval/rede-dor-php.git /var/www/html

# Instale as dependências do Composer
RUN composer install

# Configurar o Apache para permitir o uso de .htaccess
RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf


# Exponha a porta 80
EXPOSE 80
