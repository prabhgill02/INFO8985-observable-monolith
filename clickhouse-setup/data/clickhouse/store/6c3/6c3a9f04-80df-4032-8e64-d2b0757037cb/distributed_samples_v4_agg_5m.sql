ATTACH TABLE _ UUID '375d15f7-eb30-4860-8692-6ee550795076'
(
    `env` LowCardinality(String) DEFAULT 'default',
    `temporality` LowCardinality(String) DEFAULT 'Unspecified',
    `metric_name` LowCardinality(String),
    `fingerprint` UInt64 CODEC(ZSTD(1)),
    `unix_milli` Int64 CODEC(DoubleDelta, ZSTD(1)),
    `last` SimpleAggregateFunction(anyLast, Float64) CODEC(ZSTD(1)),
    `min` SimpleAggregateFunction(min, Float64) CODEC(ZSTD(1)),
    `max` SimpleAggregateFunction(max, Float64) CODEC(ZSTD(1)),
    `sum` SimpleAggregateFunction(sum, Float64) CODEC(ZSTD(1)),
    `count` SimpleAggregateFunction(sum, UInt64) CODEC(ZSTD(1))
)
ENGINE = Distributed('cluster', 'signoz_metrics', 'samples_v4_agg_5m', cityHash64(env, temporality, metric_name, fingerprint))
