-- Gerado por Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   em:        2024-11-09 18:51:47 BRT
--   site:      Oracle Database 21c
--   tipo:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE atleta (
    id               NUMBER NOT NULL,
    nome             VARCHAR2(200) NOT NULL,
    num_documento    NUMBER NOT NULL,
    id_categoria     NUMBER NOT NULL,
    id_delegacao     NUMBER NOT NULL,
    data_nascimento  DATE NOT NULL,
    nacionalidade    VARCHAR2(200) NOT NULL,
    peso             NUMBER NOT NULL,
    altura           NUMBER NOT NULL,
    foto             BLOB,
    filename_foto    VARCHAR2(400),
    mimetype_foto    VARCHAR2(255),
    img_lst_upd_foto DATE
);

ALTER TABLE atleta ADD CONSTRAINT atleta_pk PRIMARY KEY ( id );

ALTER TABLE atleta ADD CONSTRAINT atleta_un UNIQUE ( num_documento );

CREATE TABLE atleta_competicao (
    id            NUMBER NOT NULL,
    id_atleta     NUMBER NOT NULL,
    id_competicao NUMBER NOT NULL
);

ALTER TABLE atleta_competicao ADD CONSTRAINT atleta_competicao_pk PRIMARY KEY ( id );

ALTER TABLE atleta_competicao ADD CONSTRAINT atleta_competicao_un UNIQUE ( id_atleta,
                                                                           id_competicao );

CREATE TABLE bateria (
    id            NUMBER NOT NULL,
    id_competicao NUMBER NOT NULL,
    id_fase       NUMBER NOT NULL,
    dsc_bateria   VARCHAR2(100) NOT NULL,
    data          DATE NOT NULL,
    horario       NUMBER NOT NULL,
    duracao       NUMBER NOT NULL
);

ALTER TABLE bateria ADD CONSTRAINT bateria_pk PRIMARY KEY ( id );

CREATE TABLE categoria (
    id   NUMBER NOT NULL,
    sexo VARCHAR2(100) NOT NULL
);

ALTER TABLE CATEGORIA 
    ADD CONSTRAINT CATEGORIA_CK_SEXO 
    CHECK ( sexo IN ( 'Masculino', 'Feminino' );)
;
ALTER TABLE categoria ADD CONSTRAINT categoria_pk PRIMARY KEY ( id );

ALTER TABLE categoria ADD CONSTRAINT categoria_un UNIQUE ( sexo );

CREATE TABLE competicao (
    id            NUMBER NOT NULL,
    id_modalidade NUMBER NOT NULL,
    id_fase       NUMBER NOT NULL,
    id_local      NUMBER NOT NULL,
    id_situacao   NUMBER NOT NULL
);

ALTER TABLE competicao ADD CONSTRAINT competicao_pk PRIMARY KEY ( id );

ALTER TABLE competicao ADD CONSTRAINT competicao_un UNIQUE ( id_modalidade );

CREATE TABLE delegacao (
    id                   NUMBER NOT NULL,
    pais                 VARCHAR2(200) NOT NULL,
    bandeira             BLOB,
    filename_bandeira    VARCHAR2(400),
    mimetype_bandeira    VARCHAR2(255),
    img_lst_upd_bandeira DATE
);

ALTER TABLE delegacao ADD CONSTRAINT delegacao_pk PRIMARY KEY ( id );

ALTER TABLE delegacao ADD CONSTRAINT delegacao_un UNIQUE ( pais );

CREATE TABLE doping (
    id            NUMBER NOT NULL,
    id_atleta     NUMBER NOT NULL,
    id_competicao NUMBER NOT NULL,
    id_kit_doping NUMBER NOT NULL,
    resultado     VARCHAR2(20)
);

ALTER TABLE doping ADD CONSTRAINT doping_pk PRIMARY KEY ( id );

ALTER TABLE doping ADD CONSTRAINT doping_un UNIQUE ( id_atleta,
                                                     id_competicao );

CREATE TABLE esporte (
    id          NUMBER NOT NULL,
    dsc_esporte VARCHAR2(100) NOT NULL
);

