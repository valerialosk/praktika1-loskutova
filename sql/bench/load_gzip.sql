-- catalog bench_gzip: iceberg.compression-codec=GZIP
CREATE TABLE bench_gzip.bench.lineitem_gzip AS
SELECT * FROM lakehouse.bronze.raw_lineitem;
