/*
Criado para acelerar "JOIN PROJETO_FINAL.POKEMON_TIME PT ON TT.TIME_ID = PT.TIME_ID" das consultas:
"Listar todos os Pokémon de um determinado treinador e seu respectivo time:", "Listar todos os treinadores que têm um Pokémon específico:", "-- Listar todos os treinadores que possuem um Pokémon de um determinado tipo:", "-- Listar todos os treinadores que possuem um Pokémon de um tipo específico e com nível superior a um determinado valor:", "-- Tipo dominante de Pokémon por time" e "-- Treinador do time e Pokémon mais forte por time".
Também acelera 
"JOIN
    PROJETO_FINAL.TIME T ON TT.TIME_ID = T.TIME_ID" 
de "-- Tipo dominante de Pokémon por time"
já que joins são custosos e nenhuma dessas colunas são primary keys, mas sim foreign keys.
Ainda acelera
"WHERE
    (TT.TIME_ID, P.ATK) IN (
        SELECT
            PT.TIME_ID,
            MAX(P.ATK) AS FORCA_DE_ATAQUE
        FROM
            PROJETO_FINAL.POKEMON_TIME PT
            JOIN PROJETO_FINAL.POKEMON P ON PT.POKEMON_ID = P.POKEMON_ID
        GROUP BY
            PT.TIME_ID
    )"
em "-- Treinador do time e Pokémon mais forte por time"
 Além disso, usou-se hash pelas cláusulas where serem feitas
sobre expressões do tipo exact match
*/

CREATE INDEX treinador_time_time_id ON projeto_final.treinador_time USING hash(time_id);

/*
Criado para acelerar JOIN PROJETO_FINAL.POKEMON_TIME PT ON TT.TIME_ID = PT.TIME_ID das consultas:
"Listar todos os Pokémon de um determinado treinador e seu respectivo time:", "Listar todos os treinadores que têm um Pokémon específico:", "-- Listar todos os treinadores que possuem um Pokémon de um determinado tipo:", "-- Listar todos os treinadores que possuem um Pokémon de um tipo específico e com nível superior a um determinado valor:", "-- Tipo dominante de Pokémon por time" e -- Listar Pokémon de cada time por treinador, "listando seus tipos e nome dos pokemon";
já que joins são custosos e nenhuma dessas colunas são primary keys, mas sim foreign keys. Além disso, usou-se hash pelos joins serem feito
sobre expressões do tipo exact match
*/

CREATE INDEX pokemon_time_time_id ON projeto_final.pokemon_time USING hash(time_id) ;

/*
Criado para acelerar "WHERE T.NOME = 'Kleber';" da consulta "-- Listar todos os Pokémon de um determinado treinador e seu respectivo time:".
O índice foi criado para essa coluna pois ela não é primary key e é usada em uma expressão WHERE. Usou-se
hash pois a expressão é do tipo exact match
Esse índice também acelera a cláusula WHERE da função obter_info_treinador
*/

CREATE INDEX treinador_nome on projeto_final.treinador  USING hash(nome);

/*
Criado para acelerar "WHERE P.NOME = 'golbat';" da consulta "-- Listar todos os treinadores que têm um Pokémon específico:".
O índice foi criado para essa coluna pois ela não é primary key e é usada em uma expressão WHERE. Usou-se
hash pois a expressão é do tipo exact match
*/

CREATE INDEX pokemon_nome on projeto_final.pokemon  USING hash(nome);

/*
Criado para acelerar "WHERE M.NOME = 'Pound';" da consulta "-- Listar todos os Pokémon que aprenderam um movimento específico:".
O índice foi criado para essa coluna pois ela não é primary key e é usada em uma expressão WHERE. Usou-se
hash pois a expressão é do tipo exact match
*/

CREATE INDEX move_nome on projeto_final.move  USING hash(nome);

/*
Criado para acelerar as expressões "WHERE B.GINASIO_ID = 8;" e "JOIN PROJETO_FINAL.GINASIO G ON B.GINASIO_ID = G.GINASIO_ID" das consultas "-- Listar todos os treinadores que participaram de batalhas em um ginásio específico:" e "-- Listando treinadores que nunca batalharam em um ginasio",respectivamente.
O índice foi criado para essa coluna pois ela não é primary key e é foreign key para outra tabela.
Além disso, na primeira consulta é usada em uma expressão WHERE e, na segunda, usada em uma expressão JOIN.
Usou-se hash pois as expressões são do tipo exact match
*/