ALTER TABLE esporte ADD CONSTRAINT esporte_pk PRIMARY KEY ( id );

ALTER TABLE esporte ADD CONSTRAINT esporte_un UNIQUE ( dsc_esporte );

CREATE TABLE fase (
    id       NUMBER NOT NULL,
    dsc_fase VARCHAR2(100) NOT NULL
);

ALTER TABLE fase ADD CONSTRAINT fase_pk PRIMARY KEY ( id );

ALTER TABLE fase ADD CONSTRAINT fase_un UNIQUE ( dsc_fase );

CREATE TABLE jurado (
    id               NUMBER NOT NULL,
    nome             VARCHAR2(200) NOT NULL,
    num_certificacao VARCHAR2(100) NOT NULL,
    foto             BLOB,
    filename_foto    VARCHAR2(400),
    mimetype_foto    VARCHAR2(255),
    img_lst_upd_foto DATE
);

ALTER TABLE jurado ADD CONSTRAINT jurado_pk PRIMARY KEY ( id );

ALTER TABLE jurado ADD CONSTRAINT jurado_un UNIQUE ( num_certificacao );

CREATE TABLE jurado_bateria (
    id         NUMBER NOT NULL,
    id_jurado  NUMBER NOT NULL,
    id_bateria NUMBER NOT NULL
);

ALTER TABLE jurado_bateria ADD CONSTRAINT jurado_bateria_pk PRIMARY KEY ( id );

ALTER TABLE jurado_bateria ADD CONSTRAINT jurado_bateria_un UNIQUE ( id_jurado,
                                                                     id_bateria );

CREATE TABLE kit_doping (
    id                NUMBER NOT NULL,
    num_identificacao NUMBER NOT NULL,
    responsavel       VARCHAR2(200) NOT NULL
);

ALTER TABLE kit_doping ADD CONSTRAINT kit_doping PRIMARY KEY ( id );

ALTER TABLE kit_doping ADD CONSTRAINT kit_doping_un UNIQUE ( num_identificacao );

CREATE TABLE local (
    id        NUMBER NOT NULL,
    dsc_local VARCHAR2(200) NOT NULL,
    endereco  VARCHAR2(200) NOT NULL
);

ALTER TABLE local ADD CONSTRAINT local_pk PRIMARY KEY ( id );

ALTER TABLE local ADD CONSTRAINT local_un UNIQUE ( dsc_local );

CREATE TABLE membro (
    id               NUMBER NOT NULL,
    nome             VARCHAR2(200) NOT NULL,
    num_documento    NUMBER NOT NULL,
    id_delegacao     NUMBER NOT NULL,
    data_nascimento  DATE NOT NULL,
    nacionalidade    VARCHAR2(200) NOT NULL,
    foto             BLOB,
    filename_foto    VARCHAR2(400),
    mimetype_foto    VARCHAR2(255),
    img_lst_upd_foto DATE
);

ALTER TABLE membro ADD CONSTRAINT membro_pk PRIMARY KEY ( id );

ALTER TABLE membro ADD CONSTRAINT membro_un UNIQUE ( num_documento );

CREATE TABLE modalidade (
    id             NUMBER NOT NULL,
    id_esporte     NUMBER NOT NULL,
    dsc_modalidade VARCHAR2(100) NOT NULL,
    id_categoria   NUMBER NOT NULL
);

ALTER TABLE modalidade ADD CONSTRAINT modalidade_pk PRIMARY KEY ( id );

ALTER TABLE modalidade
    ADD CONSTRAINT modalidade_un UNIQUE ( id_esporte,
                                          dsc_modalidade,
                                          id_categoria );

CREATE TABLE pontuacao (
    id           NUMBER NOT NULL,
    id_resultado NUMBER NOT NULL,
    id_jurado    NUMBER NOT NULL,
    nota         NUMBER NOT NULL
);

ALTER TABLE pontuacao ADD CONSTRAINT pontuacao_pk PRIMARY KEY ( id );

ALTER TABLE pontuacao ADD CONSTRAINT pontuacao_un UNIQUE ( id_resultado,
                                                           id_jurado );

