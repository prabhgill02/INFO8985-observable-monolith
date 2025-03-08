ATTACH TABLE _ UUID 'c72249b7-4128-41a4-953d-fea5dbdc1a72'
(
    `name` LowCardinality(String) CODEC(ZSTD(1)),
    `serviceName` LowCardinality(String) CODEC(ZSTD(1)),
    `time` DateTime DEFAULT now() CODEC(ZSTD(1))
)
ENGINE = ReplacingMergeTree
ORDER BY (serviceName, name)
TTL time + toIntervalMonth(1)
SETTINGS index_granularity = 8192
