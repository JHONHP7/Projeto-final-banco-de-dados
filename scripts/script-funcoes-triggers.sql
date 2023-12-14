													--FUNÇÕES
-- FUNÇÃO PARA INSERIR POKEMON EM UM TIME
CREATE OR REPLACE FUNCTION inserir_pokemon_no_time(pokemon_id INT, time_id INT)
RETURNS VOID AS $$
BEGIN
    INSERT INTO PROJETO_FINAL.POKEMON_TIME (POKEMON_ID, TIME_ID)
    VALUES (pokemon_id, time_id);
END;
$$ LANGUAGE plpgsql;

-- FUNÇÃO PARA ESCOLHER UM POKEMON POR NOME E RETORNAR TODOS OS POKEMONS DO MESMO TIPO
CREATE OR REPLACE FUNCTION encontrar_pokemon_por_tipo(pokemon_nome VARCHAR)
RETURNS TABLE (
    pokemon_id INT,
    nome VARCHAR,
    tipo_pokemon VARCHAR
)
AS $$
BEGIN
    RETURN QUERY
    SELECT
        P2.POKEMON_ID,
        P2.NOME,
        TP.NOME_TIPO
    FROM
        PROJETO_FINAL.POKEMON P1
    JOIN
        PROJETO_FINAL.POKEMON_TIPO_POKEMON PTP1 ON P1.POKEMON_ID = PTP1.POKEMON_ID
    JOIN
        PROJETO_FINAL.TIPO_POKEMON TP ON PTP1.TIPO_POKEMON_ID = TP.TIPO_POKEMON_ID
    JOIN
        PROJETO_FINAL.POKEMON_TIPO_POKEMON PTP2 ON TP.TIPO_POKEMON_ID = PTP2.TIPO_POKEMON_ID
    JOIN
        PROJETO_FINAL.POKEMON P2 ON PTP2.POKEMON_ID = P2.POKEMON_ID
    WHERE
        P1.NOME = pokemon_nome;
END;
$$ LANGUAGE plpgsql;

													--TRIGGERS

-- FUNÇÃO LIMITAR PRECISÃO
CREATE OR REPLACE FUNCTION limitar_precisao_move()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.precisao < 10 THEN
        NEW.precisao := 10;
    ELSIF NEW.precisao > 100 THEN
        NEW.precisao := 100;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- TRIGGER LIMITAR PRECISÃO
CREATE TRIGGER move_before_insert_update
BEFORE INSERT OR UPDATE ON projeto_final.move
FOR EACH ROW
EXECUTE FUNCTION limitar_precisao_move();

-- FUNÇÃO LIMITAR LVL
CREATE OR REPLACE FUNCTION limitar_lvl_pokemon()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.lvl < 1 THEN
        NEW.lvl := 1;
    ELSIF NEW.lvl > 100 THEN
        NEW.lvl := 100;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- TRIGGER LIMITAR LVL
CREATE TRIGGER pokemon_before_insert_update
BEFORE INSERT OR UPDATE ON projeto_final.pokemon
FOR EACH ROW
EXECUTE FUNCTION limitar_lvl_pokemon();


-- LIMITAR 2 TREINADORES POR BATALHA
CREATE OR REPLACE FUNCTION verificar_limite_treinadores()
RETURNS TRIGGER AS $$
BEGIN
    IF (SELECT COUNT(*) FROM PROJETO_FINAL.TREINADOR_BATALHA WHERE BATALHA_ID = NEW.BATALHA_ID) >= 2 THEN
        RAISE EXCEPTION 'Não é permitido mais de dois treinadores por batalha';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
-- TRIGGER LIMITAR TREINADORES POR BATALHA
CREATE TRIGGER trigger_verificar_limite_treinadores
BEFORE INSERT ON PROJETO_FINAL.TREINADOR_BATALHA
FOR EACH ROW
EXECUTE FUNCTION verificar_limite_treinadores();

