SELECT
    products.name,
    providers.name,
    products.price
FROM
    products
        INNER JOIN providers
            ON products.id_providers = providers.id
        INNER JOIN categories
            ON products.id_categories = categories.id
WHERE
    products.price > 1000.0 and categories.name = 'Super Luxury'