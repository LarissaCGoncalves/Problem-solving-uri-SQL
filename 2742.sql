SELECT
    lr.name,
    ROUND((lr.omega * 1.618), 3) AS "Fator N"
FROM
    dimensions d
        INNER JOIN life_registry lr
            ON d.id = lr.dimensions_id
WHERE
    lr.name LIKE '%Richard%' AND d.name IN ('C875', 'C774')
ORDER BY
    lr.omega