SELECT count(*), sum(extendedprice * (1 - discount))
FROM bench_gzip.bench.lineitem_gzip
WHERE shipdate > DATE '1995-01-01';
