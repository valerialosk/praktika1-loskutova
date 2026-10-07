SELECT count(*), sum(extendedprice * (1 - discount))
FROM bench_snappy.bench.lineitem_snappy
WHERE shipdate > DATE '1995-01-01';
