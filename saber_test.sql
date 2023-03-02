/*
history
issue_key – уникальный ключ задачи
status – статус задачи
minutes_in_status – количество минут, которое задача находилась в статусе
previous_status – предыдущий статус задачи
started_at – время создания статуса задачи, unix миллисекунды 
ended_at – время перехода задачи в другой статус, unix миллисекунды 
*/

/*
SQL 1
Напишите запрос, который выведет, сколько времени в среднем задачи каждой группы находятся в статусе “Open” 
Условия:
Под группой подразумевается первый символ в ключе задачи. Например, для ключа “C-40460” группой будет “C”
Задача может переходить в один и тот же статус несколько раз.
Переведите время в часы с округлением до двух знаков после запятой.
*/

SELECT issue_key, ROUND(AVG(minutes_in_status) / 60, 2) as 'avg_hours'
FROM (
	SELECT issue_key, minutes_in_status, SUBSTRING(issue_key, 1, 1) as 'groups'
	FROM history
	WHERE history.status == 'Open'
	) AS request1
GROUP BY request1.groups


/*
SQL 2 
Напишите запрос, который выведет ключ задачи, последний статус и его время создания для задач, которые открыты на данный момент времени.
Условия:
Открытыми считаются задачи, у которых последний статус в момент времени не “Closed” и не “Resolved”
Задача может переходить в один и тот же статус несколько раз.
Оформите запрос таким образом, чтобы, изменив дату, его можно было использовать для поиска открытых задач в любой момент времени в прошлом
Переведите время в текстовое представление
*/


SELECT issue_key, status, date_start
FROM (
	SELECT *, 
		ROW_NUMBER() OVER(PARTITION BY issue_key ORDER BY started_at DESC) AS 'row_num',
		DATETIME(SUBSTRING(started_at, 1, 10), 'unixepoch') AS 'date_start'
	FROM history
	) AS request1
WHERE row_num == 1
	AND status NOT IN('Closed', 'Resolved')
	AND date_start BETWEEN '2022-01-01' AND '2022-12-31' -- УСТНАНОВИТЬ ИНТЕРВАЛ ДЛЯ ПРОСМОТРА
ORDER BY issue_key



