-- catalog bench_snappy: iceberg.compression-codec=SNAPPY
CREATE TABLE bench_snappy.bench.lineitem_snappy AS
SELECT * FROM lakehouse.bronze.raw_lineitem;
