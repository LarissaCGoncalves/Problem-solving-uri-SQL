SELECT
    customers.name
FROM
    customers
        LEFT JOIN legal_person
        ON customers.id = legal_person.id_customers
WHERE
    legal_person IS NOT NULL