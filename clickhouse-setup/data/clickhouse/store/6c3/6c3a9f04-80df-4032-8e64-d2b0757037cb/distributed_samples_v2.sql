ATTACH TABLE _ UUID '29903607-68d0-48e4-9f56-5f0f67b003a8'
(
    `metric_name` LowCardinality(String),
    `fingerprint` UInt64 CODEC(DoubleDelta, LZ4),
    `timestamp_ms` Int64 CODEC(DoubleDelta, LZ4),
    `value` Float64 CODEC(Gorilla, LZ4)
)
ENGINE = Distributed('cluster', 'signoz_metrics', 'samples_v2', cityHash64(metric_name, fingerprint))
