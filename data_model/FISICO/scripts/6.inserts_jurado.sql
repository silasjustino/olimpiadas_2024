DECLARE
    type array_n is varray(25) of number;
    array_documentos array_n := array_n();
    v_num_certificacao number;
    v_qtd_iguais_jurado number := -1;
BEGIN

    FOR cur in 1..25 LOOP

        v_num_certificacao := ROUND(DBMS_RANDOM.VALUE(100000000, 999999999));

        SELECT count(*)
        INTO v_qtd_iguais_jurado
        FROM ATLETA
        WHERE NUM_DOCUMENTO = v_num_certificacao;

        WHILE v_qtd_iguais_jurado > 0  LOOP

            v_num_certificacao := ROUND(DBMS_RANDOM.VALUE(100000000, 999999999));

            SELECT count(*)
            INTO v_qtd_iguais_jurado
            FROM ATLETA
            WHERE NUM_DOCUMENTO = v_num_certificacao;

        END LOOP; 

        array_documentos.EXTEND;
        array_documentos(cur) := v_num_certificacao;

    END LOOP;

    INSERT INTO JURADO (NOME, NUM_CERTIFICACAO, ID_CATEGORIA)
    VALUES ('Juliano Martins', array_documentos(1), 1);

    INSERT INTO JURADO (NOME, NUM_CERTIFICACAO, ID_CATEGORIA)
    VALUES ('Mariana Alves', array_documentos(2), 2);

    INSERT INTO JURADO (NOME, NUM_CERTIFICACAO, ID_CATEGORIA)
    VALUES ('Ricardo Santos', array_documentos(3), 1);

    INSERT INTO JURADO (NOME, NUM_CERTIFICACAO, ID_CATEGORIA)
    VALUES ('Fernanda Costa', array_documentos(4), 2);

    INSERT INTO JURADO (NOME, NUM_CERTIFICACAO, ID_CATEGORIA)
    VALUES ('Carlos Eduardo', array_documentos(5), 1);

    INSERT INTO JURADO (NOME, NUM_CERTIFICACAO, ID_CATEGORIA)
    VALUES ('Isabela Ribeiro', array_documentos(6), 2);

    INSERT INTO JURADO (NOME, NUM_CERTIFICACAO, ID_CATEGORIA)
    VALUES ('Leonardo Pereira', array_documentos(7), 1);

    INSERT INTO JURADO (NOME, NUM_CERTIFICACAO, ID_CATEGORIA)
    VALUES ('Tatiane Dias', array_documentos(8), 2);

    INSERT INTO JURADO (NOME, NUM_CERTIFICACAO, ID_CATEGORIA)
    VALUES ('Roberto Silva', array_documentos(9), 1);

    INSERT INTO JURADO (NOME, NUM_CERTIFICACAO, ID_CATEGORIA)
    VALUES ('Sofia Almeida', array_documentos(10), 2);

    INSERT INTO JURADO (NOME, NUM_CERTIFICACAO, ID_CATEGORIA)
    VALUES ('André Gomes', array_documentos(11), 1);

    INSERT INTO JURADO (NOME, NUM_CERTIFICACAO, ID_CATEGORIA)
    VALUES ('Bianca Oliveira', array_documentos(12), 2);

    INSERT INTO JURADO (NOME, NUM_CERTIFICACAO, ID_CATEGORIA)
    VALUES ('Felipe Rocha', array_documentos(13), 1);

    INSERT INTO JURADO (NOME, NUM_CERTIFICACAO, ID_CATEGORIA)
    VALUES ('Gabriela Martins', array_documentos(14), 2);

    INSERT INTO JURADO (NOME, NUM_CERTIFICACAO, ID_CATEGORIA)
    VALUES ('Ricardo Almeida', array_documentos(15), 1);

    INSERT INTO JURADO (NOME, NUM_CERTIFICACAO, ID_CATEGORIA)
    VALUES ('Juliana Ferreira', array_documentos(16), 2);

    INSERT INTO JURADO (NOME, NUM_CERTIFICACAO, ID_CATEGORIA)
    VALUES ('Paulo Henrique', array_documentos(17), 1);

    INSERT INTO JURADO (NOME, NUM_CERTIFICACAO, ID_CATEGORIA)
    VALUES ('Mariana Costa', array_documentos(18), 2);

    INSERT INTO JURADO (NOME, NUM_CERTIFICACAO, ID_CATEGORIA)
    VALUES ('Thiago Martins', array_documentos(19), 1);

    INSERT INTO JURADO (NOME, NUM_CERTIFICACAO, ID_CATEGORIA)
    VALUES ('Lívia Sousa', array_documentos(20), 2);

    INSERT INTO JURADO (NOME, NUM_CERTIFICACAO, ID_CATEGORIA)
    VALUES ('Ricardo Ferreira', array_documentos(21), 1);

    INSERT INTO JURADO (NOME, NUM_CERTIFICACAO, ID_CATEGORIA)
    VALUES ('Fernanda Lima', array_documentos(22), 2);

    INSERT INTO JURADO (NOME, NUM_CERTIFICACAO, ID_CATEGORIA)
    VALUES ('Jorge Cardoso', array_documentos(23), 1);

    INSERT INTO JURADO (NOME, NUM_CERTIFICACAO, ID_CATEGORIA)
    VALUES ('Aline Mendes', array_documentos(24), 2);

    INSERT INTO JURADO (NOME, NUM_CERTIFICACAO, ID_CATEGORIA)
    VALUES ('Carlos Silva', array_documentos(25), 1);

END;