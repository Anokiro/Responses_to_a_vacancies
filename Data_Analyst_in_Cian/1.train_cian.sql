/*
Задание 1

Произведение
| id | Название |
Издание
| id | id_произведения | год_издания | кол-во_страниц |
Экземпляр
| id | id_издание | инвентаризационный_номер |
Лог операций
| id | id_user | id_экземпляр | дата_взяли | дата_вернули |
Для каждого пользователя найти последние три взятые им произведения.
Для каждого такого произведения указать сколько всего раз его брали (за все
время).

*/
DROP DATABASE IF EXISTS train_cian;
CREATE DATABASE train_cian;
USE train_cian;


DROP TABLE IF EXISTS book_title;
CREATE TABLE book_title (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	name VARCHAR(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS publication;
CREATE TABLE publication (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	book_title_id BIGINT UNSIGNED,
	published_in VARCHAR(100),
	num_pages SMALLINT,
	
	FOREIGN KEY (book_title_id) REFERENCES book_title(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS exemplar;
CREATE TABLE exemplar (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	publication_id BIGINT UNSIGNED,
	inventory_num BIGINT UNSIGNED NOT NULL,
	
	FOREIGN KEY (publication_id) REFERENCES publication(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_user BIGINT UNSIGNED NOT NULL,
	exemplar_id BIGINT UNSIGNED,
	take_date DATE,
	return_date DATE,
	
	FOREIGN KEY (exemplar_id) REFERENCES exemplar(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO book_title VALUES
(NULL, 'Мастер и Маргарита'),
(NULL, 'Ася'),
(NULL, 'Мертвые души'),
(NULL, 'Хождение по мукам'),
(NULL, 'Записки охотника'),
(NULL, 'Война и мир'),
(NULL, 'Левша'),
(NULL, 'Двенадцать стульев'),
(NULL, 'Обыкновенная история'),
(NULL, 'Герой нашего времени'),
(NULL, 'Записки из Мертвого дома'),
(NULL, 'Палата №6'),
(NULL, 'Мцыри'),
(NULL, 'Преступление и наказание'),
(NULL, 'Голова профессора Доуэля');

	
INSERT INTO publication VALUES
(NULL, 1, '1929', 256),
(NULL, 2, '1858', 259),
(NULL, 3, '1842', 300),
(NULL, 4, '1922', 350),
(NULL, 5, '1852', 360),
(NULL, 6, '1865', 420),
(NULL, 7, '1881', 450),
(NULL, 8, '1928', 500),
(NULL, 9, '1847', 236),
(NULL, 10, '1839', 355),
(NULL, 11, '1860', 652),
(NULL, 12, '1892', 544),
(NULL, 13, '1840', 333),
(NULL, 14, '1866', 489),
(NULL, 15, '1925', 354);

INSERT INTO exemplar VALUES
(NULL, 1, 1263),
(NULL, 2, 1355),
(NULL, 3, 1466),
(NULL, 4, 1653),
(NULL, 5, 2763),
(NULL, 6, 2863),
(NULL, 7, 2963),
(NULL, 8, 3163),
(NULL, 9, 3293),
(NULL, 10, 3353),
(NULL, 11, 3661),
(NULL, 12, 4164),
(NULL, 13, 4665),
(NULL, 14, 4763),
(NULL, 15, 5663),
(NULL, 1, 5763),
(NULL, 2, 5855),
(NULL, 3, 5966),
(NULL, 4, 6153),
(NULL, 5, 6263);


INSERT INTO logs VALUES
(NULL, 1, 1, '2021-01-26', '2021-05-26'),
(NULL, 2, 1, '2021-05-27', '2021-06-20'),
(NULL, 3, 1, '2021-10-11', '2021-12-01'),

(NULL, 1, 3, '2021-02-26', '2021-07-05'),
(NULL, 5, 3, '2021-07-10', '2021-07-25'),

(NULL, 1, 5, '2021-03-10', '2021-04-21'),
(NULL, 4, 5, '2021-05-16', '2021-06-17'),
(NULL, 3, 5, '2021-06-18', '2021-06-26'),
(NULL, 1, 5, '2021-06-26', '2021-09-26'),

(NULL, 1, 6, '2021-03-10', NULL),

(NULL, 2, 7, '2021-01-10', NULL),
 -- некоторые читатели брали несколько раз одну и ту же книгу
(NULL, 2, 8, '2021-01-10', '2021-05-10'),
(NULL, 4, 8, '2021-05-15', '2021-06-10'),
(NULL, 4, 8, '2021-07-09', '2021-12-13'),
(NULL, 2, 8, '2021-12-13', '2021-12-29'),

(NULL, 2, 9, '2021-02-13', '2021-05-29'),
(NULL, 3, 9, '2021-06-13', '2021-10-27'),

(NULL, 3, 10, '2021-01-08', '2021-10-27'),
(NULL, 4, 10, '2021-10-27', '2021-11-27'),
(NULL, 2, 10, '2021-11-27', '2021-12-27'),

(NULL, 5, 11, '2021-08-20', '2021-09-27'),
(NULL, 3, 11, '2021-09-29', '2021-10-21'),
(NULL, 1, 11, '2021-10-22', NULL),

(NULL, 5, 12, '2021-03-03', '2021-06-22'),
(NULL, 5, 13, '2021-06-28', '2021-11-22'),
(NULL, 4, 16, '2021-11-22', '2021-12-26'),

(NULL, 4, 18, '2021-02-02', '2021-03-25'),
(NULL, 5, 18, '2021-04-02', '2021-09-24'),
(NULL, 2, 18, '2021-09-26', '2021-09-29'),
(NULL, 3, 18, '2021-09-29', '2021-10-29');


-- Для каждого пользователя найти последние три взятые им произведения.
-- Для каждого такого произведения указать сколько всего раз его брали (за все время).
SELECT id_user, name, cnt_take AS 'Сколько раз брали'
FROM (
	SELECT logs.id_user, book_title.name, 
		ROW_NUMBER() OVER(PARTITION BY logs.id_user ORDER BY logs.id_user, logs.take_date DESC) AS `row_number`,
		COUNT(name) OVER(PARTITION BY name) AS cnt_take
	FROM logs
	JOIN exemplar ON logs.exemplar_id = exemplar.id
	JOIN publication ON exemplar.publication_id = publication.id
	JOIN book_title ON publication.book_title_id = book_title.id) AS request1
WHERE `row_number` <= 3
ORDER BY id_user;


/*
Задание 2

Описание таблиц:
tblClients – информация о клиентах.
ClientID – идентификатор клиента
Поле Status может принимать следующие значения:
'Active'
'Updated by client'
'Deleted'
'Passive'

tblTestClients – содержит клиентов, которые используются для тестирования
новых продуктов, этих клиентов следует исключать из статистики

tblClientBalanceOperation – транзакции покупок клиентов
BalanceOperationID – идентификатор покупки
ClientID – идентификатор клиента
Amount – сумма покупки в $
SignOfPayment – признак того, что покупка прошла успешно или безуспешно
(SignOfPayment=1 – успешная покупка)
OperationTime - дата транзакции

tblOnlineSessions_mini – отображает присутствие клиента онлайн
ClientID – идентификатор клиента
OnlineTime – дата входа на сайт
OfflineTime – дата выхода в оффлайн

*/

DROP TABLE IF EXISTS clients;
CREATE TABLE clients (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	status ENUM('Active', 'Updated by client', 'Deleted', 'Passive')
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS client_balance_operation;
CREATE TABLE client_balance_operation (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	clients_id BIGINT UNSIGNED,
	amount BIGINT UNSIGNED NOT NULL,
	sign_of_payment BIT,
	operation_time DATETIME,
	
	FOREIGN KEY (clients_id) REFERENCES clients(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

DROP TABLE IF EXISTS online_sessions_mini;
CREATE TABLE online_sessions_mini (
	clients_id BIGINT UNSIGNED,
	online_time DATETIME,
	offline_time DATETIME,
	
	FOREIGN KEY (clients_id) REFERENCES clients(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO clients VALUES
(NULL, 'Active'),
(NULL, 'Deleted'),
(NULL, 'Updated by client'),
(NULL, 'Passive'),
(NULL, 'Active'),
(NULL, 'Active'),
(NULL, 'Active'),
(NULL, 'Active'),
(NULL, 'Active'),
(NULL, 'Active'),
(NULL, 'Active'),
(NULL, 'Updated by client'),
(NULL, 'Active'),
(NULL, 'Active'),
(NULL, 'Deleted'),
(NULL, 'Active'),
(NULL, 'Active'),
(NULL, 'Active'),
(NULL, 'Active'),
(NULL, 'Updated by client'),
(NULL, 'Updated by client'),
(NULL, 'Active'),
(NULL, 'Active'),
(NULL, 'Passive'),
(NULL, 'Passive'),
(NULL, 'Passive'),
(NULL, 'Active'),
(NULL, 'Active'),
(NULL, 'Active'),
(NULL, 'Active');


INSERT INTO client_balance_operation VALUES
(NULL, 1, 10, 1, '2021-01-29 10:00:00'),
(NULL, 1, 20, 1, '2021-10-29 11:00:00'),
(NULL, 1, 20, 1, '2021-10-29 12:30:00'),
(NULL, 2, 5, 1, '2021-09-15 13:30:00'),
(NULL, 3, 100, 1, '2021-09-10 10:30:00'),
(NULL, 3, 100, 1, '2021-09-11 10:00:00'),
(NULL, 4, 120, 1, '2021-01-08 10:00:00'),
(NULL, 4, 130, 1, '2021-02-09 10:00:00'),
(NULL, 4, 100, 1, '2021-03-10 10:00:00'),
(NULL, 4, 150, 1, '2021-04-12 10:00:00'),
(NULL, 5, 50, 1, '2021-02-10 10:30:00'),
(NULL, 5, 55, 1, '2021-08-12 18:00:00'),
(NULL, 6, 50, 1, '2021-01-16 10:30:00'),
(NULL, 6, 55, 0, '2021-09-12 19:00:00'),
(NULL, 7, 15, 1, '2021-11-05 10:30:00'),
(NULL, 7, 15, 1, '2021-12-01 19:30:00'),
(NULL, 7, 66, 1, '2021-12-05 20:00:00'),
(NULL, 8, 15, 1, '2021-12-01 19:30:00'),
(NULL, 8, 66, 1, '2021-12-05 20:00:00'),
(NULL, 9, 19, 1, '2021-01-05 19:30:00'),
(NULL, 9, 64, 1, '2021-01-25 20:00:00'),
(NULL, 9, 15, 1, '2021-02-01 19:30:00'),
(NULL, 9, 78, 1, '2021-05-09 21:00:00'),
(NULL, 10, 111, 1, '2021-06-11 11:00:00'),

(NULL, 11, 9, 1, '2021-01-29 10:00:00'),
(NULL, 11, 20, 1, '2021-10-20 11:00:00'),
(NULL, 11, 8, 1, '2021-11-29 12:30:00'),
(NULL, 11, 5, 1, '2021-12-15 13:30:00'),
(NULL, 12, 110, 1, '2021-09-14 13:30:00'),
(NULL, 13, 10, 1, '2021-08-11 10:00:00'),
(NULL, 14, 12, 1, '2021-01-09 12:00:00'),
(NULL, 14, 130, 1, '2021-06-09 11:00:00'),
(NULL, 14, 16, 1, '2021-07-10 10:00:00'),
(NULL, 15, 150, 1, '2021-04-28 10:00:00'),
(NULL, 16, 22, 1, '2021-02-13 10:30:00'),
(NULL, 16, 51, 1, '2021-07-12 18:00:00'),
(NULL, 17, 50, 1, '2021-01-20 10:30:00'),
(NULL, 18, 23, 0, '2021-12-12 19:30:00'),
(NULL, 19, 15, 1, '2021-11-05 10:30:00'),
(NULL, 19, 18, 1, '2021-12-01 18:30:00'),
(NULL, 19, 14, 1, '2021-12-05 20:00:00'),
(NULL, 19, 15, 1, '2021-12-09 19:30:00'),
(NULL, 19, 13, 1, '2021-12-20 21:00:00'),
(NULL, 20, 17, 1, '2021-02-06 09:30:00'),
(NULL, 20, 69, 1, '2021-03-25 08:00:00'),
(NULL, 21, 9, 1, '2021-04-29 08:00:00'),
(NULL, 22, 9, 1, '2021-04-29 08:01:00'),
(NULL, 23, 20, 1, '2021-08-20 11:00:00'),
(NULL, 23, 8, 1, '2021-09-29 12:30:00'),
(NULL, 23, 5, 1, '2021-10-15 13:30:00'),
(NULL, 24, 110, 1, '2021-08-14 13:30:00'),
(NULL, 25, 10, 1, '2021-07-11 10:00:00'),
(NULL, 25, 12, 1, '2021-08-09 12:00:00'),
(NULL, 26, 130, 1, '2021-06-09 11:00:00'),
(NULL, 26, 16, 1, '2021-06-10 10:00:00'),
(NULL, 27, 150, 1, '2021-04-25 10:00:00'),
(NULL, 28, 22, 1, '2021-02-14 10:30:00'),
(NULL, 29, 51, 1, '2021-01-12 18:00:00'),
(NULL, 29, 50, 1, '2021-02-20 10:30:00'),
(NULL, 29, 23, 0, '2021-06-12 19:30:00'),
(NULL, 29, 15, 1, '2021-11-09 10:30:00'),
(NULL, 30, 18, 1, '2021-05-01 18:30:00'),
(NULL, 30, 14, 1, '2021-05-05 20:00:00'),
(NULL, 30, 15, 1, '2021-11-09 19:30:00'),
(NULL, 30, 13, 1, '2021-11-20 21:00:00');


INSERT INTO online_sessions_mini VALUES
(1, '2021-01-29 09:00:00', '2021-01-29 10:30:00'),
(1,  '2021-10-29 09:00:00', '2021-10-29 12:00:00'),
(1, '2021-10-29 12:10:00', '2021-10-29 12:50:00'),
(1, '2021-11-29 12:11:00', '2021-11-29 12:58:00'),
(2,  '2021-09-15 13:25:00', '2021-09-15 13:35:00'),
(3,  '2021-09-10 10:00:00', '2021-09-10 10:33:00'),
(3, '2021-09-11 09:00:00', '2021-09-11 10:30:00'),
(4, '2021-01-08 09:50:00', '2021-01-08 10:59:00'),
(4, '2021-01-09 09:51:00', '2021-01-09 11:59:00'),
(4, '2021-02-09 09:00:00', '2021-02-09 13:00:00'),
(4, '2021-03-10 08:00:00', '2021-03-10 11:00:00'),
(4, '2021-04-12 09:30:00', '2021-04-12 10:05:00'),
(5, '2021-02-10 10:03:00', '2021-02-10 10:39:00'),
(5, '2021-08-12 17:00:00', '2021-08-12 18:58:00'),
(6, '2021-01-16 10:00:00', '2021-01-16 10:38:00'),
(6, '2021-09-12 11:00:00', '2021-09-12 22:00:00'),
(7, '2021-11-05 10:00:00', '2021-11-05 12:30:00'),
(7, '2021-12-01 19:20:00', '2021-12-01 19:50:00'),
(7, '2021-12-05 19:00:00', '2021-12-05 21:00:00'),
(7, '2021-12-06 10:01:00', '2021-12-06 13:30:00'),
(7, '2021-12-07 10:03:00', '2021-12-07 12:30:00'),
(7, '2021-12-08 10:05:00', '2021-12-08 15:22:00'),
(8, '2021-12-01 19:01:00', '2021-12-01 19:45:00'),
(8, '2021-12-05 20:00:00', '2021-12-05 20:02:00'),
(9, '2021-01-05 19:05:00', '2021-01-05 20:30:00'),
(9, '2021-01-25 20:00:00', '2021-01-25 20:50:00'),
(9, '2021-02-01 15:30:00', '2021-02-01 19:35:00'),
(9, '2021-05-09 20:00:00', '2021-05-09 21:03:00'),
(10, '2021-06-11 10:00:00', '2021-06-11 12:00:00'),
(10, '2021-07-15 11:00:00', '2021-07-15 16:00:00'),
(10, '2021-08-16 12:00:00', '2021-08-16 15:00:00'),
(11, '2021-01-29 08:00:00', '2021-01-29 11:00:00'),
(11, '2021-10-20 10:00:00', '2021-10-20 11:22:00'),
(11, '2021-10-20 13:00:00', '2021-10-20 15:22:00'),
(11, '2021-10-20 19:00:00', '2021-10-20 21:10:00'),
(11, '2021-11-29 12:30:00', '2021-11-29 12:35:00'),
(11, '2021-12-15 13:00:00', '2021-12-15 13:40:00'),
(12, '2021-09-14 11:30:00', '2021-09-14 14:30:00'),
(13, '2021-08-11 08:50:00', '2021-08-11 10:06:00'),
(14, '2021-01-09 11:00:00', '2021-01-09 13:00:00'),
(14, '2021-06-09 10:30:00', '2021-06-09 11:30:00'),
(14, '2021-07-10 09:00:00', '2021-07-10 11:00:00'),
(15, '2021-04-28 08:00:00', '2021-04-28 15:00:00'),
(16, '2021-02-13 10:03:00', '2021-02-13 10:33:00'),
(16, '2021-07-12 17:00:00', '2021-07-12 19:00:00'),
(16, '2021-12-13 10:03:00', '2021-12-13 10:33:00'),
(17, '2021-01-20 10:20:00', '2021-01-20 10:40:00'),
(18, '2021-12-12 19:22:00', '2021-12-12 19:31:00'),
(19, '2021-11-05 10:00:00', '2021-11-05 10:41:00'),
(19, '2021-12-01 13:30:00', '2021-12-01 21:30:00'),
(19, '2021-12-05 19:00:00', '2021-12-05 21:01:00'),
(19, '2021-12-09 19:01:00', '2021-12-09 19:49:00'),
(19, '2021-12-20 20:06:00', '2021-12-20 22:02:00'),
(20, '2021-02-06 09:00:00', '2021-02-06 09:39:00'),
(20, '2021-02-25 09:00:00', '2021-02-25 09:39:00'),
(20, '2021-02-28 09:00:00', '2021-02-28 09:39:00'),
(20, '2021-03-25 07:00:00', '2021-03-25 09:09:00'),
(21, '2021-04-29 07:58:00', '2021-04-29 08:31:00'),
(22, '2021-04-29 07:51:00', '2021-04-29 08:31:00'),

(23, '2021-08-20 10:00:00', '2021-08-20 16:00:00'),
(23, '2021-09-29 12:00:00', '2021-09-29 12:41:00'),
(23, '2021-10-15 11:30:00', '2021-10-15 16:30:00'),
(24, '2021-05-14 12:30:00', '2021-05-14 14:30:00'),
(24, '2021-06-14 12:30:00', '2021-06-14 14:30:00'),
(24, '2021-06-15 12:30:00', '2021-06-15 14:30:00'),
(24, '2021-06-22 12:30:00', '2021-06-22 14:30:00'),
(24, '2021-08-14 12:30:00', '2021-08-14 14:30:00'),
(25, '2021-07-11 08:09:00', '2021-07-11 10:09:00'),
(25, '2021-08-09 11:56:00', '2021-08-09 12:05:00'),
(26, '2021-06-09 11:00:00', '2021-06-09 11:02:00'),
(26, '2021-06-10 09:40:00', '2021-06-10 10:40:00'),
(27, '2021-04-25 08:32:00', '2021-04-25 10:29:00'),
(28, '2021-02-14 10:08:00', '2021-02-14 10:37:00'),
(29, '2021-01-01 17:00:00', '2021-01-01 22:00:00'),
(29, '2021-01-12 17:00:00', '2021-01-12 22:00:00'),
(29, '2021-02-20 09:30:00', '2021-02-20 23:30:00'),
(29, '2021-06-12 19:00:00', '2021-06-12 21:10:00'),
(29, '2021-11-09 10:00:00', '2021-11-09 10:50:00'),
(30, '2021-03-01 17:30:00', '2021-03-01 19:30:00'),
(30, '2021-03-09 17:30:00', '2021-03-09 19:30:00'),
(30, '2021-05-01 17:30:00', '2021-05-01 19:30:00'),
(30, '2021-05-05 19:00:00', '2021-05-05 23:00:00'),
(30, '2021-11-09 19:20:00', '2021-11-09 19:33:00'),
(30, '2021-11-20 20:00:00', '2021-11-20 22:30:00');


-- 2.1 Вывести детализацию по клиенту:
-- a. ID клиента
SELECT *
FROM clients;


-- b. Дата и сумма первой покупки
SELECT clients_id, MIN(operation_time), amount
FROM ( 
	SELECT *
	FROM client_balance_operation 
	WHERE sign_of_payment = 1) AS request11
GROUP BY clients_id
HAVING MIN(operation_time);


-- c. Дата и сумма повторной (следующей после первой) покупки
SELECT clients_id, operation_time, amount, row_num
FROM ( 
	SELECT *, ROW_NUMBER() OVER(PARTITION BY clients_id ORDER BY clients_id, operation_time ASC) AS row_num
	FROM client_balance_operation
	WHERE sign_of_payment = 1) AS request2
WHERE row_num = 2;


-- d. Дата последней покупки
SELECT clients_id, MAX(operation_time)
FROM (
	SELECT *
	FROM client_balance_operation 
	WHERE sign_of_payment = 1) AS request4
GROUP BY clients_id
HAVING MAX(operation_time);


-- e. Сумма покупок, совершенных в течение месяца после первой покупки
SELECT clients_id, SUM(amount)
FROM (
	WITH mycte1 AS (
		SELECT clients_id, MIN(operation_time) AS first_operation, (MIN(operation_time) + INTERVAL 1 month) AS interval_month
		FROM (
			SELECT *
			FROM client_balance_operation 
			WHERE sign_of_payment = 1) AS request5
		GROUP BY clients_id
		HAVING MIN(operation_time)
	)

	SELECT client_balance_operation.clients_id, client_balance_operation.amount
	FROM client_balance_operation 
	JOIN mycte1 ON client_balance_operation.clients_id = mycte1.clients_id
	WHERE operation_time != first_operation AND operation_time <= interval_month ) AS ddd
GROUP BY clients_id;


-- f. Время (кол-во дней) между первой и повторной покупкой
SELECT clients_id, dif AS "Дней между 1-й и 2-й покупкой"
FROM ( 
	SELECT DISTINCT clients_id, DATEDIFF(MAX(operation_time) OVER(PARTITION BY clients_id),
										MIN(operation_time) OVER(PARTITION BY clients_id)) AS dif
	FROM (
		SELECT clients_id, operation_time, row_num
		FROM ( 
			SELECT *, ROW_NUMBER() OVER(PARTITION BY clients_id ORDER BY clients_id, operation_time ASC) AS row_num
			FROM client_balance_operation
			WHERE sign_of_payment = 1
		) AS request33
		WHERE row_num = 1 OR row_num = 2
	) AS request6
) AS request9
WHERE dif != 0;


-- g. Среднее время (кол-во дней) между покупками
SELECT clients_id , ROUND(AVG(DATEDIFF(next_date_oper, operation_time))) AS avg_days_between_pay
FROM (
		SELECT *
		FROM ( 
			SELECT *,
				LEAD(operation_time) OVER(PARTITION BY clients_id) AS next_date_oper
			FROM client_balance_operation
			WHERE sign_of_payment = 1
		) AS request35
		WHERE next_date_oper IS NOT NULL
) AS request36
GROUP BY clients_id;


-- 2.2 Количество потерянных клиентов по месяцам
/* Потерянным клиентом считается тот, который совершал покупки в предыдущем
месяце, но не совершал в текущем. Какой % из этих потерянных клиентов
находятся в статусе Deleted?
Вывести по месяцам за текущий год
*/

WITH mycte2 AS (
SELECT lost_in_month, clients_id
FROM ( 
	SELECT *,
		IF(pref_month_oper IS NULL AND check_month_oper_next != next_month_oper, check_month_oper_next,
			IF(check_month_oper_next = next_month_oper OR (month_operation = 12 AND pref_month_oper = 11), 'активен', 
				IF(month_operation = 12 AND pref_month_oper IS NULL, 'операция только декабре',  check_month_oper_next)
			)
		) AS lost_in_month
		
	FROM (
		SELECT clients_id, 
			month_operation, 
			check_month_oper_pref, check_month_oper_next,
			LAG(month_operation) OVER(PARTITION BY clients_id) AS pref_month_oper,
			LEAD(month_operation) OVER(PARTITION BY clients_id) AS next_month_oper
			
		FROM (
			SELECT DISTINCT clients_id, month_operation, check_month_oper_pref, check_month_oper_next
			FROM (
			
				SELECT clients_id,
					MONTH(operation_time) AS month_operation,
					MONTH(operation_time) - 1 AS check_month_oper_pref,
					MONTH(operation_time) + 1 AS check_month_oper_next	
				FROM client_balance_operation 
				WHERE sign_of_payment = 1
				ORDER BY clients_id ASC
			) AS request40
			ORDER BY clients_id, month_operation ASC
		) AS request41
	) AS request42
) AS request43
WHERE lost_in_month BETWEEN 1 AND 12
ORDER BY lost_in_month
)

SELECT *, SUM(counter) OVER(PARTITION BY lost_in_month) / COUNT(counter) OVER(PARTITION BY lost_in_month) AS persent
FROM ( 
	SELECT mycte2.lost_in_month, mycte2.clients_id, clients.status, IF(clients.status = 'Deleted', 1, 0) AS counter
	FROM mycte2
	LEFT JOIN clients ON mycte2.clients_id = clients.id 
) AS request44;


-- 2.3 Покупки по неделям с момента регистрации
/*
Сколько клиентов совершают первую покупку в первую неделю с регистрации на
сайте, сколько во вторую неделю, сколько на третьей неделе и сколько позже?
(вывести абсолютные значения и доли)
*/

-- Поскольку в БД не указано время регистрации, то тогда время регистрации это время, когда пользователь первый раз зашел онлайн
SELECT week_operation_buy, COUNT(clients_id) AS 'Количество', COUNT(clients_id) / (SELECT COUNT(id) FROM clients WHERE status != 'Deleted')	AS 'Доля'
FROM (
	SELECT *
	FROM (
		WITH mycte3 AS (
			SELECT clients_id, MIN(online_time) AS reg_date
			FROM online_sessions_mini 
			GROUP BY clients_id 
		)
		SELECT mycte3.clients_id, operation_time, reg_date,
			IF(ROUND(DATEDIFF(operation_time, reg_date) / 7) <= 1, 1,  
				IF(ROUND(DATEDIFF(operation_time, reg_date) / 7) <= 2, 2,
					IF(ROUND(DATEDIFF(operation_time, reg_date) / 7) <= 3, 3,
						IF(ROUND(DATEDIFF(operation_time, reg_date) / 7) > 3, '3+', '3+')
					)
				)
			) AS week_operation_buy
		FROM client_balance_operation 
		JOIN mycte3 ON client_balance_operation.clients_id = mycte3.clients_id
		JOIN clients ON client_balance_operation.clients_id = clients.id
		WHERE clients.status != 'Deleted'
		ORDER BY mycte3.clients_id, operation_time
	) AS request45
	GROUP BY clients_id
) AS request46
GROUP BY week_operation_buy
ORDER BY week_operation_buy;



