CREATE TABLE lakehouse.silver.fact_building_orders AS
SELECT
    l.orderkey,
    o.orderdate,
    o.shippriority,
    l.extendedprice,
    l.discount,
    l.shipdate
FROM lakehouse.bronze.raw_customer c
JOIN lakehouse.bronze.raw_orders o ON c.custkey = o.custkey
JOIN lakehouse.bronze.raw_lineitem l ON l.orderkey = o.orderkey
WHERE c.mktsegment = 'BUILDING'
  AND o.orderdate < DATE '1995-03-15'
  AND l.shipdate > DATE '1995-03-15';