CREATE INDEX batalha_ginasio_id on projeto_final.batalha USING hash(ginasio_id);

/*
Criado para acelerar as expressões

"WHERE B.VENCEDOR_ID = T.TREINADOR_ID 
    AND T.REGIAO_ID = (SELECT REGIAO_ID FROM PROJETO_FINAL.REGIAO WHERE NOME = 'Kanto');"

e

"PROJETO_FINAL.REGIAO R ON T2.REGIAO_ID = R.REGIAO_ID"

das consultas "-- Listar todos os treinadores que venceram batalhas em uma determinada região:" e "-- Listar todos os treinadores que têm uma bolsa de determinada cor, pertencem a uma região específica e têm uma faixa etária específica:", respectivamente.
O índice foi criado para essa coluna pois ela não é primary key, é foreign key para a tabela regiao.
Na primeira, o motivo para a criação é que a coluna é usada em uma expressão WHERE e usou-se hash pois a expressão é do tipo exact match.
Na segunda, é a coluna ser usada em um join, operação custosa. A expressão também é do tipo exact match, então hash é adequado.

Esse índice também acelera o join da função obter_info_treinador e obter_info_treinador, onde o hash também é o melhor tipo de índice pelo join ser feito sobre um exact match.
*/

CREATE INDEX treinador_regiao_id ON projeto_final.treinador USING hash(regiao_id);

/*
Criado para acelerar expressões das consultas "(SELECT REGIAO_ID FROM PROJETO_FINAL.REGIAO WHERE NOME = 'Kanto');" e 
"WHERE
    B.COR = 'Laranja'
    AND R.NOME = 'Kanto'
    AND T.IDADE BETWEEN 20 AND 30;"
das consultas "-- Listar todos os treinadores que venceram batalhas em uma determinada região:" e "-- Listar todos os treinadores que têm uma bolsa de determinada cor, pertencem a uma região específica e têm uma faixa etária específica:".
O índice foi criado para essa coluna pois ela não é primary key e é usada em expressões WHERE. Usou-se hash pois as expressões são do tipo exact match.
*/

CREATE INDEX regiao_nome ON projeto_final.regiao USING hash(nome);

/*
Criado para acelerar "PROJETO_FINAL.BOLSA B ON TB.BOLSA_ID = B.BOLSA_ID e "JOIN PROJETO_FINAL.TREINADOR_BOLSA TB ON B.BOLSA_ID = TB.BOLSA_ID"
das consultas "-- Listar todos os treinadores que têm uma bolsa de determinada cor, pertencem a uma região específica e têm uma faixa etária específica:", "-- Listar todos os treinadores que possuem um item de um tipo específico em suas bolsas:" e "-- Consulta para ver quantas bolsas possui tal item buscando por nome e mostre o nome dos treinadores".
O índice foi criado para essa coluna pois ela não é primary key, é foreign key para bolsa e é usada em uma expressão JOIN. Usou-se hash pois a expressão é do tipo exact match.
*/

CREATE INDEX treinador_bolsa_bolsa_id ON projeto_final.treinador_bolsa USING hash(bolsa_id);

/*
Criado para acelerar "B.COR = 'Laranja'"
da consulta "-- Listar todos os treinadores que têm uma bolsa de determinada cor, pertencem a uma região específica e têm uma faixa etária específica:".
O índice foi criado para essa coluna pois ela não é primary key e é usada em uma expressão WHERE. Usou-se hash pois a expressão é do tipo exact match.
*/

CREATE INDEX bolsa_cor ON projeto_final.bolsa USING hash(cor);

/*
Criado para acelerar 
"WHERE
    B.COR = 'Laranja'
    AND R.NOME = 'Kanto'
    AND T.IDADE BETWEEN 20 AND 30;"
da consulta "-- Listar todos os treinadores que têm uma bolsa de determinada cor, pertencem a uma região específica e têm uma faixa etária específica:" e
"WHERE
    B.DATA BETWEEN CURRENT_DATE - INTERVAL '15 months' AND CURRENT_DATE
    AND T.IDADE > 18;"
da consulta "-- Treinadores que participaram de batalhas nos últimos 15 meses e que são maiores de 18 anos".
O índice foi criado para essa coluna pois ela não é primary key e é usada em uma expressão WHERE. Usou-se btree pois as expressão são feitas em busca de valores dentro de um intervalo.
*/

CREATE INDEX treinador_idade ON projeto_final.treinador USING btree(idade);