CREATE TABLE resultado (
    id                   NUMBER NOT NULL,
    id_atleta_competicao NUMBER NOT NULL,
    id_bateria           NUMBER NOT NULL,
    colocacao            NUMBER,
    tempo                NUMBER
);

ALTER TABLE resultado ADD CONSTRAINT resultado_pk PRIMARY KEY ( id );

ALTER TABLE resultado ADD CONSTRAINT resultado_un UNIQUE ( id_atleta_competicao,
                                                           id_bateria );

CREATE TABLE situacao (
    id           NUMBER NOT NULL,
    dsc_situacao VARCHAR2(100) NOT NULL
);

ALTER TABLE situacao ADD CONSTRAINT situacao_pk PRIMARY KEY ( id );

ALTER TABLE situacao ADD CONSTRAINT situacao_un UNIQUE ( dsc_situacao );

ALTER TABLE atleta
    ADD CONSTRAINT atleta_categoria_fk FOREIGN KEY ( id_categoria )
        REFERENCES categoria ( id );

ALTER TABLE atleta_competicao
    ADD CONSTRAINT atleta_competicao_atleta_fk FOREIGN KEY ( id_atleta )
        REFERENCES atleta ( id );

ALTER TABLE atleta_competicao
    ADD CONSTRAINT atleta_competicao_comp_fk FOREIGN KEY ( id_competicao )
        REFERENCES competicao ( id );

ALTER TABLE atleta
    ADD CONSTRAINT atleta_delegacao_fk FOREIGN KEY ( id_delegacao )
        REFERENCES delegacao ( id );

ALTER TABLE bateria
    ADD CONSTRAINT bateria_competicao_fk FOREIGN KEY ( id_competicao )
        REFERENCES competicao ( id );

ALTER TABLE bateria
    ADD CONSTRAINT bateria_fase_fk FOREIGN KEY ( id_fase )
        REFERENCES fase ( id );

ALTER TABLE competicao
    ADD CONSTRAINT competicao_fase_fk FOREIGN KEY ( id_fase )
        REFERENCES fase ( id );

ALTER TABLE competicao
    ADD CONSTRAINT competicao_local_fk FOREIGN KEY ( id_local )
        REFERENCES local ( id );

ALTER TABLE competicao
    ADD CONSTRAINT competicao_modalidade_fk FOREIGN KEY ( id_modalidade )
        REFERENCES modalidade ( id );

ALTER TABLE competicao
    ADD CONSTRAINT competicao_situacao_fk FOREIGN KEY ( id_situacao )
        REFERENCES situacao ( id );

ALTER TABLE doping
    ADD CONSTRAINT doping_atleta_fk FOREIGN KEY ( id_atleta )
        REFERENCES atleta ( id );

ALTER TABLE doping
    ADD CONSTRAINT doping_competicao_fk FOREIGN KEY ( id_competicao )
        REFERENCES competicao ( id );

ALTER TABLE doping
    ADD CONSTRAINT doping_kit_doping_fk FOREIGN KEY ( id_kit_doping )
        REFERENCES kit_doping ( id );

ALTER TABLE jurado_bateria
    ADD CONSTRAINT jurado_bateria_bateria_fk FOREIGN KEY ( id_bateria )
        REFERENCES bateria ( id );

ALTER TABLE jurado_bateria
    ADD CONSTRAINT jurado_bateria_jurado_fk FOREIGN KEY ( id_jurado )
        REFERENCES jurado ( id );

ALTER TABLE membro
    ADD CONSTRAINT membro_delegacao_fk FOREIGN KEY ( id_delegacao )
        REFERENCES delegacao ( id );

ALTER TABLE modalidade
    ADD CONSTRAINT modalidade_categoria_fk FOREIGN KEY ( id_categoria )
        REFERENCES categoria ( id );

ALTER TABLE modalidade
    ADD CONSTRAINT modalidade_esporte_fk FOREIGN KEY ( id_esporte )
        REFERENCES esporte ( id );

ALTER TABLE pontuacao
    ADD CONSTRAINT pontuacao_jurado_fk FOREIGN KEY ( id_jurado )
        REFERENCES jurado ( id );

