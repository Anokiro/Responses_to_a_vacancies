/* Имеется три таблицы: customers, transactions, merchants (клиенты, транзакции и магазины, соответственно)

Состав столбцов в таблицах:
Customers:
customer_id (уникальный идентификатор клиента),
customer_age (текущий возраст клиента),
create_dt (дата создания клиента, т.е. его первой транзакции)
Transactions:
transaction_id (уникальный идентификатор транзакции),
merchant_id (идентификатор магазина, где была сделана транзакция),
customer_id (идентификатор клиента, который совершил транзакцию),
transaction_sum (сумма транзакции в рублях),
transaction_dttm (дата/время совершения транзакции)
Merchants:
merchant_id (уникальный идентификатор магазина),
merchant_region (регион нахождения магазина),
merchant_type_id (тип магазина, продукты / одежда / мебель / АЗС / рестораны),
create_dt (дата создания магазина в системе)

*/

DROP DATABASE IF EXISTS train_yandex;
CREATE DATABASE train_yandex;
USE train_yandex;

DROP TABLE IF EXISTS customers;
CREATE TABLE customers (
	customer_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	customer_age INT, 
	create_dt DATETIME
);

DROP TABLE IF EXISTS merchants;
CREATE TABLE Merchants (
	merchant_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,  
	merchant_region INT,
	merchant_type_id VARCHAR(50),
	create_dt DATE
);

DROP TABLE IF EXISTS transactions;
CREATE TABLE transactions (
	transaction_id SERIAL, 
	merchant_id BIGINT, 
	customer_id BIGINT,
	transaction_sum INT,
	transaction_dttm DATETIME,
	
	FOREIGN KEY (merchant_id) REFERENCES merchants(merchant_id),
	FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
	
);

INSERT INTO customers VALUES
(NULL, 25, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 100) DAY),
(NULL, 26, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 99) DAY),
(NULL, 27, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 98) DAY),
(NULL, 28, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 97) DAY),
(NULL, 29, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 96) DAY),
(NULL, 25, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 95) DAY),
(NULL, 26, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 94) DAY),
(NULL, 27, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 93) DAY),
(NULL, 28, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 92) DAY),
(NULL, 29, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 91) DAY),
(NULL, 30, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 90) DAY),
(NULL, 28, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 89) DAY),
(NULL, 26, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 88) DAY),
(NULL, 25, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 87) DAY),
(NULL, 25, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 86) DAY),
(NULL, 25, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 85) DAY),
(NULL, 26, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 84) DAY),
(NULL, 29, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 83) DAY),
(NULL, 30, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 82) DAY),
(NULL, 25, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 81) DAY),
(NULL, 30, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 80) DAY),
(NULL, 29, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 79) DAY),
(NULL, 26, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 78) DAY),
(NULL, 25, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 77) DAY),
(NULL, 29, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 76) DAY),
(NULL, 26, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 75) DAY),
(NULL, 27, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 74) DAY),
(NULL, 28, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 73) DAY),
(NULL, 25, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 72) DAY),
(NULL, 27, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 71) DAY),
(NULL, 28, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 70) DAY),
(NULL, 29, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 69) DAY),
(NULL, 25, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 68) DAY),
(NULL, 30, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 67) DAY),
(NULL, 28, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 66) DAY),
(NULL, 26, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 65) DAY),
(NULL, 25, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 64) DAY),
(NULL, 27, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 63) DAY),
(NULL, 26, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 62) DAY),
(NULL, 30, CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 61) DAY);

