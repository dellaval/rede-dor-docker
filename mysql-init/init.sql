-- ALTER USER 'root'@'%' IDENTIFIED BY '123123';

-- Criação de um novo usuário
CREATE USER 'rededor'@'%' IDENTIFIED BY '123123';

-- Conceder permissões para criar bancos de dados e acessar externamente
GRANT ALL PRIVILEGES ON *.* TO 'rededor'@'%' WITH GRANT OPTION;

-- Aplica as mudanças de permissão
FLUSH PRIVILEGES;