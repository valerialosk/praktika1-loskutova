SELECT 'zstd' AS codec, sum(file_size_in_bytes) AS total_bytes, count(*) AS file_count FROM bench_zstd.bench."lineitem_zstd$files"
UNION ALL
SELECT 'gzip', sum(file_size_in_bytes), count(*) FROM bench_gzip.bench."lineitem_gzip$files"
UNION ALL
SELECT 'snappy', sum(file_size_in_bytes), count(*) FROM bench_snappy.bench."lineitem_snappy$files";