INSERT INTO merchants VALUES
(NULL, FLOOR(RAND() * 10 + 1), 'продукты', CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 55) DAY),
(NULL, FLOOR(RAND() * 10 + 6), 'одежда', CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 21) DAY),
(NULL, FLOOR(RAND() * 10 + 5), 'мебель', CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 50) DAY),
(NULL, FLOOR(RAND() * 10 + 6), 'АЗС', CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 10) DAY),
(NULL, FLOOR(RAND() * 10 + 4), 'рестораны', CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 1000) DAY),
(NULL, FLOOR(RAND() * 10 + 2), 'продукты', CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 55) DAY),
(NULL, FLOOR(RAND() * 10 + 6), 'продукты', CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 21) DAY),
(NULL, FLOOR(RAND() * 10 + 8), 'мебель', CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 50) DAY),
(NULL, FLOOR(RAND() * 10 + 9), 'АЗС', CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 10) DAY),
(NULL, FLOOR(RAND() * 10 + 8), 'рестораны', CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 1000) DAY),
(NULL, FLOOR(RAND() * 10 + 2), 'продукты', CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 55) DAY),
(NULL, FLOOR(RAND() * 10 + 1), 'одежда', CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 21) DAY),
(NULL, FLOOR(RAND() * 10 + 2), 'мебель', CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 50) DAY),
(NULL, FLOOR(RAND() * 10 + 4), 'АЗС', CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 10) DAY),
(NULL, FLOOR(RAND() * 10 + 4), 'АЗС', CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 1000) DAY),
(NULL, FLOOR(RAND() * 10 + 5), 'продукты', CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 55) DAY),
(NULL, FLOOR(RAND() * 10 + 6), 'одежда', CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 21) DAY),
(NULL, FLOOR(RAND() * 10 + 1), 'продукты', CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 50) DAY),
(NULL, FLOOR(RAND() * 10 + 6), 'АЗС', CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 10) DAY),
(NULL, FLOOR(RAND() * 10 + 3), 'рестораны', CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 1000) DAY);

INSERT INTO transactions VALUES
(NULL, (FLOOR(RAND() * 10 + 1)), 1, (FLOOR(RAND() * 10) * 101 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 700) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 3, (FLOOR(RAND() * 10) * 102 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 695) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 2, (FLOOR(RAND() * 10) * 103 + 90), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 690) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 5, (FLOOR(RAND() * 10) * 104 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 685) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 8, (FLOOR(RAND() * 10) * 105 + 60), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 680) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 18, (FLOOR(RAND() * 10) * 106 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 675) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 20, (FLOOR(RAND() * 10) * 107 + 60), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 670) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 8, (FLOOR(RAND() * 10) * 108 + 80), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 665) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 7, (FLOOR(RAND() * 10) * 109 + 80), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 660) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 8, (FLOOR(RAND() * 10) * 110 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 655) DAY ),

(NULL, (FLOOR(RAND() * 10 + 1)), 9, (FLOOR(RAND() * 10) * 111 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 650) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 7, (FLOOR(RAND() * 10) * 112 + 80), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 645) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 1, (FLOOR(RAND() * 10) * 113 + 70), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 640) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 2, (FLOOR(RAND() * 10) * 114 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 635) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 1, (FLOOR(RAND() * 10) * 115 + 90), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 630) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 8, (FLOOR(RAND() * 10) * 116 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 625) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 1, (FLOOR(RAND() * 10) * 117 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 620) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 4, (FLOOR(RAND() * 10) * 118 + 90), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 615) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 1, (FLOOR(RAND() * 10) * 119 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 610) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 4, (FLOOR(RAND() * 10) * 120 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 605) DAY ),

(NULL, (FLOOR(RAND() * 10 + 1)), 17, (FLOOR(RAND() * 10) * 121 + 60), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 600) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 16, (FLOOR(RAND() * 10) * 122 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 595) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 1, (FLOOR(RAND() * 10) * 123 + 60), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 590) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 14, (FLOOR(RAND() * 10) * 124 + 90), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 585) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 17, (FLOOR(RAND() * 10) * 125 + 90), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 580) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 11, (FLOOR(RAND() * 10) * 126 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 575) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 19, (FLOOR(RAND() * 10) * 127 + 90), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 570) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 12, (FLOOR(RAND() * 10) * 128 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 565) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 1, (FLOOR(RAND() * 10) * 129 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 560) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 6, (FLOOR(RAND() * 10) * 130 + 90), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 555) DAY ),

(NULL, (FLOOR(RAND() * 10 + 1)), 8, (FLOOR(RAND() * 10) * 131 + 90), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 550) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 4, (FLOOR(RAND() * 10) * 132 + 90), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 545) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 2, (FLOOR(RAND() * 10) * 133 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 540) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 9, (FLOOR(RAND() * 10) * 134 + 60), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 535) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 5, (FLOOR(RAND() * 10) * 135 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 530) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 11, (FLOOR(RAND() * 10) * 136 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 525) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 1, (FLOOR(RAND() * 10) * 137 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 520) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 13, (FLOOR(RAND() * 10) * 138 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 515) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 14, (FLOOR(RAND() * 10) * 139 + 60), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 510) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 15, (FLOOR(RAND() * 10) * 140 + 60), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 505) DAY ),

