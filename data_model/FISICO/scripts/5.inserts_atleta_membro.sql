DECLARE
    v_num_aleatorio number;
    type array_n is varray(25) of number;
    array_documentos array_n := array_n();
    v_num_documento number;
    v_qtd_iguais_atleta number := -1;
    v_qtd_iguais_membro number := -1;
    v_id_delegacao number;
    v_nacionalidade varchar2(100);
BEGIN

    FOR p IN  (
                SELECT ID, PAIS
                FROM DELEGACAO
              )
    LOOP
        v_id_delegacao := p.ID;
        v_nacionalidade := p.PAIS;

        v_num_aleatorio := ROUND(DBMS_RANDOM.VALUE(1, 5));

        array_documentos := array_n();

        FOR cur in 1..25 LOOP

            v_num_documento := ROUND(DBMS_RANDOM.VALUE(100000000, 999999999));

            SELECT count(*)
            INTO v_qtd_iguais_atleta
            FROM ATLETA
            WHERE NUM_DOCUMENTO = v_num_documento;

            SELECT count(*)
            INTO v_qtd_iguais_membro
            FROM MEMBRO
            WHERE NUM_DOCUMENTO = v_num_documento;

            WHILE v_qtd_iguais_atleta > 0 AND v_qtd_iguais_membro > 0 LOOP

                v_num_documento := ROUND(DBMS_RANDOM.VALUE(100000000, 999999999));

                SELECT count(*)
                INTO v_qtd_iguais_atleta
                FROM ATLETA
                WHERE NUM_DOCUMENTO = v_num_documento;

                SELECT count(*)
                INTO v_qtd_iguais_membro
                FROM MEMBRO
                WHERE NUM_DOCUMENTO = v_num_documento;

            END LOOP; 

            array_documentos.EXTEND;
            array_documentos(cur) := v_num_documento;

        END LOOP;

        IF v_num_aleatorio = 1 THEN

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Carlos da Silva', array_documentos(1), 1, v_id_delegacao, TO_DATE('15/05/1990 09:15', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 80, 1.85);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Mariana Santos', array_documentos(2), 2, v_id_delegacao, TO_DATE('20/03/1995 14:30', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 60, 1.70);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('José Oliveira', array_documentos(3), 1, v_id_delegacao, TO_DATE('02/11/1988 07:45', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 78, 1.78);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Ana Costa', array_documentos(4), 2, v_id_delegacao, TO_DATE('25/07/1997 16:20', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 55, 1.65);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Miguel Fernández', array_documentos(5), 1, v_id_delegacao, TO_DATE('10/09/1993 10:05', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 85, 1.90);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Laura García', array_documentos(6), 2, v_id_delegacao, TO_DATE('30/01/2000 11:45', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 63, 1.75);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Lucas Pereira', array_documentos(7), 1, v_id_delegacao, TO_DATE('18/12/1985 05:30', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 90, 1.82);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Carla Almeida', array_documentos(8), 2, v_id_delegacao, TO_DATE('12/04/1999 13:15', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 58, 1.68);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Fernando Ruiz', array_documentos(9), 1, v_id_delegacao, TO_DATE('22/08/1992 08:40', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 77, 1.80);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Sofia López', array_documentos(10), 2, v_id_delegacao, TO_DATE('05/10/1998 15:50', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 64, 1.72);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Juliana Lima', array_documentos(11), 2, v_id_delegacao, TO_DATE('14/06/1991 08:50', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 57, 1.67);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Rafael Souza', array_documentos(12), 1, v_id_delegacao, TO_DATE('05/02/1987 12:10', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 83, 1.80);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Fernanda Costa', array_documentos(13), 2, v_id_delegacao, TO_DATE('22/11/1994 09:20', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 62, 1.70);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Marcelo Pereira', array_documentos(14), 1, v_id_delegacao, TO_DATE('03/09/1992 06:25', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 75, 1.78);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Beatriz Oliveira', array_documentos(15), 2, v_id_delegacao, TO_DATE('18/10/2001 15:45', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 59, 1.65);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Tiago Rocha', array_documentos(16), 1, v_id_delegacao, TO_DATE('29/08/1989 11:30', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 88, 1.84);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Patrícia Santos', array_documentos(17), 2, v_id_delegacao, TO_DATE('07/04/1996 10:15', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 60, 1.72);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Diego Martins', array_documentos(18), 1, v_id_delegacao, TO_DATE('11/01/1986 14:40', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 91, 1.88);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Gabriela Menezes', array_documentos(19), 2, v_id_delegacao, TO_DATE('13/12/1999 07:35', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 65, 1.69);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Ricardo Lima', array_documentos(20), 1, v_id_delegacao, TO_DATE('27/03/1993 17:20', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 80, 1.83);

            INSERT INTO MEMBRO (NOME, NUM_DOCUMENTO, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE)
            VALUES ('Carlos Henrique', array_documentos(21), v_id_delegacao, TO_DATE('15/01/1991 08:20', 'DD/MM/YYYY HH24:MI'), v_nacionalidade);

            INSERT INTO MEMBRO (NOME, NUM_DOCUMENTO, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE)
            VALUES ('Fernanda Lima', array_documentos(22), v_id_delegacao, TO_DATE('28/02/1988 09:10', 'DD/MM/YYYY HH24:MI'), v_nacionalidade);

            INSERT INTO MEMBRO (NOME, NUM_DOCUMENTO, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE)
            VALUES ('Thiago Almeida', array_documentos(23), v_id_delegacao, TO_DATE('12/03/1995 14:25', 'DD/MM/YYYY HH24:MI'), v_nacionalidade);

            INSERT INTO MEMBRO (NOME, NUM_DOCUMENTO, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE)
            VALUES ('Bruna Ferreira', array_documentos(24), v_id_delegacao, TO_DATE('21/04/1992 17:50', 'DD/MM/YYYY HH24:MI'), v_nacionalidade);

            INSERT INTO MEMBRO (NOME, NUM_DOCUMENTO, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE)
            VALUES ('Lucas Martins', array_documentos(25), v_id_delegacao, TO_DATE('05/05/1989 20:30', 'DD/MM/YYYY HH24:MI'), v_nacionalidade);

        ELSIF v_num_aleatorio = 2 THEN

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Bruno Martins', array_documentos(1), 1, v_id_delegacao, TO_DATE('08/07/1991 13:30', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 82, 1.80);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Isabela Ferreira', array_documentos(2), 2, v_id_delegacao, TO_DATE('19/02/1994 09:45', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 59, 1.68);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Felipe Gomes', array_documentos(3), 1, v_id_delegacao, TO_DATE('27/04/1989 17:15', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 85, 1.83);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Camila Souza', array_documentos(4), 2, v_id_delegacao, TO_DATE('14/09/1996 11:50', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 62, 1.70);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('André Lima', array_documentos(5), 1, v_id_delegacao, TO_DATE('03/12/1987 08:20', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 79, 1.77);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Larissa Costa', array_documentos(6), 2, v_id_delegacao, TO_DATE('25/05/1993 14:05', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 61, 1.69);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Bruno Alves', array_documentos(7), 1, v_id_delegacao, TO_DATE('10/10/1990 19:40', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 88, 1.85);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Renata Martins', array_documentos(8), 2, v_id_delegacao, TO_DATE('18/01/1998 07:55', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 57, 1.66);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Gustavo Rocha', array_documentos(9), 1, v_id_delegacao, TO_DATE('29/06/1992 16:25', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 84, 1.82);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Tatiana Pereira', array_documentos(10), 2, v_id_delegacao, TO_DATE('07/08/1995 12:35', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 60, 1.73);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Camila Teixeira', array_documentos(11), 2, v_id_delegacao, TO_DATE('16/08/1994 09:25', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 61, 1.69);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('André Carvalho', array_documentos(12), 1, v_id_delegacao, TO_DATE('09/05/1983 08:55', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 82, 1.85);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Renata Freitas', array_documentos(13), 2, v_id_delegacao, TO_DATE('23/07/1998 13:50', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 59, 1.65);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Pedro Henrique', array_documentos(14), 1, v_id_delegacao, TO_DATE('14/02/1987 07:10', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 84, 1.88);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Alice Moreira', array_documentos(15), 2, v_id_delegacao, TO_DATE('29/03/2002 11:20', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 57, 1.68);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('João Batista', array_documentos(16), 1, v_id_delegacao, TO_DATE('03/10/1991 10:40', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 86, 1.82);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Daniela Ramos', array_documentos(17), 2, v_id_delegacao, TO_DATE('17/06/1996 14:15', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 60, 1.73);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Victor Mendes', array_documentos(18), 1, v_id_delegacao, TO_DATE('05/09/1993 05:35', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 79, 1.79);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Sara Barros', array_documentos(19), 2, v_id_delegacao, TO_DATE('18/11/1999 12:25', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 58, 1.70);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Felipe Alves', array_documentos(20), 1, v_id_delegacao, TO_DATE('24/12/1985 06:45', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 90, 1.87);

            INSERT INTO MEMBRO (NOME, NUM_DOCUMENTO, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE)
            VALUES ('Patrícia Mendes', array_documentos(21), v_id_delegacao, TO_DATE('17/06/1990 11:00', 'DD/MM/YYYY HH24:MI'), v_nacionalidade);

            INSERT INTO MEMBRO (NOME, NUM_DOCUMENTO, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE)
            VALUES ('Felipe Santos', array_documentos(22), v_id_delegacao, TO_DATE('30/07/1993 13:45', 'DD/MM/YYYY HH24:MI'), v_nacionalidade);

            INSERT INTO MEMBRO (NOME, NUM_DOCUMENTO, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE)
            VALUES ('Clara Dias', array_documentos(23), v_id_delegacao, TO_DATE('08/08/1996 15:15', 'DD/MM/YYYY HH24:MI'), v_nacionalidade);

            INSERT INTO MEMBRO (NOME, NUM_DOCUMENTO, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE)
            VALUES ('Rafael Souza', array_documentos(24), v_id_delegacao, TO_DATE('14/09/1985 16:35', 'DD/MM/YYYY HH24:MI'), v_nacionalidade);

            INSERT INTO MEMBRO (NOME, NUM_DOCUMENTO, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE)
            VALUES ('Ana Paula', array_documentos(25), v_id_delegacao, TO_DATE('25/10/1994 12:55', 'DD/MM/YYYY HH24:MI'), v_nacionalidade);

        ELSIF v_num_aleatorio = 3 THEN

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Vinícius Santos', array_documentos(1), 1, v_id_delegacao, TO_DATE('01/05/1988 13:15', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 78, 1.79);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Carla Almeida', array_documentos(2), 2, v_id_delegacao, TO_DATE('23/11/1997 10:05', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 64, 1.68);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('João Paulo', array_documentos(3), 1, v_id_delegacao, TO_DATE('14/09/1990 15:30', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 86, 1.81);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Natália Rodrigues', array_documentos(4), 2, v_id_delegacao, TO_DATE('09/06/1995 11:45', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 58, 1.65);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Ricardo Almeida', array_documentos(5), 1, v_id_delegacao, TO_DATE('30/03/1985 18:20', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 90, 1.87);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Ana Paula', array_documentos(6), 2, v_id_delegacao, TO_DATE('12/12/1991 14:55', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 63, 1.71);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Felipe Nunes', array_documentos(7), 1, v_id_delegacao, TO_DATE('20/08/1989 07:10', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 80, 1.82);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Júlia Martins', array_documentos(8), 2, v_id_delegacao, TO_DATE('17/04/1998 19:40', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 55, 1.64);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Thiago Costa', array_documentos(9), 1, v_id_delegacao, TO_DATE('22/01/1992 08:30', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 84, 1.79);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Sofia Almeida', array_documentos(10), 2, v_id_delegacao, TO_DATE('15/03/1994 16:00', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 62, 1.67);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Marcos Silva', array_documentos(11), 1, v_id_delegacao, TO_DATE('05/07/1990 14:20', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 83, 1.78);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Patrícia Lima', array_documentos(12), 2, v_id_delegacao, TO_DATE('21/10/1995 10:40', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 56, 1.65);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Fernando Souza', array_documentos(13), 1, v_id_delegacao, TO_DATE('30/03/1988 17:50', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 87, 1.80);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Ana Beatriz', array_documentos(14), 2, v_id_delegacao, TO_DATE('09/02/1992 08:15', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 54, 1.62);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Diego Gomes', array_documentos(15), 1, v_id_delegacao, TO_DATE('15/11/1993 13:05', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 80, 1.82);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Cláudia Rocha', array_documentos(16), 2, v_id_delegacao, TO_DATE('27/09/1990 11:30', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 59, 1.67);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Lucas Martins', array_documentos(17), 1, v_id_delegacao, TO_DATE('22/08/1989 14:00', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 85, 1.84);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Fernanda Oliveira', array_documentos(18), 2, v_id_delegacao, TO_DATE('17/12/1996 19:25', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 62, 1.66);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Gabriel Nascimento', array_documentos(19), 1, v_id_delegacao, TO_DATE('28/04/1991 15:55', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 82, 1.81);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Raquel Mendes', array_documentos(20), 2, v_id_delegacao, TO_DATE('13/06/1994 09:10', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 57, 1.69);

            INSERT INTO MEMBRO (NOME, NUM_DOCUMENTO, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE)
            VALUES ('Eduardo Lima', array_documentos(21), v_id_delegacao, TO_DATE('17/01/1990 08:30', 'DD/MM/YYYY HH24:MI'), v_nacionalidade);

            INSERT INTO MEMBRO (NOME, NUM_DOCUMENTO, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE)
            VALUES ('Larissa Gomes', array_documentos(22), v_id_delegacao, TO_DATE('22/02/1992 09:50', 'DD/MM/YYYY HH24:MI'), v_nacionalidade);

            INSERT INTO MEMBRO (NOME, NUM_DOCUMENTO, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE)
            VALUES ('Gustavo Ferreira', array_documentos(23), v_id_delegacao, TO_DATE('30/03/1995 14:40', 'DD/MM/YYYY HH24:MI'), v_nacionalidade);

            INSERT INTO MEMBRO (NOME, NUM_DOCUMENTO, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE)
            VALUES ('Mariana Oliveira', array_documentos(24), v_id_delegacao, TO_DATE('15/04/1988 16:15', 'DD/MM/YYYY HH24:MI'), v_nacionalidade);

            INSERT INTO MEMBRO (NOME, NUM_DOCUMENTO, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE)
            VALUES ('Ricardo Santos', array_documentos(25), v_id_delegacao, TO_DATE('19/05/1991 13:25', 'DD/MM/YYYY HH24:MI'), v_nacionalidade);

        ELSIF v_num_aleatorio = 4 THEN

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('André Costa', array_documentos(1), 1, v_id_delegacao, TO_DATE('04/03/1992 10:05', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 88, 1.85);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Juliana Mendes', array_documentos(2), 2, v_id_delegacao, TO_DATE('16/05/1995 12:30', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 61, 1.70);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Roberto Silva', array_documentos(3), 1, v_id_delegacao, TO_DATE('11/11/1987 19:00', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 79, 1.77);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Mariana Soares', array_documentos(4), 2, v_id_delegacao, TO_DATE('29/09/1993 09:15', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 58, 1.64);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Thiago Almeida', array_documentos(5), 1, v_id_delegacao, TO_DATE('27/01/1990 14:50', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 84, 1.80);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Sabrina Pires', array_documentos(6), 2, v_id_delegacao, TO_DATE('05/08/1994 16:45', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 60, 1.66);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Fábio Rocha', array_documentos(7), 1, v_id_delegacao, TO_DATE('02/04/1986 20:10', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 91, 1.89);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Letícia Campos', array_documentos(8), 2, v_id_delegacao, TO_DATE('18/06/1998 11:35', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 55, 1.63);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Carlos Pereira', array_documentos(9), 1, v_id_delegacao, TO_DATE('20/12/1989 08:25', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 81, 1.81);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Giselle Ferreira', array_documentos(10), 2, v_id_delegacao, TO_DATE('14/02/1991 09:50', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 59, 1.68);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Eduardo Lima', array_documentos(11), 1, v_id_delegacao, TO_DATE('01/05/1994 13:30', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 90, 1.88);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Tatiane Silva', array_documentos(12), 2, v_id_delegacao, TO_DATE('30/07/1990 18:15', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 56, 1.62);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Ricardo Oliveira', array_documentos(13), 1, v_id_delegacao, TO_DATE('16/09/1988 21:45', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 84, 1.82);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Luciana Santos', array_documentos(14), 2, v_id_delegacao, TO_DATE('25/12/1995 09:05', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 53, 1.60);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Gustavo Ferreira', array_documentos(15), 1, v_id_delegacao, TO_DATE('12/11/1992 10:40', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 92, 1.90);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Fernanda Costa', array_documentos(16), 2, v_id_delegacao, TO_DATE('09/03/1996 15:20', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 58, 1.64);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Henrique Almeida', array_documentos(17), 1, v_id_delegacao, TO_DATE('14/06/1985 19:55', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 86, 1.83);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Karine Rocha', array_documentos(18), 2, v_id_delegacao, TO_DATE('02/10/1993 12:30', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 60, 1.65);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Leonardo Martins', array_documentos(19), 1, v_id_delegacao, TO_DATE('20/01/1991 14:10', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 82, 1.79);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Mariana Almeida', array_documentos(20), 2, v_id_delegacao, TO_DATE('11/08/1994 16:00', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 54, 1.61);

            INSERT INTO MEMBRO (NOME, NUM_DOCUMENTO, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE)
            VALUES ('Juliana Teixeira', array_documentos(21), v_id_delegacao, TO_DATE('28/06/1994 12:35', 'DD/MM/YYYY HH24:MI'), v_nacionalidade);

            INSERT INTO MEMBRO (NOME, NUM_DOCUMENTO, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE)
            VALUES ('Fernando Alves', array_documentos(22), v_id_delegacao, TO_DATE('10/07/1993 11:10', 'DD/MM/YYYY HH24:MI'), v_nacionalidade);

            INSERT INTO MEMBRO (NOME, NUM_DOCUMENTO, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE)
            VALUES ('Beatriz Costa', array_documentos(23), v_id_delegacao, TO_DATE('23/08/1987 19:45', 'DD/MM/YYYY HH24:MI'), v_nacionalidade);

            INSERT INTO MEMBRO (NOME, NUM_DOCUMENTO, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE)
            VALUES ('Lucas Lima', array_documentos(24), v_id_delegacao, TO_DATE('01/09/1990 18:05', 'DD/MM/YYYY HH24:MI'), v_nacionalidade);

            INSERT INTO MEMBRO (NOME, NUM_DOCUMENTO, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE)
            VALUES ('Camila Martins', array_documentos(25), v_id_delegacao, TO_DATE('29/10/1995 15:15', 'DD/MM/YYYY HH24:MI'), v_nacionalidade);

        ELSE

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Rafael Gomes', array_documentos(1), 1, v_id_delegacao, TO_DATE('21/02/1993 08:40', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 85, 1.81);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Ana Paula Lima', array_documentos(2), 2, v_id_delegacao, TO_DATE('28/03/1995 17:25', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 57, 1.67);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Carlos Eduardo', array_documentos(3), 1, v_id_delegacao, TO_DATE('15/04/1989 11:15', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 90, 1.84);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Juliana Alves', array_documentos(4), 2, v_id_delegacao, TO_DATE('12/05/1994 14:50', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 62, 1.69);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Robson Cardoso', array_documentos(5), 1, v_id_delegacao, TO_DATE('10/06/1986 16:35', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 82, 1.78);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Marta Ribeiro', array_documentos(6), 2, v_id_delegacao, TO_DATE('03/07/1991 19:00', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 55, 1.63);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Felipe Mendes', array_documentos(7), 1, v_id_delegacao, TO_DATE('08/08/1990 12:05', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 87, 1.85);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Claudia Santos', array_documentos(8), 2, v_id_delegacao, TO_DATE('17/09/1993 14:20', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 59, 1.66);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Thiago Costa', array_documentos(9), 1, v_id_delegacao, TO_DATE('26/10/1988 10:30', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 83, 1.80);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Priscila Dias', array_documentos(10), 2, v_id_delegacao, TO_DATE('22/11/1995 18:55', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 52, 1.62);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Guilherme Sousa', array_documentos(11), 1, v_id_delegacao, TO_DATE('14/01/1992 10:15', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 88, 1.79);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Sofia Martins', array_documentos(12), 2, v_id_delegacao, TO_DATE('19/02/1994 12:45', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 50, 1.61);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('André Lima', array_documentos(13), 1, v_id_delegacao, TO_DATE('27/03/1987 15:30', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 81, 1.85);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Larissa Costa', array_documentos(14), 2, v_id_delegacao, TO_DATE('03/04/1993 09:50', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 55, 1.68);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Marcos Oliveira', array_documentos(15), 1, v_id_delegacao, TO_DATE('05/05/1989 13:20', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 95, 1.92);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Jéssica Ribeiro', array_documentos(16), 2, v_id_delegacao, TO_DATE('11/06/1995 18:35', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 59, 1.66);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Fábio Almeida', array_documentos(17), 1, v_id_delegacao, TO_DATE('16/07/1990 14:00', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 84, 1.83);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Renata Souza', array_documentos(18), 2, v_id_delegacao, TO_DATE('22/08/1994 16:55', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 52, 1.60);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Vinícius Pereira', array_documentos(19), 1, v_id_delegacao, TO_DATE('04/09/1986 19:10', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 78, 1.77);

            INSERT INTO ATLETA (NOME, NUM_DOCUMENTO, ID_CATEGORIA, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE, PESO, ALTURA)
            VALUES ('Amanda Teixeira', array_documentos(20), 2, v_id_delegacao, TO_DATE('10/10/1992 11:25', 'DD/MM/YYYY HH24:MI'), v_nacionalidade, 57, 1.62);

            INSERT INTO MEMBRO (NOME, NUM_DOCUMENTO, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE)
            VALUES ('Rogério Barros', array_documentos(21), v_id_delegacao, TO_DATE('05/01/1990 10:00', 'DD/MM/YYYY HH24:MI'), v_nacionalidade);

            INSERT INTO MEMBRO (NOME, NUM_DOCUMENTO, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE)
            VALUES ('Tatiane Costa', array_documentos(22), v_id_delegacao, TO_DATE('18/02/1995 11:30', 'DD/MM/YYYY HH24:MI'), v_nacionalidade);

            INSERT INTO MEMBRO (NOME, NUM_DOCUMENTO, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE)
            VALUES ('Samuel Mendes', array_documentos(23), v_id_delegacao, TO_DATE('27/03/1989 14:50', 'DD/MM/YYYY HH24:MI'), v_nacionalidade);

            INSERT INTO MEMBRO (NOME, NUM_DOCUMENTO, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE)
            VALUES ('Ana Clara', array_documentos(24), v_id_delegacao, TO_DATE('03/04/1992 09:40', 'DD/MM/YYYY HH24:MI'), v_nacionalidade);

            INSERT INTO MEMBRO (NOME, NUM_DOCUMENTO, ID_DELEGACAO, DATA_NASCIMENTO, NACIONALIDADE)
            VALUES ('Eduarda Lima', array_documentos(25), v_id_delegacao, TO_DATE('15/05/1994 15:20', 'DD/MM/YYYY HH24:MI'), v_nacionalidade);

        END IF;

    END LOOP;

END;