-- JOGADOR VENCEDOR DA PARTIDA SÓ PODE SER UM PARTICIPANTE DA PARTIDA EM QUESTÃO
CREATE OR REPLACE FUNCTION verificar_vencedor_batalha()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.vencedor_id IS NOT NULL AND 
       NOT EXISTS (
            SELECT 1
            FROM PROJETO_FINAL.TREINADOR_BATALHA TB
            WHERE TB.BATALHA_ID = NEW.batalha_id
              AND TB.TREINADOR_ID = NEW.vencedor_id
       ) THEN
        RAISE EXCEPTION 'O vencedor não faz parte dos treinadores que estão em batalha';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- TRIGGER PARA 
CREATE TRIGGER verificar_vencedor_batalha_trigger
BEFORE UPDATE ON PROJETO_FINAL.BATALHA
FOR EACH ROW
EXECUTE FUNCTION verificar_vencedor_batalha();

--FUNÇÃO PARA LIMITAR O NUMERO DE POKEMON POR TIME
CREATE OR REPLACE FUNCTION limitar_quantidade_pokemon_no_time()
RETURNS TRIGGER AS $$
DECLARE
    quantidade_pokemon INT;
BEGIN
    SELECT COUNT(*) INTO quantidade_pokemon
    FROM PROJETO_FINAL.POKEMON_TIME
    WHERE TIME_ID = NEW.TIME_ID;

    IF quantidade_pokemon >= 6 THEN
        RAISE EXCEPTION 'Não é permitido ter mais de 6 Pokémon em um time.';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER limitar_quantidade_pokemon
BEFORE INSERT ON PROJETO_FINAL.POKEMON_TIME
FOR EACH ROW
EXECUTE FUNCTION limitar_quantidade_pokemon_no_time();

-- TRIGGER PARA PROIBIR ASSOCIAR UM POKEMON A MAIS DE UM TIME
CREATE OR REPLACE FUNCTION proibir_associacao_pokemon_time()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM PROJETO_FINAL.POKEMON_TIME
        WHERE POKEMON_ID = NEW.POKEMON_ID AND TIME_ID IS NOT NULL
    ) THEN
        RAISE EXCEPTION 'Este Pokémon já está associado a um time.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_proibir_associacao_pokemon_time
BEFORE INSERT OR UPDATE
ON PROJETO_FINAL.POKEMON_TIME
FOR EACH ROW
EXECUTE FUNCTION proibir_associacao_pokemon_time();


-- VERIFICAR TIME DUPLO POR TREINADOR
CREATE OR REPLACE FUNCTION verificar_time_duplicado()
RETURNS TRIGGER AS $$
DECLARE
    qtd_times INT;
BEGIN
    SELECT COUNT(*)
    INTO qtd_times
    FROM PROJETO_FINAL.TREINADOR_TIME
    WHERE TIME_ID = NEW.TIME_ID;
    IF qtd_times > 0 THEN
        RAISE EXCEPTION 'Este time já está sendo usado por outro treinador.';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_insert_update_treinador_time
BEFORE INSERT OR UPDATE ON PROJETO_FINAL.TREINADOR_TIME
FOR EACH ROW
EXECUTE FUNCTION verificar_time_duplicado();