ALTER TABLE pontuacao
    ADD CONSTRAINT pontuacao_resultado_fk FOREIGN KEY ( id_resultado )
        REFERENCES resultado ( id );

ALTER TABLE resultado
    ADD CONSTRAINT resultado_atleta_competicao_fk FOREIGN KEY ( id_atleta_competicao )
        REFERENCES atleta_competicao ( id );

ALTER TABLE resultado
    ADD CONSTRAINT resultado_bateria_fk FOREIGN KEY ( id_bateria )
        REFERENCES bateria ( id );

CREATE SEQUENCE atleta_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER atleta_id_trg BEFORE
    INSERT ON atleta
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := atleta_id_seq.nextval;
END;
/

CREATE SEQUENCE atleta_competicao_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER atleta_competicao_id_trg BEFORE
    INSERT ON atleta_competicao
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := atleta_competicao_id_seq.nextval;
END;
/

CREATE SEQUENCE bateria_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER bateria_id_trg BEFORE
    INSERT ON bateria
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := bateria_id_seq.nextval;
END;
/

CREATE SEQUENCE categoria_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER categoria_id_trg BEFORE
    INSERT ON categoria
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := categoria_id_seq.nextval;
END;
/

CREATE SEQUENCE competicao_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER competicao_id_trg BEFORE
    INSERT ON competicao
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := competicao_id_seq.nextval;
END;
/

CREATE SEQUENCE delegacao_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER delegacao_id_trg BEFORE
    INSERT ON delegacao
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := delegacao_id_seq.nextval;
END;
/

CREATE SEQUENCE doping_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER doping_id_trg BEFORE
    INSERT ON doping
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := doping_id_seq.nextval;
END;
/

CREATE SEQUENCE esporte_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER esporte_id_trg BEFORE
    INSERT ON esporte
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := esporte_id_seq.nextval;
END;
/

CREATE SEQUENCE fase_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER fase_id_trg BEFORE
    INSERT ON fase
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := fase_id_seq.nextval;
END;
/

CREATE SEQUENCE jurado_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER jurado_id_trg BEFORE
    INSERT ON jurado
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := jurado_id_seq.nextval;
END;
/

CREATE SEQUENCE jurado_bateria_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER jurado_bateria_id_trg BEFORE
    INSERT ON jurado_bateria
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := jurado_bateria_id_seq.nextval;
END;
/

CREATE SEQUENCE kit_doping_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER kit_doping_id_trg BEFORE
    INSERT ON kit_doping
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := kit_doping_id_seq.nextval;
END;
/

CREATE SEQUENCE kit_doping_num_identificacao START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER kit_doping_num_identificacao BEFORE
    INSERT ON kit_doping
    FOR EACH ROW
    WHEN ( new.num_identificacao IS NULL )
BEGIN
    :new.num_identificacao := kit_doping_num_identificacao.nextval;
END;
/

CREATE SEQUENCE local_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER local_id_trg BEFORE
    INSERT ON local
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := local_id_seq.nextval;
END;
/

CREATE SEQUENCE membro_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER membro_id_trg BEFORE
    INSERT ON membro
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := membro_id_seq.nextval;
END;
/

CREATE SEQUENCE modalidade_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER modalidade_id_trg BEFORE
    INSERT ON modalidade
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := modalidade_id_seq.nextval;
END;
/

CREATE SEQUENCE pontuacao_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER pontuacao_id_trg BEFORE
    INSERT ON pontuacao
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := pontuacao_id_seq.nextval;
END;
/

CREATE SEQUENCE resultado_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER resultado_id_trg BEFORE
    INSERT ON resultado
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := resultado_id_seq.nextval;
END;
/

CREATE SEQUENCE situacao_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER situacao_id_trg BEFORE
    INSERT ON situacao
    FOR EACH ROW
    WHEN ( new.id IS NULL )
BEGIN
    :new.id := situacao_id_seq.nextval;
END;
/



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            18
-- CREATE INDEX                             0
-- ALTER TABLE                             58
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                          19
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                         19
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
