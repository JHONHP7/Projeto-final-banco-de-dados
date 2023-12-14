-- Permissões para apenas usar select
CREATE USER Pinho WITH PASSWORD 'Pinho123';
GRANT USAGE ON SCHEMA projeto_final TO Pinho;
GRANT SELECT ON ALL TABLES IN SCHEMA projeto_final TO Pinho;

-- Permissões de leitura
CREATE USER Jhonatan WITH PASSWORD 'Jhon123';
GRANT CONNECT ON DATABASE bd2 TO Jhonatan;
GRANT USAGE ON SCHEMA projeto_final TO Jhonatan;
GRANT SELECT ON ALL TABLES IN SCHEMA projeto_final TO Jhonatan;

--Roberto com permissões de leitura e escrita
CREATE USER Roberto WITH PASSWORD 'BEBETO123';
GRANT CONNECT ON DATABASE bd2 TO Roberto;
GRANT USAGE ON SCHEMA projeto_final TO Roberto;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA projeto_final TO Roberto;

--Gabriel com permissões de administração
CREATE USER Gabriel WITH PASSWORD 'senha_gabriel';
ALTER USER Gabriel WITH SUPERUSER;

--Conceder permissão para acesso a uma view específica apenas
CREATE USER PessoaAleatoria WITH PASSWORD '123456';
GRANT CONNECT ON DATABASE bd2 TO PessoaAleatoria;
GRANT USAGE ON SCHEMA projeto_final TO PessoaAleatoria;
GRANT SELECT ON PROJETO_FINAL.View_todas_as_vitorias TO PessoaAleatoria;

--Verificar os usuários criados
SELECT usename FROM pg_user;



