SELECT
    name,
    CAST((salary * 0.1) AS NUMERIC(10,2)) AS tax
FROM
    people
WHERE
    salary > 3000