(NULL, (FLOOR(RAND() * 10 + 1)), 13, (FLOOR(RAND() * 10) * 129 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 500) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 19, (FLOOR(RAND() * 10) * 135 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 495) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 1, (FLOOR(RAND() * 10) * 100 + 90), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 490) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 19, (FLOOR(RAND() * 10) * 99 + 80), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 485) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 1, (FLOOR(RAND() * 10) * 95 + 80), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 480) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 2, (FLOOR(RAND() * 10) * 55 + 80), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 475) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 3, (FLOOR(RAND() * 10) * 88 + 70), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 470) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 5, (FLOOR(RAND() * 10) * 56 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 465) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 1, (FLOOR(RAND() * 10) * 155 + 70), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 460) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 7, (FLOOR(RAND() * 10) * 96 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 455) DAY ),

(NULL, (FLOOR(RAND() * 10 + 1)), 12, (FLOOR(RAND() * 10) * 58 + 60), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 450) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 15, (FLOOR(RAND() * 10) * 77 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 440) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 14, (FLOOR(RAND() * 10) * 74 + 60), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 430) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 16, (FLOOR(RAND() * 10) * 69 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 420) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 1, (FLOOR(RAND() * 10) * 38 + 90), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 410) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 17, (FLOOR(RAND() * 10) * 84 + 90), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 400) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 18, (FLOOR(RAND() * 10) * 83 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 390) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 19, (FLOOR(RAND() * 10) * 122 + 60), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 380) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 20, (FLOOR(RAND() * 10) * 133 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 350) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 21, (FLOOR(RAND() * 10) * 144 + 80), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 300) DAY ),

(NULL, (FLOOR(RAND() * 10 + 1)), 19, (FLOOR(RAND() * 10) * 151 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 200) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 18, (FLOOR(RAND() * 10) * 143 + 70), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 180) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 20, (FLOOR(RAND() * 10) * 139 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 160) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 1, (FLOOR(RAND() * 10) * 111 + 70), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 140) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 3, (FLOOR(RAND() * 10) * 110 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 120) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 13, (FLOOR(RAND() * 10) * 105 + 70), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 100) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 14, (FLOOR(RAND() * 10) * 106 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 90) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 18, (FLOOR(RAND() * 10) * 160 + 60), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 80) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 19, (FLOOR(RAND() * 10) * 125 + 40), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 70) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 11, (FLOOR(RAND() * 10) * 115 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 60) DAY ),

(NULL, (FLOOR(RAND() * 10 + 1)), 9, (FLOOR(RAND() * 10) * 87 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 50) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 7, (FLOOR(RAND() * 10) * 89 + 80), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 40) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 8, (FLOOR(RAND() * 10) * 99 + 60), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 30) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 4, (FLOOR(RAND() * 10) * 54 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 25) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 2, (FLOOR(RAND() * 10) * 32 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 20) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 16, (FLOOR(RAND() * 10) * 45 + 60), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 15) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 7, (FLOOR(RAND() * 10) * 49 + 90), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 10) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 9, (FLOOR(RAND() * 10) * 47 + 90), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 7) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 17, (FLOOR(RAND() * 10) * 52 + 80), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 3) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 10, (FLOOR(RAND() * 10) * 57 + 60), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 - 0) DAY ),

(NULL, (FLOOR(RAND() * 10 + 1)), 21, (FLOOR(RAND() * 10) * 87 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 + 10) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 22, (FLOOR(RAND() * 10) * 89 + 80), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 + 20) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 26, (FLOOR(RAND() * 10) * 99 + 60), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 + 30) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 33, (FLOOR(RAND() * 10) * 54 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 + 40) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 39, (FLOOR(RAND() * 10) * 32 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 + 20) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 35, (FLOOR(RAND() * 10) * 45 + 60), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 +60) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 36, (FLOOR(RAND() * 10) * 49 + 90), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 + 70) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 34, (FLOOR(RAND() * 10) * 47 + 90), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 + 80) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 29, (FLOOR(RAND() * 10) * 52 + 80), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 + 100) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 26, (FLOOR(RAND() * 10) * 57 + 60), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 + 110) DAY ),

