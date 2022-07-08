SELECT
    name,
    (CASE
        WHEN type = 'A' THEN 20.0
        WHEN type = 'B' THEN 70.0
        WHEN type = 'C' THEN 530.5
        ELSE NULL
        END) AS price
FROM
    products
ORDER BY
    type,
    id DESC