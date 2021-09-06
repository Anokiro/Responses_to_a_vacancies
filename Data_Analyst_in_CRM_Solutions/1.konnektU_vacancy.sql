DROP DATABASE IF EXISTS train_konnectu;
CREATE DATABASE train_konnectu;
USE train_konnectu;

DROP TABLE IF EXISTS T1;
CREATE TABLE T1 (
	Vendor_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	Vendor VARCHAR(50)
);

DROP TABLE IF EXISTS T2;
CREATE TABLE T2 (
	Vendor_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	Vendor VARCHAR(50)
);

INSERT INTO T1 VALUES 
(NULL, 'Asus'),
(NULL, 'Sony'),
(NULL, 'Samsung'),
(NULL, 'Acer'),
(NULL, 'LG'),
(NULL, 'HP');

INSERT INTO T2 VALUES 
(NULL, 'Epson'),
(NULL, 'HP'),
(NULL, 'Canon'),
(NULL, 'Xerox');


-- 1. Выведите в один общий список  без повторений наименование производителей (Vendor) из двух таблиц.
SELECT Vendor
FROM T1
UNION 
SELECT Vendor
FROM T2;


-- 2. Имеются 2 таблицы T1 и T2, содержащие колонки Vendor. Напишите запрос,
--  отбирающий из таблицы T1 все уникальные Vendor, отсутствующие в колонке Vendor таблицы T2.
SELECT DISTINCT T1.Vendor
FROM T1
LEFT JOIN T2 ON T1.Vendor = T2.Vendor
WHERE T2.Vendor IS NULL


-- 3. В таблице T имеется одна колонка NUM типа NUMBER.
-- Таблица заполнена некоторыми числами, которые могут повторяться. Написать оператор DELETE,
--  удаляющий за один проход из таблицы T все записи дубликаты (остаться должны только неповторяющиеся числа).
DROP TABLE IF EXISTS T;
CREATE TABLE T (
	num_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	num INT(50)
);
INSERT INTO T VALUES 
(NULL, 1),
(NULL, 2),
(NULL, 5),
(NULL, 4),
(NULL, 4),
(NULL, 2),
(NULL, 9),
(NULL, 3),
(NULL, 4),
(NULL, 1);


WITH mycte AS (
	SELECT MIN(num_id) AS min_id
	FROM T
	GROUP BY num
)
DELETE FROM T
WHERE num_id NOT IN (
	SELECT min_id
	FROM mycte
);
/* Вероятно в данном задании необходимо оставить первую вставленную строку, а дубликаты удалить, 
 тогда в таблице должна быть еще одна колонка с индексом(num_id). 
 В этой связи запрос будет выглядеть следующим образом: */
WITH mycte AS (
	SELECT MIN(num_id) AS min_id
	FROM T
	GROUP BY num
)
DELETE FROM T
WHERE num_id NOT IN (
	SELECT min_id
	FROM mycte
);

-- 4. В таблице T1 Имеются данные по продажам и выполнению плана за последний отчетный период по каждому дополнительному офису.
-- Определить 3 лучших филиала по выполнению плана и вывести общую сумму продаж по каждому из них.
-- Результаты необходимо представить в виде таблицы T2.
DROP TABLE IF EXISTS T1;
CREATE TABLE T1 (
	Fil VARCHAR(50), 
	DO VARCHAR(50), 
	Sales INT(50),
	Plan INT(50)
);

INSERT INTO T1 VALUES 
('Центральный', 'Москва 1', 80, 120),
('Центральный', 'Москва 2', 120, 100),
('Центральный', 'Тула', 30, 80),
('Дальневосточный', 'Хабаровск', 20, 101),
('Дальневосточный', 'Владивосток', 40, 103),
('Южный', 'Сочи', 60, 95),
('Южный', 'Анапа 2', 80, 105),
('Северный', 'Спб 1', 70, 105);


/* Для определения лучших филиалов используется показатель total_result, который рассчитывает недовыполнение/выполнение/перевыполнение 
    плана продаж в денежном выражении(в единицах измерения Sales) по каждому дополнительному офису(DO), 
     затем суммирует все значения в каждому филиалу(Fil) и делит на общее количество дополнительных офисов в каждом филиале. 
      В конце выдает топ 3 лучших филиала.
  Таким образом, чем лучше каждый из дополнительных офисов справился с задачей по продажам, тем выше показатель total_result,
  а также если какой-либо из дополнительных офисов значительно не выполнил свою задачу при том, что остальные справились хорошо, 
   то это повлияет на показатель total_result в сторону его уменьшения. 
*/

