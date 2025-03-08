ATTACH TABLE _ UUID '977019a5-7db9-4625-af35-e4a55849d0d0'
(
    `env` LowCardinality(String) DEFAULT 'default',
    `temporality` LowCardinality(String) DEFAULT 'Unspecified',
    `metric_name` LowCardinality(String),
    `description` LowCardinality(String) DEFAULT '' CODEC(ZSTD(1)),
    `unit` LowCardinality(String) DEFAULT '' CODEC(ZSTD(1)),
    `type` LowCardinality(String) DEFAULT '' CODEC(ZSTD(1)),
    `is_monotonic` Bool DEFAULT false CODEC(ZSTD(1)),
    `fingerprint` UInt64 CODEC(Delta(8), ZSTD(1)),
    `unix_milli` Int64 CODEC(Delta(8), ZSTD(1)),
    `labels` String CODEC(ZSTD(5))
)
ENGINE = Distributed('cluster', 'signoz_metrics', 'time_series_v4_1week', cityHash64(env, temporality, metric_name, fingerprint))
