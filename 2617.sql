SELECT
    products.name AS products,
    providers.name AS providers
FROM
    products
        INNER JOIN providers
            ON products.id_providers = providers.id
WHERE
    providers.name = 'Ajax SA'