DROP TABLE IF EXISTS T2;
CREATE TABLE T2 AS (
WITH mycte AS (
	SELECT 
		DO AS Place, Fil, Sales, Plan, 
		(Sales - ROUND(((Sales / Plan) * 100), 2)) AS perfoming_plan   
	FROM T1 	
),
mycte2 AS (
	SELECT 	
		t1.Place, t1.Fil	
	FROM mycte AS t1, (SELECT Fil, MAX(perfoming_plan) perfoming_plan FROM mycte GROUP BY Fil) AS t2
	WHERE t1.Fil=t2.Fil AND t1.perfoming_plan=t2.perfoming_plan
)
SELECT 
	mycte2.Place,
	mycte.Fil, 
	SUM(Sales) AS sum_sales,
	AVG(Plan) AS avg_plan,
	ROUND((SUM(perfoming_plan) / COUNT(perfoming_plan)), 1) AS total_result
FROM mycte
JOIN mycte2 ON mycte.Fil = mycte2.Fil
GROUP BY mycte.Fil
ORDER BY total_result DESC
LIMIT 3
)

-- ---------------------------------------
/*
 Есть таблица с информацией о сотрудниках компании Employees со столбцами
  (уникальный идентификатор записи Id (uniqueidentifier, не NULL) ,
   дата оформления трудоустройства Date (datetime2(7)), ФИО FullName(nvarchar(500)),
    название департамента Department (nvarchar(250)), электронная почта сотрудника Email (nvarchar(250)),
     телефон Phone(nvarchar(250))) 

Есть таблица с зарплатой сотрудников компании Salary
В ней хранятся поля: уникальный идентификатор записи Id (uniqueidentifier, не NULL),
 дата выплаты зарплаты Date (datetime2(7)), идентификатор сотрудника EmployeeId (uniqueidentifier) - 
  поле ссылается на поле Id из таблицы Employees, сумма зарплаты Salary(int)
*/

DROP TABLE IF EXISTS Employees;
CREATE TABLE Employees (
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	date_ DATE, 
	FullName VARCHAR(500), 
	Department VARCHAR(200),
	Email VARCHAR(200),
	Phone VARCHAR(200)
);

DROP TABLE IF EXISTS Salary;
CREATE TABLE Salary (
	id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	date_ DATE, 
	EmployeeId BIGINT, 
	Salary INT,
	
	FOREIGN KEY (EmployeeId) REFERENCES Employees(id)
);

INSERT INTO Employees VALUES 
(NULL, (CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 200) DAY), 'Ivan Petrov', 'Logistic', 'dsfsd@mail.ru', '+7899555'),
(NULL, (CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 190) DAY), 'Petr Petrovv', 'Logistic', 'dsefsd@mail.ru', '+7893555'),
(NULL, (CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 180) DAY), 'Ivan Sidorov', 'Office', '24sd@mail.ru', '+78935555'),
(NULL, (CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 170) DAY), 'Kirill Prov', 'Logistic', 'aaad@mail.ru', '+7829545'),
(NULL, (CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 160) DAY), 'Ovan Tetrov', 'Office', 'd344uu@mail.ru', '+7888955'),
(NULL, (CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 150) DAY), 'Kolya Nemov', 'Finance', 'rrs@mail.ru', '+7899845'),
(NULL, (CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 140) DAY), 'Ian Rov', 'Logistic', '9fg@mail.ru', '+7897735'),
(NULL, (CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 130) DAY), 'Vladimir Uetov', 'Office', '55gfsd@mail.ru', '+78956755'),
(NULL, (CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 120) DAY), 'Van Pes', 'Finance', 'reyysd@mail.ru', '+7359555'),
(NULL, (CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 110) DAY), 'Alexey Frolov', 'Logistic', '44d@mail.ru', '+78567555'),
(NULL, (CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 100) DAY), 'Alexey Petrov', 'Office', 'voprsfsd@mail.ru', '+7833355'),
(NULL, (CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 90) DAY), 'Rav Yrov', 'Logistic', '44dd@mail.ru', '+78945255'),
(NULL, (CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 80) DAY), 'Yuriy Dodo', 'Finance', 'dodosd@mail.ru', '+7894555'),
(NULL, (CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 70) DAY), 'Iv Pe', 'Logistic', '342dd@mail.ru', '+7845255'),
(NULL, (CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 60) DAY), 'Dmitriy Zhukov', 'Office', '33fsd@mail.ru', '+7899455');

