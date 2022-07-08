SELECT 
	d.nome AS "Departamento", emp.nome AS "Empregado", t1.Salario_Bruto, t2.Total_Desconto, (t1.Salario_Bruto - t2.Total_Desconto) AS Salario_Liquido
FROM
	empregado emp
		INNER JOIN departamento d ON emp.lotacao = d.cod_dep
		INNER JOIN (
			SELECT
				emp.matr,
				COALESCE(SUM(v.valor), 0) AS Salario_Bruto
			FROM
				empregado emp
					LEFT JOIN emp_venc ON emp.matr = emp_venc.matr
					LEFT JOIN vencimento v ON emp_venc.cod_venc = v.cod_venc
			GROUP BY
				emp.matr
			) AS t1 ON emp.matr = t1.matr
		INNER JOIN (
			SELECT
				emp.matr,
				COALESCE(SUM(desconto.valor), 0) AS Total_Desconto
			FROM
				empregado emp
					LEFT JOIN emp_desc ON emp.matr = emp_desc.matr
					LEFT JOIN desconto ON emp_desc.cod_desc = desconto.cod_desc
			GROUP BY
				emp.matr
			) AS t2 ON emp.matr = t2.matr
GROUP BY
	emp.matr,
	d.nome,
	emp.nome,
	t1.Salario_Bruto,
	t2.Total_Desconto
ORDER BY
	(t1.Salario_Bruto - t2.Total_Desconto) DESC