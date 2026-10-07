-- catalog bench_zstd: iceberg.compression-codec=ZSTD
CREATE TABLE bench_zstd.bench.lineitem_zstd AS
SELECT * FROM lakehouse.bronze.raw_lineitem;
