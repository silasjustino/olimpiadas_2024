DECLARE
    CURSOR c_atletas_masculinos IS
        SELECT ID
        FROM ATLETA
        WHERE ID_DELEGACAO = 50
          AND ID_CATEGORIA = 1;

    CURSOR c_atletas_femininos IS
        SELECT ID
        FROM ATLETA
        WHERE ID_DELEGACAO = 50
          AND ID_CATEGORIA = 2;

    TYPE t_nomes IS TABLE OF VARCHAR2(100) INDEX BY PLS_INTEGER;
    v_nomes_masculinos t_nomes;
    v_nomes_femininos t_nomes;
    v_index_masculino PLS_INTEGER := 1;
    v_index_feminino PLS_INTEGER := 1;
BEGIN
    -- Definir os nomes masculinos para a delegação de Timor-Leste
    v_nomes_masculinos(1) := 'José Lopes';
    v_nomes_masculinos(2) := 'Antonio Guterres';
    v_nomes_masculinos(3) := 'Nicolau Lobato';
    v_nomes_masculinos(4) := 'Lúcio Souza';
    v_nomes_masculinos(5) := 'César Magno';
    v_nomes_masculinos(6) := 'João Da Silva';
    v_nomes_masculinos(7) := 'Victor Pereira';
    v_nomes_masculinos(8) := 'Miguel Dores';
    v_nomes_masculinos(9) := 'Felipe Fernandes';
    v_nomes_masculinos(10) := 'Ricardo Alves';

    -- Definir os nomes femininos para a delegação de Timor-Leste
    v_nomes_femininos(1) := 'Maria da Silva';
    v_nomes_femininos(2) := 'Lúcia Fernandes';
    v_nomes_femininos(3) := 'Clara Costa';
    v_nomes_femininos(4) := 'Ana Pereira';
    v_nomes_femininos(5) := 'Sofia Gomes';
    v_nomes_femininos(6) := 'Eliana Almeida';
    v_nomes_femininos(7) := 'Helena Sousa';
    v_nomes_femininos(8) := 'Célia Rodrigues';
    v_nomes_femininos(9) := 'Beatriz Lima';
    v_nomes_femininos(10) := 'Paula Martins';

    -- Loop para atualizar os atletas masculinos
    FOR r_atleta IN c_atletas_masculinos LOOP
        UPDATE ATLETA
        SET NOME = v_nomes_masculinos(v_index_masculino)
        WHERE ID = r_atleta.ID;
        
        v_index_masculino := v_index_masculino + 1;
        IF v_index_masculino > v_nomes_masculinos.COUNT THEN
            v_index_masculino := 1; -- Reinicia a lista de nomes se necessário
        END IF;
    END LOOP;

    -- Loop para atualizar os atletas femininos
    FOR r_atleta IN c_atletas_femininos LOOP
        UPDATE ATLETA
        SET NOME = v_nomes_femininos(v_index_feminino)
        WHERE ID = r_atleta.ID;
        
        v_index_feminino := v_index_feminino + 1;
        IF v_index_feminino > v_nomes_femininos.COUNT THEN
            v_index_feminino := 1; -- Reinicia a lista de nomes se necessário
        END IF;
    END LOOP;

    COMMIT;
END;
