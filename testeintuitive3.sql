DROP TABLE IF EXISTS operadoras;

CREATE TABLE operadoras (
    registro_ans              VARCHAR(10) PRIMARY KEY,
    cnpj                      VARCHAR(20),
    razao_social              VARCHAR(255),
    nome_fantasia             VARCHAR(255),
    modalidade                VARCHAR(100),
    logradouro                VARCHAR(255),
    numero                    VARCHAR(20),
    complemento               VARCHAR(100),
    bairro                    VARCHAR(100),
    cidade                    VARCHAR(100),
    uf                        CHAR(2),
    cep                       VARCHAR(15),
    ddd                       VARCHAR(5),
    telefone                  VARCHAR(20),
    fax                       VARCHAR(20),
    endereco_eletronico       VARCHAR(255),
    representante             VARCHAR(255),
    cargo_representante       VARCHAR(100),
    regiao_de_comercializacao VARCHAR(255),
    data_registro_ans         DATE
);

LOAD DATA LOCAL INFILE '/caminho/para/Relatorio_cadop.csv'
INTO TABLE operadoras
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(
    registro_ans,
    cnpj,
    razao_social,
    nome_fantasia,
    modalidade,
    logradouro,
    numero,
    complemento,
    bairro,
    cidade,
    uf,
    cep,
    ddd,
    telefone,
    fax,
    endereco_eletronico,
    representante,
    cargo_representante,
    regiao_de_comercializacao,
    data_registro_ans
);