(NULL, (FLOOR(RAND() * 10 + 1)), 33, (FLOOR(RAND() * 10) * 87 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 + 120) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 27, (FLOOR(RAND() * 10) * 89 + 80), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 + 130) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 26, (FLOOR(RAND() * 10) * 99 + 60), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 + 140) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 22, (FLOOR(RAND() * 10) * 54 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 + 150) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 21, (FLOOR(RAND() * 10) * 32 + 50), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 + 160) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 26, (FLOOR(RAND() * 10) * 45 + 60), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 + 170) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 24, (FLOOR(RAND() * 10) * 49 + 90), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 + 180) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 28, (FLOOR(RAND() * 10) * 47 + 90), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 + 190) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1)), 21, (FLOOR(RAND() * 10) * 52 + 80), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 + 200) DAY ),
(NULL, (FLOOR(RAND() * 10 + 1) + 10), 29, (FLOOR(RAND() * 10) * 57 + 60), CURRENT_DATE() + INTERVAL FLOOR(RAND() * 10 + 210) DAY );


-- Написать запросы для:
-- 1.1 Определения регионов, в которых клиенты потратили больше всего средств в текущем году.
SELECT merchant_region, SUM(transaction_sum) AS `Сумма_по_регионам`
FROM transactions 
JOIN merchants ON transactions.merchant_id = merchants.merchant_id
WHERE transaction_dttm > '2020-12-31'
GROUP BY merchant_region
ORDER BY `Сумма_по_регионам` DESC
-- отбор топ 5 регионов
LIMIT 5;

-- 1.2
-- Определения, в каких категориях магазинов самый высокий средний чек транзакции
SELECT merchant_type_id, ROUND(AVG(transaction_sum), 2) AS avg_check
FROM transactions 
JOIN merchants ON transactions.merchant_id = merchants.merchant_id
GROUP BY merchant_type_id
ORDER BY avg_check DESC
LIMIT 5;

-- 1.3
-- Анализа характера и частоты транзакций клиентов, основываясь на их возрасте
WITH mycte AS (
	SELECT cus_id, merch_id, most_popular_shop
	FROM (
		SELECT customers.customer_id AS cus_id, merchant_type_id AS merch_id, COUNT(merchant_type_id) AS most_popular_shop
		FROM customers
		JOIN transactions ON customers.customer_id = transactions.customer_id
		JOIN merchants ON transactions.merchant_id = merchants.merchant_id
		GROUP BY merchant_type_id, customers.customer_id
		ORDER BY customers.customer_id, COUNT(merchant_type_id) DESC
	) AS table1
	GROUP BY cus_id
),
mycte2 AS (
	SELECT customer_id, 
	ROUND(MIN(DATEDIFF(table2.next_date_trans, table2.first_date_trans))) AS min_days_without_buy,
	ROUND(MAX(DATEDIFF(table2.next_date_trans, table2.first_date_trans))) AS max_days_without_buy,
	ROUND(AVG(DATEDIFF(table2.next_date_trans, table2.first_date_trans))) AS avg_days_without_buy
	FROM (
		SELECT 
			transaction_dttm AS first_date_trans,
			LEAD(transaction_dttm) OVER(PARTITION BY customer_id) AS next_date_trans, 
			customer_id
		FROM transactions
	) AS table2
	GROUP BY customer_id
),
select1 AS (
	SELECT customers.customer_id, customer_age, COUNT(transaction_id) AS cnt_transactions,
		ROUND(AVG(transaction_sum)) AS avg_trans_sum,
		ROUND(SUM(transaction_sum)) AS sum_trans_sum,
		merch_id, min_days_without_buy, max_days_without_buy, avg_days_without_buy	
	FROM customers
	JOIN transactions ON customers.customer_id = transactions.customer_id
	JOIN merchants ON transactions.merchant_id = merchants.merchant_id
	JOIN mycte ON customers.customer_id = mycte.cus_id
	JOIN mycte2 ON customers.customer_id = mycte2.customer_id
	GROUP BY customer_id
)

