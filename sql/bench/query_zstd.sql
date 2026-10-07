SELECT count(*), sum(extendedprice * (1 - discount))
FROM bench_zstd.bench.lineitem_zstd
WHERE shipdate > DATE '1995-01-01';
