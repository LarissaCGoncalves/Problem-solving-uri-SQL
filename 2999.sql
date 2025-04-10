WITH
	base AS 
	(SELECT
		emp.matr,
		emp.nome,
     	emp.lotacao_div,
		div.cod_divisao,
		(tsalario.salario - tdescontos.descontos) AS salario
	FROM
		empregado emp
		INNER JOIN divisao div ON emp.lotacao_div = div.cod_divisao
			INNER JOIN (SELECT
				emp.matr,
				COALESCE(SUM(v.valor), 0) AS salario
			FROM
				empregado emp
					LEFT JOIN emp_venc ON emp.matr = emp_venc.matr
					LEFT JOIN vencimento v ON emp_venc.cod_venc = v.cod_venc
			GROUP BY
				emp.matr
			) AS tsalario ON emp.matr = tsalario.matr
			INNER JOIN (SELECT
				emp.matr,
				COALESCE(SUM(desconto.valor), 0) AS descontos
			FROM
				empregado emp
					LEFT JOIN emp_desc ON emp.matr = emp_desc.matr
					LEFT JOIN desconto ON emp_desc.cod_desc = desconto.cod_desc
			GROUP BY
				emp.matr
			) AS tdescontos ON emp.matr = tdescontos.matr
	GROUP BY 
		emp.matr,
		emp.nome,
		div.cod_divisao,
    	emp.lotacao_div,
		tsalario.salario,
		tdescontos.descontos),
	media_salarial AS 
	(SELECT
		ROUND(AVG(base.salario), 2) AS media,
		div.cod_divisao
	FROM
		base
			INNER JOIN divisao div ON base.cod_divisao = div.cod_divisao
	GROUP BY
		div.cod_divisao
	)
SELECT
	base.nome,
	base.salario
FROM
	base
		INNER JOIN divisao div ON div.cod_divisao = base.cod_divisao
		INNER JOIN media_salarial ms ON div.cod_divisao = ms.cod_divisao
WHERE
	salario >= ms.media AND salario > 8000
ORDER BY
	base.lotacao_div, base.nome