SELECT 
	select1.customer_age AS Age,
	CASE (select1.merch_id) 
	WHEN 'одежда' THEN 'clothes'
	WHEN 'мебель' THEN 'furniture'
	WHEN 'АЗС' THEN 'AZS'
	WHEN 'рестораны' THEN 'restaurants'
	WHEN 'продукты' THEN 'foods'
	END AS Shop,
	COUNT(select1.customer_id) AS Amount_customer_in_age,
	SUM(select1.cnt_transactions) AS Amount_transactions,
	
	MIN(select1.avg_trans_sum) AS Min_average_check,
	FLOOR(AVG(select1.avg_trans_sum)) AS Average_check,
	SUM(select1.sum_trans_sum) AS Sum_check_in_category,
	ROUND((SUM(select1.sum_trans_sum) / (SELECT SUM(sum_trans_sum) FROM select1) * 100), 2) AS Perc_check_rom_revenue,
	
	MIN(min_days_without_buy) AS Min_amount_days_without_buy,
	MAX(max_days_without_buy) AS Max_amount_days_without_buy,
	FLOOR(AVG(avg_days_without_buy)) AS Avg_amount_days_without_buy
FROM select1
GROUP BY select1.customer_age, select1.merch_id
ORDER BY Age

-- -----------------------------------------------------------------------------------------------------------------------------------
/*
Имеется одна таблица: st_tasks
Состав столбцов в таблице:
key (уникальный идентификатор задачи)
assignee (уникальный идентификатор исполнителя)
status (статус задачи 'Open', 'On support side', 'Verifying', 'Close' и т.д.)
updated (timestamp последнего обновления задачи)
created (timestamp создания задачи)

Необходимо предложить решение следующей задачи
Пусть в переменной $assigneeList лежит список уникальных идентификаторов исполнителей. Идентификаторы в этом списке не повторяются. 
Суть задания состоит в том, чтобы перераспределить задачи исполнителей, 
	которые находятся дольше $days дней в статусах 'Open', 'On support side', 'Verifying' между исполнителями так, 
	чтобы их нагрузка стала одинаковой(или примерно одинаковой с минимальной разницей). 
Под нагрузкой исполнителя понимается количество его задач в статусах 'Open', 'On support side', 'Verifying'.
К переменным из условия можно обратиться в любой части запроса.

*/


DROP TABLE IF EXISTS st_tasks;
CREATE TABLE st_tasks (
	key_id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
	assignee_id VARCHAR(50) NOT NULL,
	status ENUM('Open', 'On support side', 'Verifying', 'Close'),
	created DATETIME NOT NULL,
	updated DATETIME NOT NULL
);

INSERT INTO st_tasks VALUES 
(1, '0000001', 'Open', (NOW() - INTERVAL 200 DAY ), (NOW() - INTERVAL 200 DAY )),
(2, '0000003', 'Open', (NOW() - INTERVAL 200 DAY ), (NOW() - INTERVAL 200 DAY )),
(3, '0000005', 'Open', (NOW() - INTERVAL 200 DAY ), (NOW() - INTERVAL 200 DAY )),
(4, '0000007', 'Open', (NOW() - INTERVAL 200 DAY ), (NOW() - INTERVAL 200 DAY )),
(5, '0000009', 'Open', (NOW() - INTERVAL 200 DAY ), (NOW() - INTERVAL 200 DAY )),

(6, '0000001', 'Open', (NOW() - INTERVAL 199 DAY ), (NOW() - INTERVAL 199 DAY )),
(7, '0000002', 'Open', (NOW() - INTERVAL 199 DAY ), (NOW() - INTERVAL 199 DAY )),
(8, '0000004', 'Open', (NOW() - INTERVAL 199 DAY ), (NOW() - INTERVAL 199 DAY )),
(9, '0000003', 'Open', (NOW() - INTERVAL 199 DAY ), (NOW() - INTERVAL 199 DAY )),

(10, '0000001', 'Open', (NOW() - INTERVAL 198 DAY ), (NOW() - INTERVAL 198 DAY )),
(11, '0000002', 'Open', (NOW() - INTERVAL 198 DAY ), (NOW() - INTERVAL 198 DAY )),
(12, '0000010', 'Open', (NOW() - INTERVAL 198 DAY ), (NOW() - INTERVAL 198 DAY )),
(13, '0000008', 'Open', (NOW() - INTERVAL 198 DAY ), (NOW() - INTERVAL 198 DAY )),
(14, '0000009', 'Open', (NOW() - INTERVAL 198 DAY ), (NOW() - INTERVAL 198 DAY )),
(15, '0000003', 'Open', (NOW() - INTERVAL 198 DAY ), (NOW() - INTERVAL 198 DAY )),
(16, '0000006', 'Open', (NOW() - INTERVAL 198 DAY ), (NOW() - INTERVAL 198 DAY )),
(17, '0000009', 'Open', (NOW() - INTERVAL 198 DAY ), (NOW() - INTERVAL 198 DAY )),

