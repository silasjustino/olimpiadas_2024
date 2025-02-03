create or replace type t_obj_classificacao_competicao 
as object(id_competicao number, id_resultado number, colocacao number, id_atleta_competicao number, id_delegacao number, id_fase number)
/
create or replace type t_tab_classificacao_competicao as table of t_obj_classificacao_competicao

