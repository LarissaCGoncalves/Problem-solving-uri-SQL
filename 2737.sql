SELECT
        name,
        customers_number
    FROM
    (
        SELECT
            name,
            customers_number,
            1 AS sequence
        FROM
            lawyers
        WHERE
            customers_number = (SELECT MAX(customers_number) FROM lawyers)
                OR customers_number = (SELECT MIN(customers_number) FROM lawyers)
        UNION
        SELECT
            'Average',
            ROUND(AVG(customers_number), 0),
            2 AS sequence
        FROM
            lawyers
    ) AS tableSource
    ORDER BY
        sequence,
		name