(18, '0000005', 'Open', (NOW() - INTERVAL 197 DAY ), (NOW() - INTERVAL 197 DAY )),
(19, '0000001', 'Open', (NOW() - INTERVAL 197 DAY ), (NOW() - INTERVAL 197 DAY )),
(20, '0000002', 'Open', (NOW() - INTERVAL 197 DAY ), (NOW() - INTERVAL 197 DAY )),
(21, '0000005', 'Open', (NOW() - INTERVAL 197 DAY ), (NOW() - INTERVAL 197 DAY )),
(22, '0000009', 'Open', (NOW() - INTERVAL 197 DAY ), (NOW() - INTERVAL 197 DAY )),
(23, '0000001', 'Open', (NOW() - INTERVAL 197 DAY ), (NOW() - INTERVAL 197 DAY )),

(24, '0000001', 'Open', (NOW() - INTERVAL 196 DAY ), (NOW() - INTERVAL 196 DAY )),
(25, '0000006', 'Open', (NOW() - INTERVAL 196 DAY ), (NOW() - INTERVAL 196 DAY )),
(26, '0000007', 'Open', (NOW() - INTERVAL 196 DAY ), (NOW() - INTERVAL 196 DAY )),
(27, '0000001', 'Open', (NOW() - INTERVAL 196 DAY ), (NOW() - INTERVAL 196 DAY )),
(28, '0000009', 'Open', (NOW() - INTERVAL 196 DAY ), (NOW() - INTERVAL 196 DAY )),
(29, '0000005', 'Open', (NOW() - INTERVAL 196 DAY ), (NOW() - INTERVAL 196 DAY )),
(30, '0000003', 'Open', (NOW() - INTERVAL 196 DAY ), (NOW() - INTERVAL 196 DAY )),
(31, '0000008', 'Open', (NOW() - INTERVAL 196 DAY ), (NOW() - INTERVAL 196 DAY )),

(32, '0000002', 'Open', (NOW() - INTERVAL 195 DAY ), (NOW() - INTERVAL 195 DAY )),
(33, '0000003', 'Open', (NOW() - INTERVAL 195 DAY ), (NOW() - INTERVAL 195 DAY )),
(34, '0000002', 'Open', (NOW() - INTERVAL 195 DAY ), (NOW() - INTERVAL 195 DAY )),
(35, '0000007', 'Open', (NOW() - INTERVAL 195 DAY ), (NOW() - INTERVAL 195 DAY ));

UPDATE st_tasks 
SET status = 'On support side', updated = (NOW() - INTERVAL 199 DAY )
WHERE key_id IN (1, 3);

UPDATE st_tasks 
SET status = 'On support side', updated = (NOW() - INTERVAL 199 DAY )
WHERE key_id IN (8, 9);

UPDATE st_tasks 
SET status = 'On support side', updated = (NOW() - INTERVAL 198 DAY )
WHERE key_id IN (12, 13);

UPDATE st_tasks 
SET status = 'On support side', updated = (NOW() - INTERVAL 197 DAY )
WHERE key_id IN (15, 16);

UPDATE st_tasks 
SET status = 'On support side', updated = (NOW() - INTERVAL 197 DAY )
WHERE key_id IN (22, 23);

UPDATE st_tasks 
SET status = 'On support side', updated = (NOW() - INTERVAL 196 DAY )
WHERE key_id IN (25, 26);

UPDATE st_tasks 
SET status = 'On support side', updated = (NOW() - INTERVAL 194 DAY )
WHERE key_id IN (32, 33, 34);

UPDATE st_tasks 
SET status = 'Verifying', updated = (NOW() - INTERVAL 193 DAY )
WHERE key_id IN (2, 5, 18, 35);

UPDATE st_tasks 
SET status = 'Close', updated = (NOW() - INTERVAL 190 DAY )
WHERE key_id IN (33, 29, 15, 7, 3);

SELECT * FROM st_tasks;


-- ОСТАВШАЯСЯ ЧАСТЬ ЗАДАНИЯ ВЫПОЛНЕНА В ФАЙЛЕ yandex_train_vacancy.ipynb

