DROP TABLE IF EXISTS demonstrativos;

CREATE TABLE demonstrativos (
    data_registro       DATE,
    registro_ans        VARCHAR(10),
    codigo_conta        VARCHAR(20),
    descricao_conta     TEXT,
    valor_saldo_1       DECIMAL(15,2),
    valor_saldo_2       DECIMAL(15,2),
    valor_final         DECIMAL(15,2)
);
SELECT * FROM demonstrativos;