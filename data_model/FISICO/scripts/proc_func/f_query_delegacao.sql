create or replace function "F_QUERY_DELEGACAO"(p_id_bateria number, p_id_delegacao number)
return varchar2
as
    v_eh_individual NUMBER;
    v_id_competicao NUMBER;
    v_fase_bateria NUMBER;
    v_qtd_anteriores NUMBER;
    v_id_fase_anterior NUMBER;
begin
    -- Verifica se bateria é individual ou em equipe
    SELECT count(1)
    INTO v_eh_individual
    FROM BATERIA B
    JOIN COMPETICAO C ON B.ID_COMPETICAO = C.ID
    JOIN MODALIDADE M ON C.ID_MODALIDADE = M.ID
    WHERE B.ID = p_id_bateria
    AND PARTICIPACAO = 'I';

    -- Verifica fase da bateria atual
    SELECT id_fase, id_competicao
    INTO v_fase_bateria, v_id_competicao
    FROM BATERIA
    WHERE ID = p_id_bateria;

    --Verifica se existem baterias dessa competição com fase anterior
    SELECT count(1)
    INTO v_qtd_anteriores
    FROM BATERIA B
    JOIN COMPETICAO C ON C.ID = B.ID_COMPETICAO
    WHERE C.ID = v_id_competicao
    AND B.ID_FASE < v_fase_bateria;

    -- Se existem baterias com fases anteriores
    IF v_qtd_anteriores > 0 THEN
        -- Recupera fase anterior mais recente
        IF v_fase_bateria = 5 THEN
            SELECT max(b.id_fase)
            INTO v_id_fase_anterior
            FROM BATERIA B
            JOIN COMPETICAO C ON B.ID_COMPETICAO = C.ID
            WHERE C.ID = v_id_competicao
            AND b.id_fase < v_fase_bateria
            AND b.id_fase != 4;
        ELSE
            SELECT max(b.id_fase)
            INTO v_id_fase_anterior
            FROM BATERIA B
            JOIN COMPETICAO C ON B.ID_COMPETICAO = C.ID
            WHERE C.ID = v_id_competicao
            AND b.id_fase < v_fase_bateria;
        END IF;

        -- Recupera delegações das baterias dessa fase que foram classificadas

        IF v_eh_individual > 0 THEN
            IF v_fase_bateria = 4 THEN
                return 'SELECT DISTINCT D.PAIS, D.ID
                        FROM COMPETICAO C
                        JOIN BATERIA B ON C.ID = B.ID_COMPETICAO
                        JOIN RESULTADO R ON R.ID_BATERIA = B.ID
                        JOIN ATLETA_COMPETICAO AC ON AC.ID = R.ID_ATLETA_COMPETICAO
                        JOIN ATLETA A ON A.ID = AC.ID_ATLETA
                        JOIN DELEGACAO D ON D.ID = A.ID_DELEGACAO
                        WHERE C.ID = ' || v_id_competicao || '
                         AND B.ID_FASE = ' || v_id_fase_anterior || ' 
                        AND R.CLASSIFICACAO = ''D''';
            ELSE
                return 'SELECT DISTINCT D.PAIS, D.ID
                        FROM COMPETICAO C
                        JOIN BATERIA B ON C.ID = B.ID_COMPETICAO
                        JOIN RESULTADO R ON R.ID_BATERIA = B.ID
                        JOIN ATLETA_COMPETICAO AC ON AC.ID = R.ID_ATLETA_COMPETICAO
                        JOIN ATLETA A ON A.ID = AC.ID_ATLETA
                        JOIN DELEGACAO D ON D.ID = A.ID_DELEGACAO
                        WHERE C.ID = ' || v_id_competicao || '
                         AND B.ID_FASE = ' || v_id_fase_anterior || ' 
                        AND R.CLASSIFICACAO = ''C''';
            END IF;
        ELSE
            IF p_id_delegacao IS NULL THEN
                IF v_fase_bateria = 4 THEN
                    return 'SELECT DISTINCT D.PAIS, D.ID
                            FROM COMPETICAO C
                            JOIN BATERIA B ON C.ID = B.ID_COMPETICAO
                            JOIN RESULTADO R ON R.ID_BATERIA = B.ID
                            JOIN DELEGACAO D ON D.ID = R.ID_DELEGACAO
                            WHERE C.ID = ' || v_id_competicao || '
                             AND B.ID_FASE = ' || v_id_fase_anterior || ' 
                            AND R.CLASSIFICACAO = ''D''
                            AND D.ID NOT IN (SELECT ID_DELEGACAO
                                               FROM RESULTADO R
                                               WHERE ID_BATERIA = ' || p_id_bateria || ')';
                ELSE
                    return 'SELECT DISTINCT D.PAIS, D.ID
                            FROM COMPETICAO C
                            JOIN BATERIA B ON C.ID = B.ID_COMPETICAO
                            JOIN RESULTADO R ON R.ID_BATERIA = B.ID
                            JOIN DELEGACAO D ON D.ID = R.ID_DELEGACAO
                            WHERE C.ID = ' || v_id_competicao || '
                             AND B.ID_FASE = ' || v_id_fase_anterior || ' 
                            AND R.CLASSIFICACAO = ''C''
                            AND D.ID NOT IN (SELECT ID_DELEGACAO
                                               FROM RESULTADO R
                                               WHERE ID_BATERIA = ' || p_id_bateria || ')';
                END IF;
            ELSE
                IF v_fase_bateria = 4 THEN
                    return 'SELECT DISTINCT D.PAIS, D.ID
                            FROM COMPETICAO C
                            JOIN BATERIA B ON C.ID = B.ID_COMPETICAO
                            JOIN RESULTADO R ON R.ID_BATERIA = B.ID
                            JOIN DELEGACAO D ON D.ID = R.ID_DELEGACAO
                            WHERE C.ID = ' || v_id_competicao || '
                             AND B.ID_FASE = ' || v_id_fase_anterior || ' 
                            AND R.CLASSIFICACAO = ''D''';
                ELSE
                    return 'SELECT DISTINCT D.PAIS, D.ID
                            FROM COMPETICAO C
                            JOIN BATERIA B ON C.ID = B.ID_COMPETICAO
                            JOIN RESULTADO R ON R.ID_BATERIA = B.ID
                            JOIN DELEGACAO D ON D.ID = R.ID_DELEGACAO
                            WHERE C.ID = ' || v_id_competicao || '
                             AND B.ID_FASE = ' || v_id_fase_anterior || ' 
                            AND R.CLASSIFICACAO = ''C''';
                END IF;
            END IF;
            
        END IF;
    -- Se não existem baterias com fases anteriores
    ELSE
        IF p_id_delegacao IS NULL AND v_eh_individual = 0 THEN
            return 'SELECT D.PAIS, D.ID
                    FROM DELEGACAO D
                    WHERE D.ID NOT IN (SELECT ID_DELEGACAO
                                       FROM RESULTADO R
                                       WHERE ID_BATERIA = ' || p_id_bateria || ')';
        ELSE
            return 'SELECT D.PAIS, D.ID
                    FROM DELEGACAO D';
        END IF;
    END IF;
EXCEPTION WHEN NO_DATA_FOUND THEN
    return 'SELECT PAIS, ID
            FROM DELEGACAO';
end "F_QUERY_DELEGACAO";
/