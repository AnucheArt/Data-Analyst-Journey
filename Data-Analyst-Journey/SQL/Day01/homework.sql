/*
    DATA ANALYST JOURNEY
    HOMEWORK.SQL — MODULE 01

    Темы:
    SELECT, WHERE, ORDER BY, LIMIT,
    COUNT, SUM, AVG, MAX, MIN,
    GROUP BY, HAVING, AS, INNER JOIN

    Правила:
    1. Не копируй решения из practice.sql.
    2. Сначала напиши запрос самостоятельно.
    3. После выполнения проверь, соответствует ли результат условию.
    4. Каждый запрос заканчивай точкой с запятой.
*/
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    city VARCHAR(50) NOT NULL
);

INSERT INTO users (name, age, city)
VALUES
    ('Артём', 18, 'Москва'),
    ('Иван', 25, 'Казань'),
    ('Анна', 22, 'Санкт-Петербург'),
    ('Мария', 30, 'Москва'),
    ('Дмитрий', 27, 'Самара'),
    ('Ольга', 24, 'Казань'),
    ('Сергей', 35, 'Екатеринбург'),
    ('Елена', 29, 'Москва'),
    ('Павел', 21, 'Самара'),
    ('Наталья', 32, 'Санкт-Петербург');

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL
);

INSERT INTO customers (first_name, city)
VALUES
    ('Иван', 'Москва'),
    ('Анна', 'Казань'),
    ('Олег', 'Самара'),
    ('Мария', 'Москва'),
    ('Дмитрий', 'Екатеринбург'),
    ('Ольга', 'Казань'),
    ('Сергей', 'Москва'),
    ('Елена', 'Самара'),
    ('Павел', 'Санкт-Петербург'),
    ('Наталья', 'Екатеринбург');

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    jobe VARCHAR(50) NOT NULL,
    salary INT NOT NULL
);

