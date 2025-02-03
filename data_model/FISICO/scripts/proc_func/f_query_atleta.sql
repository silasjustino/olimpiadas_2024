create or replace function "F_QUERY_ATLETA"(p_id number, p_id_bateria number, p_id_delegacao number)
return varchar2
as
    v_id_competicao NUMBER;
    v_fase_bateria NUMBER;
    v_qtd_anteriores NUMBER;
    v_id_fase_anterior NUMBER;
begin
    
    SELECT id_fase, id_competicao
    INTO v_fase_bateria, v_id_competicao
    FROM BATERIA
    WHERE ID = p_id_bateria;

    SELECT count(1)
    INTO v_qtd_anteriores
    FROM BATERIA B
    JOIN COMPETICAO C ON C.ID = B.ID_COMPETICAO
    WHERE C.ID = v_id_competicao
    AND B.ID_FASE < v_fase_bateria;

    IF v_qtd_anteriores > 0 THEN
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
       
        IF p_id IS NULL THEN
            IF v_fase_bateria = 4 THEN
                return 'SELECT DISTINCT A.NOME, A.ID
                        FROM RESULTADO R
                        JOIN BATERIA B ON B.ID = R.ID_BATERIA
                        JOIN COMPETICAO C ON B.ID_COMPETICAO = C.ID
                        JOIN ATLETA_COMPETICAO AC ON AC.ID = R.ID_ATLETA_COMPETICAO
                        JOIN ATLETA A ON AC.ID_ATLETA = A.ID
                        JOIN DELEGACAO D ON A.ID_DELEGACAO = D.ID
                        WHERE D.ID = ' || p_id_delegacao || ' 
                        AND C.ID = ' || v_id_competicao || ' 
                        AND B.ID_FASE = ' || v_id_fase_anterior || ' 
                        AND R.CLASSIFICACAO = ''D''
                        AND A.ID NOT IN (SELECT AC.ID_ATLETA
                                         FROM BATERIA B
                                         JOIN RESULTADO R ON R.ID_BATERIA = B.ID
                                         JOIN ATLETA_COMPETICAO AC ON AC.ID = R.ID_ATLETA_COMPETICAO
                                         WHERE B.ID = ' || p_id_bateria || ')';
            ELSE
                return 'SELECT DISTINCT A.NOME, A.ID
                        FROM RESULTADO R
                        JOIN BATERIA B ON B.ID = R.ID_BATERIA
                        JOIN COMPETICAO C ON B.ID_COMPETICAO = C.ID
                        JOIN ATLETA_COMPETICAO AC ON AC.ID = R.ID_ATLETA_COMPETICAO
                        JOIN ATLETA A ON AC.ID_ATLETA = A.ID
                        JOIN DELEGACAO D ON A.ID_DELEGACAO = D.ID
                        WHERE D.ID = ' || p_id_delegacao || ' 
                        AND C.ID = ' || v_id_competicao || ' 
                        AND B.ID_FASE = ' || v_id_fase_anterior || ' 
                        AND R.CLASSIFICACAO = ''C''
                        AND A.ID NOT IN (SELECT AC.ID_ATLETA
                                         FROM BATERIA B
                                         JOIN RESULTADO R ON R.ID_BATERIA = B.ID
                                         JOIN ATLETA_COMPETICAO AC ON AC.ID = R.ID_ATLETA_COMPETICAO
                                         WHERE B.ID = ' || p_id_bateria || ')';
            END IF;
        ELSE
            IF v_fase_bateria = 4 THEN
                return 'SELECT DISTINCT A.NOME, A.ID
                        FROM RESULTADO R
                        JOIN BATERIA B ON B.ID = R.ID_BATERIA
                        JOIN COMPETICAO C ON B.ID_COMPETICAO = C.ID
                        JOIN ATLETA_COMPETICAO AC ON AC.ID = R.ID_ATLETA_COMPETICAO
                        JOIN ATLETA A ON AC.ID_ATLETA = A.ID
                        JOIN DELEGACAO D ON A.ID_DELEGACAO = D.ID
                        WHERE D.ID = ' || p_id_delegacao || ' 
                        AND C.ID = ' || v_id_competicao || ' 
                        AND B.ID_FASE = ' || v_id_fase_anterior || ' 
                        AND R.CLASSIFICACAO = ''D''';
            ELSE
                return 'SELECT DISTINCT A.NOME, A.ID
                        FROM RESULTADO R
                        JOIN BATERIA B ON B.ID = R.ID_BATERIA
                        JOIN COMPETICAO C ON B.ID_COMPETICAO = C.ID
                        JOIN ATLETA_COMPETICAO AC ON AC.ID = R.ID_ATLETA_COMPETICAO
                        JOIN ATLETA A ON AC.ID_ATLETA = A.ID
                        JOIN DELEGACAO D ON A.ID_DELEGACAO = D.ID
                        WHERE D.ID = ' || p_id_delegacao || ' 
                        AND C.ID = ' || v_id_competicao || ' 
                        AND B.ID_FASE = ' || v_id_fase_anterior || ' 
                        AND R.CLASSIFICACAO = ''C''';
            END IF;
        END IF;
            
    ELSE
        IF p_id IS NULL THEN
            return 'SELECT DISTINCT A.NOME, A.ID
                    FROM BATERIA B
                    JOIN COMPETICAO C ON B.ID_COMPETICAO = C.ID
                    JOIN MODALIDADE M ON C.ID_MODALIDADE = M.ID
                    JOIN ATLETA A ON M.ID_CATEGORIA = A.ID_CATEGORIA
                    JOIN DELEGACAO D ON A.ID_DELEGACAO = D.ID
                    WHERE D.ID = ' || p_id_delegacao || '
                    AND B.ID = ' || p_id_bateria || ' 
                    AND A.ID NOT IN (SELECT AC.ID_ATLETA
                                     FROM BATERIA B
                                     JOIN RESULTADO R ON R.ID_BATERIA = B.ID
                                     JOIN ATLETA_COMPETICAO AC ON AC.ID = R.ID_ATLETA_COMPETICAO
                                     WHERE B.ID = ' || p_id_bateria || ')';
    
        ELSE
            return 'SELECT DISTINCT A.NOME, A.ID
                    FROM BATERIA B
                    JOIN COMPETICAO C ON B.ID_COMPETICAO = C.ID
                    JOIN MODALIDADE M ON C.ID_MODALIDADE = M.ID
                    JOIN ATLETA A ON M.ID_CATEGORIA = A.ID_CATEGORIA
                    JOIN DELEGACAO D ON A.ID_DELEGACAO = D.ID
                    WHERE D.ID = ' || p_id_delegacao || ' 
                    AND B.ID = ' || p_id_bateria;
        END IF;
    END IF;
EXCEPTION WHEN NO_DATA_FOUND THEN
    return 'SELECT A.NOME, A.ID
            FROM BATERIA B
            JOIN COMPETICAO C ON B.ID_COMPETICAO = C.ID
            JOIN MODALIDADE M ON C.ID_MODALIDADE = M.ID
            JOIN ATLETA A ON M.ID_CATEGORIA = A.ID_CATEGORIA
            JOIN DELEGACAO D ON A.ID_DELEGACAO = D.ID
            WHERE D.ID = ' || p_id_delegacao || ' 
            AND B.ID = ' || p_id_bateria;

end "F_QUERY_ATLETA";
/