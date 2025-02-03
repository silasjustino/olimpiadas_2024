create or replace procedure "PROC_RESULTADO_COMPETICAO" (
    p_id_competicao in number )
as
    i number := 1;
    v_ja_existe number;
    v_participacao varchar2(1);
    v_avaliacao varchar2(1);
	v_tab_classificacao t_tab_classificacao_competicao := t_tab_classificacao_competicao();
begin
    -- Recupera participacao e avaliacao
    select participacao, avaliacao
    into v_participacao, v_avaliacao
    from competicao c
    join modalidade m on c.id_modalidade = m.id
    where c.id = p_id_competicao;

    -- Percorre todas as fases dessa competição que possuem resultado e classificacao
    for fase in (select distinct b.id_fase
                from bateria b
                join resultado r on r.id_bateria = b.id
                where id_competicao = p_id_competicao
                and r.classificacao is not null
                order by id_fase desc
                )
    loop

        if v_participacao = 'I' then

            if v_avaliacao = 'P' then

                -- Pega todos classificados da fase atual já ordenados por pontuação
                for res in (
                    select r.id, r.id_atleta_competicao, a.id_delegacao
                    from resultado r
                    join pontuacao p on p.id_resultado = r.id
                    join atleta_competicao ac on r.id_atleta_competicao = ac.id
                    join atleta a on ac.id_atleta = a.id
                    join bateria b on b.id = r.id_bateria
                    where b.id_fase = fase.id_fase
                    and b.id_competicao = p_id_competicao
                    and r.classificacao = 'C'
                    order by p.nota desc
                ) loop

                    -- Verifica se o atleta já está na collection
                    select count(1)
                    into v_ja_existe
                    from table(v_tab_classificacao)
                    where id_atleta_competicao = res.id_atleta_competicao;

                    -- Se não existe, adiciona
                    if v_ja_existe = 0 then
                        -- Se não estiver, adiciona
                        v_tab_classificacao.extend();
                        v_tab_classificacao(i) := t_obj_classificacao_competicao(
                                                    p_id_competicao,
                                                    res.id,
                                                    i, 
                                                    res.id_atleta_competicao, 
                                                    res.id_delegacao,
                                                    fase.id_fase
                                                  );
                        i := i + 1;
                    end if;

                end loop;

                -- Pega todos desclassificados da fase atual já ordenados por pontuação
                for res in (
                    select r.id, r.id_atleta_competicao, a.id_delegacao
                    from resultado r
                    join pontuacao p on p.id_resultado = r.id
                    join atleta_competicao ac on r.id_atleta_competicao = ac.id
                    join atleta a on ac.id_atleta = a.id
                    join bateria b on b.id = r.id_bateria
                    where b.id_fase = fase.id_fase
                    and b.id_competicao = p_id_competicao
                    and r.classificacao = 'D'
                    order by p.nota desc
                ) loop

                    -- Verifica se o atleta já está na collection
                    select count(1)
                    into v_ja_existe
                    from table(v_tab_classificacao)
                    where id_atleta_competicao = res.id_atleta_competicao;

                    -- Se não existe, adiciona
                    if v_ja_existe = 0 then
                        -- Se não estiver, adiciona
                        v_tab_classificacao.extend();
                        v_tab_classificacao(i) := t_obj_classificacao_competicao(
                                                    p_id_competicao,
                                                    res.id,
                                                    i, 
                                                    res.id_atleta_competicao, 
                                                    res.id_delegacao,
                                                    fase.id_fase
                                                    );
                        i := i + 1;
                    end if;

                end loop;

            else

                -- Pega todos classificados da fase atual já ordenados por tempo
                for res in (
                    select r.id, r.id_atleta_competicao, a.id_delegacao
                    from resultado r
                    join atleta_competicao ac on r.id_atleta_competicao = ac.id
                    join atleta a on ac.id_atleta = a.id
                    join bateria b on b.id = r.id_bateria
                    where b.id_fase = fase.id_fase
                    and b.id_competicao = p_id_competicao
                    and r.classificacao = 'C'
                    order by tempo
                ) loop

                    -- Verifica se o atleta já está na collection
                    select count(1)
                    into v_ja_existe
                    from table(v_tab_classificacao)
                    where id_atleta_competicao = res.id_atleta_competicao;

                    -- Se não existe, adiciona
                    if v_ja_existe = 0 then
                        -- Se não estiver, adiciona
                        v_tab_classificacao.extend();
                        v_tab_classificacao(i) := t_obj_classificacao_competicao(
                                                    p_id_competicao,
                                                    res.id,
                                                    i, 
                                                    res.id_atleta_competicao, 
                                                    res.id_delegacao,
                                                    fase.id_fase
                                                  );
                        i := i + 1;
                    end if;

                end loop;

                -- Pega todos desclassificados da fase atual já ordenados por tempo
                for res in (
                    select r.id, r.id_atleta_competicao, a.id_delegacao
                    from resultado r
                    join atleta_competicao ac on r.id_atleta_competicao = ac.id
                    join atleta a on ac.id_atleta = a.id
                    join bateria b on b.id = r.id_bateria
                    where b.id_fase = fase.id_fase
                    and b.id_competicao = p_id_competicao
                    and r.classificacao = 'D'
                    order by tempo
                ) loop

                    -- Verifica se o atleta já está na collection
                    select count(1)
                    into v_ja_existe
                    from table(v_tab_classificacao)
                    where id_atleta_competicao = res.id_atleta_competicao;

                    -- Se não existe, adiciona
                    if v_ja_existe = 0 then
                        -- Se não estiver, adiciona
                        v_tab_classificacao.extend();
                        v_tab_classificacao(i) := t_obj_classificacao_competicao(
                                                    p_id_competicao,
                                                    res.id,
                                                    i, 
                                                    res.id_atleta_competicao, 
                                                    res.id_delegacao,
                                                    fase.id_fase
                                                    );
                        i := i + 1;
                    end if;

                end loop;

            end if;

        -- Se for em equipe
        else

            if v_avaliacao = 'P' then

                -- Pega todos classificados da fase atual já ordenados
                for res in (
                    select r.id, r.id_delegacao
                    from resultado r
                    join pontuacao p on p.id_resultado = r.id
                    join bateria b on b.id = r.id_bateria
                    where b.id_fase = fase.id_fase
                    and b.id_competicao = p_id_competicao
                    and r.classificacao = 'C'
                    order by p.nota desc
                ) loop

                    -- Verifica se o atleta já está na collection
                    select count(1)
                    into v_ja_existe
                    from table(v_tab_classificacao)
                    where id_delegacao = res.id_delegacao;

                    -- Se não existe, adiciona
                    if v_ja_existe = 0 then
                        -- Se não estiver, adiciona
                        v_tab_classificacao.extend();
                        v_tab_classificacao(i) := t_obj_classificacao_competicao(
                                                    p_id_competicao,
                                                    res.id,
                                                    i, 
                                                    null, 
                                                    res.id_delegacao,
                                                    fase.id_fase
                                                    );
                        i := i + 1;
                    end if;

                end loop;

                -- Pega todos desclassificados da fase atual já ordenados
                for res in (
                    select r.id, r.id_delegacao
                    from resultado r
                    join pontuacao p on p.id_resultado = r.id
                    join bateria b on b.id = r.id_bateria
                    where b.id_fase = fase.id_fase
                    and b.id_competicao = p_id_competicao
                    and r.classificacao = 'D'
                    order by p.nota desc
                ) loop

                    -- Verifica se o atleta já está na collection
                    select count(1)
                    into v_ja_existe
                    from table(v_tab_classificacao)
                    where id_delegacao = res.id_delegacao;

                    -- Se não existe, adiciona
                    if v_ja_existe = 0 then
                        -- Se não estiver, adiciona
                        v_tab_classificacao.extend();
                        v_tab_classificacao(i) := t_obj_classificacao_competicao(
                                                    p_id_competicao,
                                                    res.id,
                                                    i, 
                                                    null, 
                                                    res.id_delegacao,
                                                    fase.id_fase
                                                    );
                        i := i + 1;
                    end if;

                end loop;

            else

                -- Pega todos classificados da fase atual já ordenados
                for res in (
                    select r.id, r.id_delegacao
                    from resultado r
                    join bateria b on b.id = r.id_bateria
                    where b.id_fase = fase.id_fase
                    and b.id_competicao = p_id_competicao
                    and r.classificacao = 'C'
                    order by tempo
                ) loop

                    -- Verifica se o atleta já está na collection
                    select count(1)
                    into v_ja_existe
                    from table(v_tab_classificacao)
                    where id_delegacao = res.id_delegacao;

                    -- Se não existe, adiciona
                    if v_ja_existe = 0 then
                        -- Se não estiver, adiciona
                        v_tab_classificacao.extend();
                        v_tab_classificacao(i) := t_obj_classificacao_competicao(
                                                    p_id_competicao,
                                                    res.id,
                                                    i, 
                                                    null, 
                                                    res.id_delegacao,
                                                    fase.id_fase
                                                    );
                        i := i + 1;
                    end if;

                end loop;

                -- Pega todos desclassificados da fase atual já ordenados
                for res in (
                    select r.id, r.id_delegacao
                    from resultado r
                    join bateria b on b.id = r.id_bateria
                    where b.id_fase = fase.id_fase
                    and b.id_competicao = p_id_competicao
                    and r.classificacao = 'D'
                    order by tempo
                ) loop

                    -- Verifica se o atleta já está na collection
                    select count(1)
                    into v_ja_existe
                    from table(v_tab_classificacao)
                    where id_delegacao = res.id_delegacao;

                    -- Se não existe, adiciona
                    if v_ja_existe = 0 then
                        -- Se não estiver, adiciona
                        v_tab_classificacao.extend();
                        v_tab_classificacao(i) := t_obj_classificacao_competicao(
                                                    p_id_competicao,
                                                    res.id,
                                                    i, 
                                                    null, 
                                                    res.id_delegacao,
                                                    fase.id_fase
                                                    );
                        i := i + 1;
                    end if;

                end loop;

            end if;

        end if;

    end loop;

    delete from resultado_competicao
    where id_competicao = p_id_competicao;

    for i in 1..v_tab_classificacao.count loop
        insert into resultado_competicao (id_competicao, id_resultado, colocacao, id_atleta_competicao, id_delegacao, id_fase)
        values (
            v_tab_classificacao(i).id_competicao,
            v_tab_classificacao(i).id_resultado,
            v_tab_classificacao(i).colocacao,
            v_tab_classificacao(i).id_atleta_competicao,
            v_tab_classificacao(i).id_delegacao,
            v_tab_classificacao(i).id_fase
        );
    end loop;

end "PROC_RESULTADO_COMPETICAO";
/