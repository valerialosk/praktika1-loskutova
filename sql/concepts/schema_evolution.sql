-- Эволюция схемы: добавление колонки не требует переписывания старых файлов (Iceberg)
ALTER TABLE lakehouse.silver.fact_building_orders ADD COLUMN order_year INTEGER;

UPDATE lakehouse.silver.fact_building_orders SET order_year = year(orderdate);
-- UPDATE: 30519 rows

-- Проверка: snapshots показывают два события (append -> overwrite)
SELECT snapshot_id, committed_at, operation
FROM lakehouse.silver."fact_building_orders$snapshots"
ORDER BY committed_at;