--                                  				Stored Procedure
--Atualizar a idade de um treinador
CREATE OR REPLACE PROCEDURE atualizar_idade_treinador(
    p_treinador_id INT,
    p_nova_idade INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE PROJETO_FINAL.TREINADOR
    SET IDADE = p_nova_idade
    WHERE TREINADOR_ID = p_treinador_id;
END;
$$;

-- Stored Procedure para obter Informações de um treinador pelo id
CREATE OR REPLACE PROCEDURE obter_info_treinador(
    p_treinador_id INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_nome VARCHAR(100);
    v_regiao VARCHAR(100);
BEGIN
    SELECT T.NOME, R.NOME
    INTO v_nome, v_regiao
    FROM PROJETO_FINAL.TREINADOR T
    JOIN PROJETO_FINAL.REGIAO R ON T.REGIAO_ID = R.REGIAO_ID
    WHERE T.TREINADOR_ID = p_treinador_id;

    RAISE NOTICE 'Nome: %, Região: %', v_nome, v_regiao;
END;
$$;

-- Stored Procedure para obter Informações de um treinador pelo nome
CREATE OR REPLACE PROCEDURE obter_info_treinador_por_nome(
    p_nome VARCHAR(100)
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_nome VARCHAR(100);
    v_regiao VARCHAR(100);
BEGIN
    SELECT T.NOME, R.NOME
    INTO v_nome, v_regiao
    FROM PROJETO_FINAL.TREINADOR T
    JOIN PROJETO_FINAL.REGIAO R ON T.REGIAO_ID = R.REGIAO_ID
    WHERE T.NOME = p_nome;

    RAISE NOTICE 'Nome: %, Região: %', v_nome, v_regiao;
END;
$$;

--													VIEWS

CREATE VIEW PROJETO_FINAL.VIEW_ALL_POKEMONS AS
SELECT
    P.POKEMON_ID,
    P.NOME,
    P.LVL,
    P.ATK,
    P.DEF,
    P.SP_DEF,
    P.SP_ATK,
    P.VEL,
    P.HP,
    PD.DESCRICAO AS POKEDEX_DESCRICAO,
    TP.NOME_TIPO
FROM
    PROJETO_FINAL.POKEMON P
JOIN
    PROJETO_FINAL.POKEDEX PD ON P.POKEDEX_ID = PD.POKEDEX_ID
JOIN
    PROJETO_FINAL.POKEMON_TIPO_POKEMON PTP ON P.POKEMON_ID = PTP.POKEMON_ID
JOIN
    PROJETO_FINAL.TIPO_POKEMON TP ON PTP.TIPO_POKEMON_ID = TP.TIPO_POKEMON_ID;
	

-- View para ver todas as vitórias
CREATE VIEW PROJETO_FINAL.View_todas_as_vitorias AS
SELECT
    t.NOME AS TREINADOR_NOME,
    g.NOME AS GINASIO_NOME,
    b.DATA AS DATA_BATALHA
FROM
    PROJETO_FINAL.TREINADOR t
LEFT JOIN
    PROJETO_FINAL.TREINADOR_BATALHA tb ON t.TREINADOR_ID = tb.TREINADOR_ID
LEFT JOIN
    PROJETO_FINAL.BATALHA b ON tb.BATALHA_ID = b.BATALHA_ID
LEFT JOIN
    PROJETO_FINAL.GINASIO g ON b.GINASIO_ID = g.GINASIO_ID
WHERE
    tb.TREINADOR_ID = b.VENCEDOR_ID;
	
	
-- View média de atributo pelos tipos
CREATE VIEW PROJETO_FINAL.View_Media_Atributos_Tipo_Pokemon AS
SELECT
    tp.NOME_TIPO,
    ROUND(AVG(p.HP), 0) AS MEDIA_HP,
    ROUND(AVG(p.ATK), 0) AS MEDIA_ATK,
    ROUND(AVG(p.DEF), 0) AS MEDIA_DEF,
    ROUND(AVG(p.SP_DEF), 0) AS MEDIA_SP_DEF,
    ROUND(AVG(p.SP_ATK), 0) AS MEDIA_SP_ATK,
    ROUND(AVG(p.VEL), 0) AS MEDIA_VEL
FROM
    PROJETO_FINAL.POKEMON p
JOIN
    PROJETO_FINAL.POKEMON_TIPO_POKEMON ptp ON p.POKEMON_ID = ptp.POKEMON_ID
JOIN
    PROJETO_FINAL.TIPO_POKEMON tp ON ptp.TIPO_POKEMON_ID = tp.TIPO_POKEMON_ID
GROUP BY
    tp.NOME_TIPO;