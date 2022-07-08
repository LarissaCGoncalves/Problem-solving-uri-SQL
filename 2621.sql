SELECT
    products.name
FROM
    products
        INNER JOIN providers
            ON products.id_providers = providers.id
WHERE
    products.amount BETWEEN 10 AND 20 AND providers.name LIKE 'P%'