INSERT INTO employees (first_name, last_name, jobe, salary)
VALUES
    ('Иван', 'Петров', 'IT', 180000),
    ('Анна', 'Смирнова', 'IT', 165000),
    ('Максим', 'Орлов', 'IT', 210000),
    ('Елена', 'Волкова', 'IT', 150000),
    ('Мария', 'Соколова', 'HR', 95000),
    ('Ольга', 'Кузнецова', 'HR', 85000),
    ('Павел', 'Морозов', 'HR', 105000),
    ('Дмитрий', 'Попов', 'Sales', 130000),
    ('Сергей', 'Лебедев', 'Sales', 145000),
    ('Наталья', 'Козлова', 'Sales', 120000),
    ('Алексей', 'Новиков', 'Sales', 170000),
    ('Ирина', 'Фёдорова', 'Marketing', 110000),
    ('Виктор', 'Михайлов', 'Marketing', 125000),
    ('Татьяна', 'Белова', 'Marketing', 140000);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    amount NUMERIC(10, 2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    CONSTRAINT fk_orders_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

INSERT INTO orders (customer_id, amount, status)
VALUES
    (1, 1500.00, 'paid'),
    (1, 4500.00, 'paid'),
    (1, 900.00, 'cancelled'),
    (2, 3000.00, 'paid'),
    (2, 1200.00, 'paid'),
    (2, 750.00, 'pending'),
    (3, 500.00, 'cancelled'),
    (3, 2200.00, 'paid'),
    (3, 1800.00, 'pending'),
    (4, 2500.00, 'pending'),
    (4, 6400.00, 'paid'),
    (4, 1100.00, 'paid'),
    (5, 7000.00, 'paid'),
    (5, 3200.00, 'paid'),
    (5, 450.00, 'cancelled'),
    (6, 1300.00, 'paid'),
    (6, 2800.00, 'cancelled'),
    (6, 950.00, 'pending'),
    (7, 5200.00, 'paid'),
    (7, 4100.00, 'paid'),
    (7, 600.00, 'cancelled'),
    (8, 1900.00, 'paid'),
    (8, 3500.00, 'pending'),
    (8, 800.00, 'paid'),
    (9, 2700.00, 'cancelled'),
    (9, 4600.00, 'paid'),
    (9, 1250.00, 'pending'),
    (10, 5800.00, 'paid'),
    (10, 2400.00, 'paid'),
    (10, 1000.00, 'cancelled');

SELECT * FROM users;
SELECT * FROM customers;
SELECT * FROM employees;
SELECT * FROM orders;

/* ============================================================
   БЛОК 1. USERS
   ============================================================ */

-- 1. Вывести имена и города всех пользователей.
SELECT name, sity
FROM users

-- 2. Вывести пользователей младше 25 лет.
SELECT name
FROM users
WHERE age > 25;

-- 3. Вывести пользователей из Москвы.
SELECT name
FROM users
WHERE city = 'Москва';

-- 4. Отсортировать пользователей по возрасту
--    от младшего к старшему.
SELECT*
FROM users
ORDER BY age;

-- 5. Вывести двух самых старших пользователей.

SELECT*
FROM users
ORDER BY age DESC
LIMIT 2;

/* ============================================================
   БЛОК 2. ORDERS — ФИЛЬТРАЦИЯ И СОРТИРОВКА
   ============================================================ */

-- 6. Вывести все заказы со статусом pending.
SELECT *
FROM orders
WHERE status = 'paid';

-- 7. Вывести оплаченные заказы дороже 2000.
SELECT *
FROM orders
WHERE status = 'paid'
AND amount > 2000;

-- 8. Вывести отменённые заказы и отсортировать их
--    по сумме от большей к меньшей.
SELECT *
FROM orders
WHERE status = 'cancelled'
ORDER BY amount DESC;

-- 9. Вывести три самых дешёвых заказа.
SELECT *
FROM orders
ORDER BY amount
LIMIT 3;

-- 10. Вывести самый дорогой заказ со статусом paid.
SELECT *
FROM orders
WHERE status = 'paid'
ORDER BY amount DESC
LIMIT 1;


/* ============================================================
   БЛОК 3. ORDERS — АГРЕГАТЫ
   ============================================================ */

-- 11. Посчитать количество всех оплаченных заказов.
SELECT COUNT(*)
FROM orders
WHERE status = 'paid';


-- 12. Посчитать количество отменённых заказов.
SELECT COUNT(*)
FROM orders
WHERE status = 'cancelled';

-- 13. Посчитать общую сумму заказов со статусом pending.
SELECT SUM(amount)
FROM orders
WHERE status = 'paid';

-- 14. Посчитать средний чек всех заказов.
SELECT AVG(amount)
FROM orders;

-- 15. Найти максимальную сумму отменённого заказа.
SELECT MAX(amount)
FROM orders
WHERE status = 'cancelled';
-- 16. Найти минимальную сумму оплаченного заказа.
SELECT MIN(amount)
FROM orders
WHERE status = 'paid';


/* ============================================================
   БЛОК 4. EMPLOYEES — GROUP BY
   ============================================================ */

-- 17. Для каждой должности вывести количество сотрудников.
SELECT COUNT (*)
FROM employees
GROUP BY jobe;

-- 18. Для каждой должности вывести среднюю зарплату.
SELECT AVG (salary)
FROM employees
GROUP BY jobe;


-- 19. Для каждой должности вывести максимальную зарплату.
SELECT MAX (salary)
FROM employees
GROUP BY jobe;

-- 20. Для каждой должности вывести минимальную зарплату.
SELECT MIN (salary)
FROM employees
GROUP BY jobe;

-- 21. Для каждой должности вывести общий фонд оплаты труда.
SELECT SUM (salary)
FROM employees
GROUP BY jobe;


/* ============================================================
   БЛОК 5. EMPLOYEES — HAVING
   ============================================================ */

-- 22. Вывести должности, на которых работает не меньше двух человек.
SELECT(jobe)
FROM employees
GROUP BY jobe
HAVING COUNT(jobe) >= 2;

-- 23. Вывести должности, где средняя зарплата выше 120000.
SELECT(jobe)
FROM employees
GROUP BY jobe
HAVING AVG(salary) > 120000;

-- 24. Вывести должности, где максимальная зарплата выше .
SELECT(jobe)
FROM employees
GROUP BY jobe
HAVING MIN(salary) < 180000;

-- 25. Вывести должности, где фонд оплаты труда превышает 350000.
SELECT(jobe)
FROM employees
GROUP BY jobe
HAVING SUM(salary) > 350000;


/* ============================================================
   БЛОК 6. СВОДНЫЙ ОТЧЁТ
   ============================================================ */

-- 26. Одним запросом сформировать отчёт по должностям:
--
-- jobe
-- employees
-- avg_salary
-- max_salary
-- min_salary
-- total_salary
--
-- Результат отсортировать по total_salary
-- от большего к меньшему.
SELECT
    jobe,
    COUNT(jobe) AS employees,
    AVG(salary) AS avg_salary,
    MAX(salary) AS max_salary,
    MIN(salary) AS min_salary,
    SUM(salary) AS total_salary
FROM employees
GROUP BY jobe
ORDER BY total_salary DESC;


/* ============================================================
   БЛОК 7. INNER JOIN
   ============================================================ */

-- Важно:
-- если в таблице orders ключ называется user_id,
-- используй orders.user_id.
-- Если он называется customer_id,
-- используй orders.customer_id.


-- 27. Вывести имя клиента и сумму каждого его заказа.
SELECT
	customers.first_name,
	SUM(orders.amount)
FROM orders
JOIN customers
	ON customers.customer_id = orders.customer_id
GROUP BY(customers.first_name)
 	

-- 28. Вывести имя клиента, город и статус каждого заказа.
SELECT
	customers.first_name,
	customers.city,
	orders.status
FROM orders
JOIN customers
	ON customers.customer_id = orders.customer_id

-- 29. Вывести только оплаченные заказы:
--     имя клиента, город и сумму заказа.
SELECT
	customers.first_name,
	customers.city,
	SUM(amount)
FROM orders
JOIN customers
	ON customers.customer_id = orders.customer_id
GROUP BY(customers.first_name)
HAVING orders.status = 'paid'
-- 30. Вывести оплаченные заказы дороже 2000:
--     имя клиента, сумму и статус заказа.
SELECT
	customers.first_name,
	customers.city,
	SUM(amount)
FROM orders
JOIN customers
	ON customers.customer_id = orders.customer_id
WHERE orders.status = 'paid'
GROUP BY customers.first_name, customers.city



/* ============================================================
   БЛОК 8. ИТОГОВЫЙ КЕЙС
   ============================================================ */

-- Руководитель просит отчёт по клиентам.
--
-- Нужно вывести:
-- 1. Имя клиента.
-- 2. Город клиента.
-- 3. Количество его оплаченных заказов.
-- 4. Общую сумму его оплаченных заказов.
--
-- Использовать:
-- JOIN
-- WHERE
-- GROUP BY
-- COUNT
-- SUM
-- AS
-- ORDER BY
--
-- Результат отсортировать по общей сумме покупок
-- от большей к меньшей.
SELECT
	customers.first_name AS Имя,
	customers.city AS Город,
	COUNT(amount) AS Колличество_заказов,
	SUM(amount) AS Сумма_оплаченных_заказов
FROM orders
JOIN customers
	ON customers.customer_id = orders.customer_id
WHERE orders.status = 'paid'
GROUP BY customers.first_name, customers.city
ORDER BY SUM(amount) DESC


/* ============================================================
   БОНУС
   ============================================================ */

-- 31. Вывести только тех клиентов,
--     у которых больше одного оплаченного заказа.
SELECT
	customers.first_name AS Имя,
	customers.city AS Город,
	COUNT(amount) AS Колличество_заказов,
	SUM(amount) AS Сумма_оплаченных_заказов
FROM orders
JOIN customers
	ON customers.customer_id = orders.customer_id
WHERE orders.status = 'paid'
GROUP BY customers.first_name, customers.city
HAVING COUNT(amount) > 1

-- 32. Вывести только тех клиентов,
--     чья общая сумма оплаченных заказов больше 5000.
SELECT
	customers.first_name AS Имя,
	customers.city AS Город,
	COUNT(amount) AS Колличество_заказов,
	SUM(amount) AS Сумма_оплаченных_заказов
FROM orders
JOIN customers
	ON customers.customer_id = orders.customer_id
WHERE orders.status = 'paid'
GROUP BY customers.first_name, customers.city
HAVING SUM(amount) > 5000


-- 33. Вывести три самых прибыльных клиента
--     по общей сумме оплаченных заказов.
SELECT
	customers.first_name AS Имя,
	customers.city AS Город,
	COUNT(amount) AS Колличество_заказов,
	SUM(amount) AS Сумма_оплаченных_заказов
FROM orders
JOIN customers
	ON customers.customer_id = orders.customer_id
WHERE orders.status = 'paid'
GROUP BY customers.first_name, customers.city
ORDER BY SUM(amount) DESC
LIMIT 3

/* ============================================================
   Ошибки 
   ============================================================

- Исправить опечатку `sity` → `city`.
- Внимательнее читать условия задачи (`<` и `>`, `paid` и `pending`).
- При использовании `GROUP BY` выводить не только агрегаты, но и поле группировки (`jobe`).
- Не использовать `SUM()` и `GROUP BY`, если нужно вывести каждый заказ отдельно.
- Запомнить: `WHERE` фильтрует строки, `HAVING` — группы.
- После `JOIN` указывать таблицу перед названием столбца (`orders.amount`, `customers.first_name`).
- Для подсчёта строк предпочтительно использовать `COUNT(*)` вместо `COUNT(column)`.
- Не забывать добавлять все условия задачи (например, `amount > 2000`).

   ============================================================ */
