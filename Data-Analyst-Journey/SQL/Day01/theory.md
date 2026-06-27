# День 1. Основы SQL

## Изученные темы

- SELECT
- FROM
- WHERE
- ORDER BY
- LIMIT
- COUNT()
- SUM()
- AVG()
- MAX()
- MIN()

---

## SELECT

Используется для получения данных из таблицы.

Пример:

SELECT *
FROM users;

или

SELECT first_name
FROM users;

---

## WHERE

Фильтрация строк.

Пример:

SELECT *
FROM orders
WHERE status = 'paid';

---

## ORDER BY

Сортировка данных.

ASC — по возрастанию.

DESC — по убыванию.

Пример:

SELECT *
FROM orders
ORDER BY amount DESC;

---

## LIMIT

Ограничение количества строк.

Пример:

SELECT *
FROM orders
LIMIT 10;

---

## Агрегатные функции

COUNT() — количество строк.

SUM() — сумма.

AVG() — среднее значение.

MAX() — максимальное значение.

MIN() — минимальное значение.