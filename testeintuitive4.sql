SELECT 
    o.nome_fantasia,
    d.registro_ans,
    SUM(d.valor_final) AS total_despesas
FROM demonstrativos d
JOIN operadoras o ON d.registro_ans = o.registro_ans
WHERE d.descricao_conta LIKE '%SINISTROS CONHECIDOS OU AVISADOS%'
  AND d.descricao_conta LIKE '%ASSISTÊNCIA A SAÚDE%'
  AND QUARTER(d.data_registro) = QUARTER(CURDATE())
  AND YEAR(d.data_registro) = YEAR(CURDATE())
GROUP BY o.nome_fantasia, d.registro_ans
ORDER BY total_despesas DESC
LIMIT 10;