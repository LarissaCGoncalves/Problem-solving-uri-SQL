SELECT
    p.name AS product,
    c.name AS category
FROM
    products p
        INNER JOIN categories c
            ON p.id_categories = c.id
WHERE
    p.amount > 100 AND c.id IN (1, 2, 3, 6, 9)
ORDER BY
    c.id ASC