/*
Criado para acelerar "JOIN PROJETO_FINAL.ITEM I ON B.BOLSA_ID = I.BOLSA_ID" e "JOIN PROJETO_FINAL.BOLSA B ON I.BOLSA_ID = B.BOLSA_ID"
das consultas "-- Listar todos os treinadores que possuem um item de um tipo específico em suas bolsas:" e "-- Consulta para ver quantas bolsas possui tal item buscando por nome e mostre o nome dos treinadores".
O índice foi criado para essa coluna pois ela não é primary key, é foreign key para a tabela bolsa e é usada em uma expressão JOIN. Usou-se hash pois a expressão é do tipo exact match.
*/

CREATE INDEX item_bolsa_id ON projeto_final.item USING hash(bolsa_id);

/*
Criado para acelerar "WHERE I.TIPO_ITEM = 'evolution';"
da consulta "-- Listar todos os treinadores que possuem um item de um tipo específico em suas bolsas:".
O índice foi criado para essa coluna pois ela não é primary key e é usada em uma expressão WHERE. Usou-se hash pois a expressão é do tipo exact match.
*/

CREATE INDEX item_tipo_item ON projeto_final.item  USING hash(tipo_item);

/*
Criado para acelerar "WHERE TP.NOME_TIPO = 'Normal';" e "WHERE TP.NOME_TIPO = 'Normal' AND P.LVL > 90;"
das consultas "-- Listar todos os treinadores que possuem um Pokémon de um determinado tipo:" e "-- Listar todos os treinadores que possuem um Pokémon de um tipo específico e com nível superior a um determinado valor:".
O índice foi criado para essa coluna pois ela não é primary key e é usada em expressões WHERE. Usou-se hash pois a expressão é do tipo exact match.
*/

CREATE INDEX tipo_pokemon ON projeto_final.tipo_pokemon USING hash(nome_tipo);

/*
Criado para acelerar "WHERE TP.NOME_TIPO = 'Normal' AND P.LVL > 90;" na consulta "-- Listar todos os treinadores que possuem um Pokémon de um tipo específico e com nível superior a um determinado valor:".
O índice foi criado para essa coluna pois ela não é primary key e é usada em expressões WHERE. Usou-se btree pois a expressão é feita sobre uma comparação com um intervalo de valores.
*/

CREATE INDEX pokemon_lvl ON projeto_final.pokemon USING btree(lvl);

/*
Criado para acelerar "WHERE I.NOME = 'rare-candy" na consulta "-- Consulta para ver quantas bolsas possui tal item buscando por nome e mostre o nome dos treinadores".
O índice foi criado para essa coluna pois ela não é primary key e é usada em uma expressão WHERE. Usou-se hash pois a expressão é do tipo exact match"
*/

CREATE INDEX item_nome ON projeto_final.item USING hash(nome);

/*
Criado para acelerar "G.NOME = 'Ginásio Elétrico'" na consulta "-- Listagem de ganhadores por determinado ginásio".
O índice foi criado para essa coluna pois ela não é primary key e é usada em uma expressão WHERE. Usou-se hash pois a expressão é do tipo exact match"
*/

CREATE INDEX ginasio_nome ON projeto_final.ginasio USING hash (nome);

/*
Criado para acelerar "WHERE
    B.DATA BETWEEN CURRENT_DATE - INTERVAL '15 months' AND CURRENT_DATE
    AND T.IDADE > 18;" 
na consulta "-- Treinadores que participaram de batalhas nos últimos 15 meses e que são maiores de 18 anos".
O índice foi criado para essa coluna pois ela não é primary key e é usada em uma expressão WHERE. Usou-se btree pois a expressão é feita sobre uma comparação com um intervalo de valores.
*/

CREATE INDEX batalha_data ON projeto_final.batalha USING btree(data);

/*
Criado para acelerar 
"WHERE
    (TT.TIME_ID, P.ATK) IN (
        SELECT
            PT.TIME_ID,
            MAX(P.ATK) AS FORCA_DE_ATAQUE
        FROM
            PROJETO_FINAL.POKEMON_TIME PT
            JOIN PROJETO_FINAL.POKEMON P ON PT.POKEMON_ID = P.POKEMON_ID
        GROUP BY
            PT.TIME_ID
)"
na consulta "-- Treinador do time e Pokémon mais forte por time".
O índice foi criado para essa coluna pois ela não é a primary key e é usada em uma expressão WHERE. Usou-se hash pois a expressão é do tipo exact match.
*/

CREATE INDEX pokemon_atk ON projeto_final.pokemon USING hash(atk);