INSERT INTO Salary VALUES 
(NULL, (CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 180) DAY), 1, FLOOR(RAND() * 10000 + 1)), 
(NULL, (CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 170) DAY), 2, FLOOR(RAND() * 10000 + 1)),
(NULL, (CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 160) DAY), 3, FLOOR(RAND() * 10000 + 1)),
(NULL, (CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 150) DAY), 4, FLOOR(RAND() * 10000 + 1)),
(NULL, (CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 140) DAY), 5, FLOOR(RAND() * 10000 + 1)),
(NULL, (CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 130) DAY), 6, FLOOR(RAND() * 10000 + 1)),
(NULL, (CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 120) DAY), 7, FLOOR(RAND() * 10000 + 1)),
(NULL, (CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 110) DAY), 8, FLOOR(RAND() * 10000 + 1)),
(NULL, (CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 100) DAY), 9, FLOOR(RAND() * 10000 + 1)),
(NULL, (CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 90) DAY), 10, FLOOR(RAND() * 10000 + 1)),
(NULL, (CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 80) DAY), 11, FLOOR(RAND() * 10000 + 1)),
(NULL, (CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 70) DAY), 12, FLOOR(RAND() * 10000 + 1)),
(NULL, (CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 60) DAY), 13, FLOOR(RAND() * 10000 + 1)),
(NULL, (CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 50) DAY), 14, FLOOR(RAND() * 10000 + 1)),
(NULL, (CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 40) DAY), 15, FLOOR(RAND() * 10000 + 1));


-- 1)	Вывести названия департаментов с наибольшим и наименьшим количеством сотрудников 
SELECT tbl.Department, tbl.cnt_dept AS `Колво_сотрудников_макс_мин`
FROM (
	SELECT Department, COUNT(Department) AS cnt_dept
	FROM Employees
	GROUP BY Department
) AS tbl, 

(SELECT MAX(cnt_dept) AS max_cnt_dept, MIN(cnt_dept) AS min_cnt_dept
FROM (
	SELECT Department, COUNT(Department) AS cnt_dept
	FROM Employees
	GROUP BY Department
	) AS table1) AS tbl2
WHERE (tbl.cnt_dept = tbl2.max_cnt_dept) OR (tbl.cnt_dept = tbl2.min_cnt_dept)


-- 2)	Вывести сумму выплаченной зарплаты в разбивке по месяцам.
SELECT month_, SUM(Salary) AS sum_salary
FROM (
	SELECT Salary, MONTH(date_) AS month_
	FROM Salary
) AS tbl
GROUP BY month_


-- 3)	Вывести ФИО людей, получивших зарплату за апрель меньшую,
--  чем 5 тыс рублей в поле Less5; ФИО оставшихся людей вывести в другое поле - More5. 


SELECT FullName AS Less5 
FROM (
	SELECT *
	FROM (
		SELECT MONTH(Salary.date_) AS month_pay, FullName, Salary
		FROM Salary
		JOIN Employees ON Salary.EmployeeId = Employees.id
	) AS tbl
	WHERE month_pay = 4 
) AS tbl2
WHERE Salary < 5000;

SELECT FullName AS More5 
FROM (
	SELECT *
	FROM (
		SELECT MONTH(Salary.date_) AS month_pay, FullName, Salary
		FROM Salary
		JOIN Employees ON Salary.EmployeeId = Employees.id
	) AS tbl
	WHERE month_pay = 4 
) AS tbl2
WHERE Salary >= 5000;


-- 4)	Изменить название таблицы Employees на Workers, добавить поле Comment(nvarchar(255))
ALTER TABLE Employees RENAME TO Workers;

ALTER TABLE Workers ADD COLUMN Comment VARCHAR(255);



-- 5)	Присвоить сотрудникам из таблицы Salary порядковый номер исходя из величины полученной зарплаты в апреле. 
SELECT *, 
	IF(Salary BETWEEN 0 AND 2000, '1', 
		IF(Salary BETWEEN 2001 AND 6000, '2', 
			IF(Salary BETWEEN 6001 AND 10000, '3', '4') 
		)		
	) AS Number_of_level_salary
FROM Salary
WHERE MONTH(date_) = 4
















