SELECT
    name,
    CAST((EXTRACT(DAY FROM payday)) as INT) AS day
FROM
    loan