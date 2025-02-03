DECLARE
    v_id_competicao NUMBER;
    v_fase_bateria NUMBER;
    v_qtd_anteriores NUMBER;
    v_id_fase_anterior NUMBER;
BEGIN
    SELECT id_fase, id_competicao
    INTO v_fase_bateria, v_id_competicao
    FROM BATERIA
    WHERE ID = :P23_ID_BATERIA;

    SELECT count(1)
    INTO v_qtd_anteriores
    FROM BATERIA B
    JOIN COMPETICAO C ON C.ID = B.ID_COMPETICAO
    WHERE C.ID = v_id_competicao
    AND B.ID_FASE < v_fase_bateria;

    IF v_qtd_anteriores > 0 THEN
        SELECT max(b.id_fase)
        INTO v_id_fase_anterior
        FROM BATERIA B
        JOIN COMPETICAO C ON B.ID_COMPETICAO = C.ID
        WHERE C.ID = v_id_competicao
        AND b.id_fase < v_fase_bateria;
       
        IF :P23_ID IS NULL THEN
            return 'SELECT A.NOME, A.ID
                    FROM BATERIA B
                    JOIN COMPETICAO C ON B.ID_COMPETICAO = C.ID
                    JOIN MODALIDADE M ON C.ID_MODALIDADE = M.ID
                    JOIN RESULTADO R ON R.ID_BATERIA = B.ID
                    JOIN ATLETA_COMPETICAO AC ON AC.ID = B.ID_ATLETA_COMPETICAO
                    JOIN ATLETA A ON M.ID_CATEGORIA = A.ID_CATEGORIA AND A.ID = AC.ID_ATLETA
                    JOIN DELEGACAO D ON A.ID_DELEGACAO = D.ID
                    WHERE D.ID = :P23_DELEGACAO
                    AND C.ID = ' || v_id_competicao || ' 
                    AND B.ID_FASE = ' || v_id_fase_anterior || ' 
                    AND R.CLASSIFICACAO IS NOT NULL
                    AND A.ID NOT IN (SELECT AC.ID_ATLETA
                                     FROM BATERIA B
                                     JOIN RESULTADO R ON R.ID_BATERIA = B.ID
                                     JOIN ATLETA_COMPETICAO AC ON AC.ID = R.ID_ATLETA_COMPETICAO
                                     WHERE B.ID = :P23_ID_BATERIA)';
        ELSE
            return 'SELECT A.NOME, A.ID
                    FROM BATERIA B
                    JOIN COMPETICAO C ON B.ID_COMPETICAO = C.ID
                    JOIN MODALIDADE M ON C.ID_MODALIDADE = M.ID
                    JOIN RESULTADO R ON R.ID_BATERIA = B.ID
                    JOIN ATLETA_COMPETICAO AC ON AC.ID = B.ID_ATLETA_COMPETICAO
                    JOIN ATLETA A ON M.ID_CATEGORIA = A.ID_CATEGORIA AND A.ID = AC.ID_ATLETA
                    JOIN DELEGACAO D ON A.ID_DELEGACAO = D.ID
                    WHERE D.ID = :P23_DELEGACAO
                    AND C.ID = ' || v_id_competicao || ' 
                    AND B.ID_FASE = ' || v_id_fase_anterior || ' 
                    AND R.CLASSIFICACAO IS NOT NULL';
        END IF;
            
    ELSE
        IF :P23_ID IS NULL THEN
            return 'SELECT A.NOME, A.ID
                    FROM BATERIA B
                    JOIN COMPETICAO C ON B.ID_COMPETICAO = C.ID
                    JOIN MODALIDADE M ON C.ID_MODALIDADE = M.ID
                    JOIN ATLETA A ON M.ID_CATEGORIA = A.ID_CATEGORIA
                    JOIN DELEGACAO D ON A.ID_DELEGACAO = D.ID
                    WHERE D.ID = :P23_DELEGACAO
                    AND B.ID = :P23_ID_BATERIA
                    AND A.ID NOT IN (SELECT AC.ID_ATLETA
                                     FROM BATERIA B
                                     JOIN RESULTADO R ON R.ID_BATERIA = B.ID
                                     JOIN ATLETA_COMPETICAO AC ON AC.ID = R.ID_ATLETA_COMPETICAO
                                     WHERE B.ID = :P23_ID_BATERIA)';
        ELSE
            return 'SELECT A.NOME, A.ID
                    FROM BATERIA B
                    JOIN COMPETICAO C ON B.ID_COMPETICAO = C.ID
                    JOIN MODALIDADE M ON C.ID_MODALIDADE = M.ID
                    JOIN ATLETA A ON M.ID_CATEGORIA = A.ID_CATEGORIA
                    JOIN DELEGACAO D ON A.ID_DELEGACAO = D.ID
                    WHERE D.ID = :P23_DELEGACAO
                    AND B.ID = :P23_ID_BATERIA';
        END IF;
    END IF;
EXCEPTION WHEN NO_DATA_FOUND THEN
    return 'SELECT A.NOME, A.ID
            FROM BATERIA B
            JOIN COMPETICAO C ON B.ID_COMPETICAO = C.ID
            JOIN MODALIDADE M ON C.ID_MODALIDADE = M.ID
            JOIN ATLETA A ON M.ID_CATEGORIA = A.ID_CATEGORIA
            JOIN DELEGACAO D ON A.ID_DELEGACAO = D.ID
            WHERE D.ID = :P23_DELEGACAO
            AND B.ID = :P23_ID_BATERIA';
END;
