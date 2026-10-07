-- Time travel: демонстрация восстановления после случайного DELETE

-- 1. "Случайное" удаление части строк
DELETE FROM lakehouse.silver.fact_building_orders
WHERE order_year = 1995 AND orderkey < 1000000;
-- DELETE: 4442 rows (30519 -> 26077)

SELECT count(*) FROM lakehouse.silver.fact_building_orders;
-- 26077

-- 2. Данные физически не исчезли: читаем снапшот ДО удаления
SELECT count(*) FROM lakehouse.silver.fact_building_orders
FOR VERSION AS OF 3288924225391149792;
-- 30519

-- 3. Реальное восстановление таблицы до состояния снапшота
CALL lakehouse.system.rollback_to_snapshot('silver', 'fact_building_orders', 3288924225391149792);

SELECT count(*) FROM lakehouse.silver.fact_building_orders;
-- 30519 (восстановлено)
