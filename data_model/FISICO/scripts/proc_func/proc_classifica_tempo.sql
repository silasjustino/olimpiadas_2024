create or replace PROCEDURE PROC_CLASSIFICACAO_TEMPO (p_id_bateria NUMBER, p_qtd_classificados NUMBER) AS
BEGIN

    FOR cur IN (SELECT ROWNUM, ID FROM
                    (SELECT R.ID
                     FROM RESULTADO R
                     WHERE ID_BATERIA = p_id_bateria ORDER BY TEMPO ASC)  
    ) LOOP
        UPDATE RESULTADO
        SET COLOCACAO = cur.ROWNUM
        WHERE ID = cur.ID;

        IF cur.ROWNUM <= p_qtd_classificados THEN
            UPDATE RESULTADO
            SET CLASSIFICACAO = 'C'
            WHERE ID = cur.ID;
        ELSE
            UPDATE RESULTADO
            SET CLASSIFICACAO = 'D'
            WHERE ID = cur.ID;
        END IF;
    END LOOP;

END PROC_CLASSIFICACAO_TEMPO;
/