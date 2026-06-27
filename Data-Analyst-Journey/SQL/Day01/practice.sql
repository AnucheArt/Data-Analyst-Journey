-- 1.1. Вывести всех пользователей
SELECT *
FROM users;


-- 1.2. Вывести только имена пользователей
SELECT name
FROM users;


-- 1.3. Вывести пользователей старше 24 лет
SELECT *
FROM users
WHERE age > 24;


-- 1.4. Отсортировать пользователей по возрасту
-- от старшего к младшему
SELECT *
FROM users
ORDER BY age DESC;


-- 1.5. Вывести первые три записи
SELECT *
FROM users
LIMIT 3;


/* ============================================================
   2. ORDERS — БАЗОВАЯ АНАЛИТИКА ЗАКАЗОВ
   ============================================================ */

-- 2.1. Вывести все заказы
SELECT *
FROM orders;


-- 2.2. Вывести все оплаченные заказы
SELECT *
FROM orders
WHERE status = 'paid';


-- 2.3. Вывести заказы дороже 3000
SELECT *
FROM orders
WHERE amount > 3000;


-- 2.4. Отсортировать все заказы по сумме
-- от самого дорогого к самому дешёвому
SELECT *
FROM orders
ORDER BY amount DESC;


-- 2.5. Вывести 10 самых дорогих оплаченных заказов
SELECT *
FROM orders
WHERE status = 'paid'
ORDER BY amount DESC
LIMIT 10;


-- 2.6. Найти самый дорогой оплаченный заказ
SELECT *
FROM orders
WHERE status = 'paid'
ORDER BY amount DESC
LIMIT 1;


/* ============================================================
   3. ORDERS — АГРЕГАТНЫЕ ФУНКЦИИ
   ============================================================ */

-- 3.1. Посчитать количество всех заказов
SELECT COUNT(*)
FROM orders;


-- 3.2. Посчитать количество оплаченных заказов
SELECT COUNT(*)
FROM orders
WHERE status = 'paid';


-- 3.3. Посчитать общую сумму всех заказов
SELECT SUM(amount)
FROM orders;


-- 3.4. Посчитать общую сумму оплаченных заказов
SELECT SUM(amount)
FROM orders
WHERE status = 'paid';


-- 3.5. Посчитать средний чек оплаченных заказов
SELECT AVG(amount)
FROM orders
WHERE status = 'paid';


-- 3.6. Найти максимальную сумму заказа
SELECT MAX(amount)
FROM orders;


-- 3.7. Найти минимальную сумму заказа
SELECT MIN(amount)
FROM orders;


/* ============================================================
   4. EMPLOYEES — ФИЛЬТРАЦИЯ
   ============================================================ */

-- 4.1. Вывести всех сотрудников
SELECT *
FROM employees;


-- 4.2. Вывести только зарплаты сотрудников
SELECT salary
FROM employees;


-- 4.3. Вывести сотрудников с зарплатой больше 100000
SELECT *
FROM employees
WHERE salary > 100000;


/* ============================================================
   5. EMPLOYEES — GROUP BY
   ============================================================ */

-- 5.1. Посчитать количество сотрудников по должностям
SELECT
    jobe,
    COUNT(*) AS employees
FROM employees
GROUP BY jobe;


-- 5.2. Посчитать среднюю зарплату по должностям
SELECT
    jobe,
    AVG(salary) AS avg_salary
FROM employees
GROUP BY jobe;


-- 5.3. Найти максимальную зарплату по должностям
SELECT
    jobe,
    MAX(salary) AS max_salary
FROM employees
GROUP BY jobe;


-- 5.4. Найти минимальную зарплату по должностям
SELECT
    jobe,
    MIN(salary) AS min_salary
FROM employees
GROUP BY jobe;


-- 5.5. Посчитать фонд оплаты труда по должностям
SELECT
    jobe,
    SUM(salary) AS total_salary
FROM employees
GROUP BY jobe;


/* ============================================================
   6. EMPLOYEES — HAVING
   ============================================================ */

-- 6.1. Вывести должности, на которых работает больше двух человек
SELECT
    jobe,
    COUNT(*) AS employees
FROM employees
GROUP BY jobe
HAVING COUNT(*) > 2;


-- 6.2. Вывести должности со средней зарплатой больше 100000
SELECT
    jobe,
    AVG(salary) AS avg_salary
FROM employees
GROUP BY jobe
HAVING AVG(salary) > 100000;


-- 6.3. Вывести должности с фондом оплаты труда больше 300000
SELECT
    jobe,
    SUM(salary) AS total_salary
FROM employees
GROUP BY jobe
HAVING SUM(salary) > 300000;


/* ============================================================
   7. EMPLOYEES — СВОДНЫЙ АНАЛИТИЧЕСКИЙ ОТЧЁТ
   ============================================================ */

-- Для каждой должности вывести:
-- количество сотрудников;
-- среднюю, максимальную и минимальную зарплату;
-- общий фонд оплаты труда.

SELECT
    jobe,
    COUNT(*) AS employees,
    AVG(salary) AS avg_salary,
    MAX(salary) AS max_salary,
    MIN(salary) AS min_salary,
    SUM(salary) AS total_salary
FROM employees
GROUP BY jobe;


/* ============================================================
   8. INNER JOIN — СОЕДИНЕНИЕ КЛИЕНТОВ И ЗАКАЗОВ
   ============================================================ */

-- Вывести имя клиента и сумму каждого его заказа
SELECT
    customers.first_name,
    orders.amount
FROM orders
JOIN customers
    ON orders.customer_id = customers.customer_id;