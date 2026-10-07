CREATE TABLE lakehouse.gold.shipping_priority_top10 AS
SELECT
    orderkey,
    sum(extendedprice * (1 - discount)) AS revenue,
    orderdate,
    shippriority
FROM lakehouse.silver.fact_building_orders
GROUP BY orderkey, orderdate, shippriority
ORDER BY revenue DESC
LIMIT 10;
