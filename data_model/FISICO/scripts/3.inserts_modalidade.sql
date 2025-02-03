DECLARE
    v_id_esporte number;
    v_id_categoria number;
BEGIN

    SELECT ID
    INTO v_id_esporte
    FROM ESPORTE
    WHERE DSC_ESPORTE = 'Atletismo';

    FOR cat in (
                    SELECT ID
                    FROM CATEGORIA
                )
    LOOP
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, '100m rasos', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, '200m rasos', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, '400m rasos', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, '800m', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, '1500m', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, '5000m', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, '10000m', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Maratona', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, '110m com barreiras', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, '400m com barreiras', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, '3000m com obstáculos', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Revezamento 4x100m', cat.id, 'E', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Revezamento 4x400m', cat.id, 'E', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Salto em altura', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Salto com vara', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Salto em distância', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Salto triplo', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Arremesso de peso', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Lançamento de disco', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Lançamento de martelo', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Lançamento de dardo', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Decatlo', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Heptatlo', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Marcha atlética 20km', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Marcha atlética 35km', cat.id, 'I', 'T');
    END LOOP;

    SELECT ID
    INTO v_id_esporte
    FROM ESPORTE
    WHERE DSC_ESPORTE = 'Badminton';

    FOR cat in (
                    SELECT ID
                    FROM CATEGORIA
                )
    LOOP
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Simples', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Duplas', cat.id, 'E', 'P');
    END LOOP;

    SELECT ID
    INTO v_id_esporte
    FROM ESPORTE
    WHERE DSC_ESPORTE = 'Basquete';

    FOR cat in (
                    SELECT ID
                    FROM CATEGORIA
                )
    LOOP
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Padrão', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, '3X3', cat.id, 'E', 'P');
    END LOOP;

    SELECT ID
    INTO v_id_esporte
    FROM ESPORTE
    WHERE DSC_ESPORTE = 'Boxe';

    SELECT ID
    INTO v_id_categoria
    FROM CATEGORIA
    WHERE SEXO = 'Masculino';

    INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Peso Pena', v_id_categoria, 'I', 'P');
    INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Peso Meio-Médio', v_id_categoria, 'I', 'P');
    INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Peso Meio-Pesado', v_id_categoria, 'I', 'P');
    INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Peso Pesado', v_id_categoria, 'I', 'P');

    FOR cat in (
                    SELECT ID
                    FROM CATEGORIA
                )
    LOOP
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Peso Mosca', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Peso Galo', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Peso Leve', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Peso Médio', cat.id, 'I', 'P');
    END LOOP;

    SELECT ID
    INTO v_id_esporte
    FROM ESPORTE
    WHERE DSC_ESPORTE = 'Breaking';

    FOR cat in (
                    SELECT ID
                    FROM CATEGORIA
                )
    LOOP
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Solo', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Dupla', cat.id, 'E', 'P');
    END LOOP;

    SELECT ID
    INTO v_id_esporte
    FROM ESPORTE
    WHERE DSC_ESPORTE = 'Canoagem';

    FOR cat in (
                    SELECT ID
                    FROM CATEGORIA
                )
    LOOP
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Velocidade Individual', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Velocidade Dupla', cat.id, 'E', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Slalom Individual', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Slalom Dupla', cat.id, 'E', 'T');
    END LOOP;

    SELECT ID
    INTO v_id_esporte
    FROM ESPORTE
    WHERE DSC_ESPORTE = 'Ciclismo';

    FOR cat in (
                    SELECT ID
                    FROM CATEGORIA
                )
    LOOP
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Estrada Individual', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Estrada Equipe', cat.id, 'E', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Mountain Bike', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'BMX', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Pista Individual', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Pista Equipe', cat.id, 'E', 'T');
    END LOOP;

    
    SELECT ID
    INTO v_id_esporte
    FROM ESPORTE
    WHERE DSC_ESPORTE = 'Escalada';

    FOR cat in (
                    SELECT ID
                    FROM CATEGORIA
                )
    LOOP
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Boulder', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Lead', cat.id, 'I', 'T');
    END LOOP;

    SELECT ID
    INTO v_id_esporte
    FROM ESPORTE
    WHERE DSC_ESPORTE = 'Esgrima';

    FOR cat in (
                    SELECT ID
                    FROM CATEGORIA
                )
    LOOP
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Florete', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Espada', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Sabre', cat.id, 'I', 'P');
    END LOOP;

    SELECT ID
    INTO v_id_esporte
    FROM ESPORTE
    WHERE DSC_ESPORTE = 'Futebol';

    FOR cat in (
                    SELECT ID
                    FROM CATEGORIA
                )
    LOOP
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Padrão', cat.id, 'E', 'P');
    END LOOP;

    SELECT ID
    INTO v_id_esporte
    FROM ESPORTE
    WHERE DSC_ESPORTE = 'Ginástica';

    FOR cat in (
                    SELECT ID
                    FROM CATEGORIA
                )
    LOOP
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Ginástica Artística Individual', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Ginástica Artística em Equipe', cat.id, 'E', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Ginástica Rítmica', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Ginástica de Trampolim', cat.id, 'I', 'P');
    END LOOP;

    SELECT ID
    INTO v_id_esporte
    FROM ESPORTE
    WHERE DSC_ESPORTE = 'Golfe';

    FOR cat in (
                    SELECT ID
                    FROM CATEGORIA
                )
    LOOP
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Individual', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Equipes', cat.id, 'E', 'P');
    END LOOP;

    SELECT ID
    INTO v_id_esporte
    FROM ESPORTE
    WHERE DSC_ESPORTE = 'Handebol';

    FOR cat in (
                    SELECT ID
                    FROM CATEGORIA
                )
    LOOP
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Padrão', cat.id, 'E', 'P');
    END LOOP;

    SELECT ID
    INTO v_id_esporte
    FROM ESPORTE
    WHERE DSC_ESPORTE = 'Hipismo';

    FOR cat in (
                    SELECT ID
                    FROM CATEGORIA
                )
    LOOP
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Salto', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Adestramento', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Cross Country', cat.id, 'I', 'P');
    END LOOP;

    SELECT ID
    INTO v_id_esporte
    FROM ESPORTE
    WHERE DSC_ESPORTE = 'Hóquei';

    FOR cat in (
                    SELECT ID
                    FROM CATEGORIA
                )
    LOOP
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Hóquei sobre Grama', cat.id, 'E', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Hóquei sobre Gelo', cat.id, 'E', 'P');
    END LOOP;

    SELECT ID
    INTO v_id_esporte
    FROM ESPORTE
    WHERE DSC_ESPORTE = 'Judô';

    SELECT ID
    INTO v_id_categoria
    FROM CATEGORIA
    WHERE SEXO = 'Masculino';

    INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Peso Pena', v_id_categoria, 'I', 'P');
    INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Peso Meio-Médio', v_id_categoria, 'I', 'P');
    INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Peso Meio-Pesado', v_id_categoria, 'I', 'P');
    INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Peso Pesado', v_id_categoria, 'I', 'P');

    FOR cat in (
                    SELECT ID
                    FROM CATEGORIA
                )
    LOOP
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Peso Mosca', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Peso Galo', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Peso Leve', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Peso Médio', cat.id, 'I', 'P');
    END LOOP;


    SELECT ID
    INTO v_id_esporte
    FROM ESPORTE
    WHERE DSC_ESPORTE = 'Karatê';

    FOR cat in (
                    SELECT ID
                    FROM CATEGORIA
                )
    LOOP
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Kumite', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Kata', cat.id, 'I', 'P');
    END LOOP;

    SELECT ID
    INTO v_id_esporte
    FROM ESPORTE
    WHERE DSC_ESPORTE = 'Levantamento de Peso';

    FOR cat in (
                    SELECT ID
                    FROM CATEGORIA
                )
    LOOP
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Peso Até 61 kg', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Peso Até 73 kg', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Peso Até 81 kg', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Peso Até 96 kg', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Peso Até 109 kg', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Peso Acima de 109 kg', cat.id, 'I', 'P');
    END LOOP;

    SELECT ID
    INTO v_id_esporte
    FROM ESPORTE
    WHERE DSC_ESPORTE = 'Lutas';

    FOR cat in (
                    SELECT ID
                    FROM CATEGORIA
                )
    LOOP
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Luta Livre', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Greco-Romana', cat.id, 'I', 'P');
    END LOOP;

    SELECT ID
    INTO v_id_esporte
    FROM ESPORTE
    WHERE DSC_ESPORTE = 'Natação';

    FOR cat in (
                    SELECT ID
                    FROM CATEGORIA
                )
    LOOP
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, '100 metros Livre', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, '200 metros Livre', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, '400 metros Livre', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, '800 metros Livre', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, '1500 metros Livre', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, '100 metros Costas', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, '200 metros Costas', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, '100 metros Peito', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, '200 metros Peito', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, '100 metros Borboleta', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, '200 metros Medley', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, '4X100 metros Estrelas', cat.id, 'E', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, '4X200 metros Estrelas', cat.id, 'E', 'T');
    END LOOP;

    SELECT ID
    INTO v_id_esporte
    FROM ESPORTE
    WHERE DSC_ESPORTE = 'Pentatlo Moderno';

    FOR cat in (
                    SELECT ID
                    FROM CATEGORIA
                )
    LOOP
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Esgrima', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Natação', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Cavalos', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Tiro', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Corrida', cat.id, 'I', 'T');
    END LOOP;

    SELECT ID
    INTO v_id_esporte
    FROM ESPORTE
    WHERE DSC_ESPORTE = 'Polo Aquático';

    FOR cat in (
                    SELECT ID
                    FROM CATEGORIA
                )
    LOOP
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Padrão', cat.id, 'E', 'P');
    END LOOP;

    SELECT ID
    INTO v_id_esporte
    FROM ESPORTE
    WHERE DSC_ESPORTE = 'Remo';

    FOR cat in (
                    SELECT ID
                    FROM CATEGORIA
                )
    LOOP
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Skiff Individual', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Double Skiff', cat.id, 'E', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Quadruple Skiff', cat.id, 'E', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Oito com', cat.id, 'E', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Four com', cat.id, 'E', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Dois sem', cat.id, 'E', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Quatro sem', cat.id, 'E', 'T');
    END LOOP;

    SELECT ID
    INTO v_id_esporte
    FROM ESPORTE
    WHERE DSC_ESPORTE = 'Rugby';

    FOR cat in (
                    SELECT ID
                    FROM CATEGORIA
                )
    LOOP
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Sevens', cat.id, 'E', 'P');
    END LOOP;

    SELECT ID
    INTO v_id_esporte
    FROM ESPORTE
    WHERE DSC_ESPORTE = 'Saltos Ornamentais';

    FOR cat in (
                    SELECT ID
                    FROM CATEGORIA
                )
    LOOP
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Plataforma 10m', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Trampolim 3m', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Trampolim 1m', cat.id, 'I', 'P');
    END LOOP;

    SELECT ID
    INTO v_id_esporte
    FROM ESPORTE
    WHERE DSC_ESPORTE = 'Skate';

    FOR cat in (
                    SELECT ID
                    FROM CATEGORIA
                )
    LOOP
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Street', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Park', cat.id, 'I', 'P');
    END LOOP;

    SELECT ID
    INTO v_id_esporte
    FROM ESPORTE
    WHERE DSC_ESPORTE = 'Surfe';

    FOR cat in (
                    SELECT ID
                    FROM CATEGORIA
                )
    LOOP
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Shortboard', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Longboard', cat.id, 'I', 'P');
    END LOOP;

    SELECT ID
    INTO v_id_esporte
    FROM ESPORTE
    WHERE DSC_ESPORTE = 'Taekwondo';

    FOR cat in (
                    SELECT ID
                    FROM CATEGORIA
                )
    LOOP
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Até 58 kg', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Até 68 kg', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Até 80 kg', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Acima de 80 kg', cat.id, 'I', 'P');
    END LOOP;

    SELECT ID
    INTO v_id_esporte
    FROM ESPORTE
    WHERE DSC_ESPORTE = 'Tênis';

    FOR cat in (
                    SELECT ID
                    FROM CATEGORIA
                )
    LOOP
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Simples', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Duplas', cat.id, 'E', 'P');
    END LOOP;

    SELECT ID
    INTO v_id_esporte
    FROM ESPORTE
    WHERE DSC_ESPORTE = 'Tênis de Mesa';

    FOR cat in (
                    SELECT ID
                    FROM CATEGORIA
                )
    LOOP
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Individual', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Duplas', cat.id, 'E', 'P');
    END LOOP;

    SELECT ID
    INTO v_id_esporte
    FROM ESPORTE
    WHERE DSC_ESPORTE = 'Tiro';

    FOR cat in (
                    SELECT ID
                    FROM CATEGORIA
                )
    LOOP
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Tiro ao Alvo - 10m', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Tiro ao Alvo - 25m', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Tiro ao Alvo - 50m', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Fossa Olímpica', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Trap', cat.id, 'I', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Double Trap', cat.id, 'I', 'P');
    END LOOP;

    SELECT ID
    INTO v_id_esporte
    FROM ESPORTE
    WHERE DSC_ESPORTE = 'Triatlo';

    FOR cat in (
                    SELECT ID
                    FROM CATEGORIA
                )
    LOOP
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Padrão', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Sprint', cat.id, 'I', 'T');
    END LOOP;

    SELECT ID
    INTO v_id_esporte
    FROM ESPORTE
    WHERE DSC_ESPORTE = 'Vela';

    FOR cat in (
                    SELECT ID
                    FROM CATEGORIA
                )
    LOOP
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Laser', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, '470', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Finn', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Nacra 17', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, '49er', cat.id, 'I', 'T');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, '49er FX', cat.id, 'I', 'T');
    END LOOP;

    SELECT ID
    INTO v_id_esporte
    FROM ESPORTE
    WHERE DSC_ESPORTE = 'Vôlei';

    FOR cat in (
                    SELECT ID
                    FROM CATEGORIA
                )
    LOOP
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Quadra', cat.id, 'E', 'P');
        INSERT INTO MODALIDADE (ID_ESPORTE, DSC_MODALIDADE, ID_CATEGORIA, PARTICIPACAO, AVALIACAO) VALUES (v_id_esporte, 'Praia', cat.id, 'E', 'P');
    END LOOP;
    
END;