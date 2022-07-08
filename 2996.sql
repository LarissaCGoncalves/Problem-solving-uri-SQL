SELECT
	p.year,
	sender.name AS sender,
	receiver.name AS receiver
FROM
	packages p
		INNER JOIN users AS sender
		    ON p.id_user_sender = sender.id
		INNER JOIN users AS receiver
		    ON p.id_user_receiver = receiver.id
WHERE
	(p.color = 'blue' OR p.year = 2015)
	AND
	(sender.address != 'Taiwan' AND receiver.address !='Taiwan')
ORDER BY
	p.year DESC