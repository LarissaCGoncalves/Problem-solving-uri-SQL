SELECT
    c.name,
    r.rentals_date
FROM
    customers c
        INNER JOIN rentals r
            ON c.id = r.id_customers
WHERE
    r.rentals_date BETWEEN '2016-09-01' AND '2016-09-30'