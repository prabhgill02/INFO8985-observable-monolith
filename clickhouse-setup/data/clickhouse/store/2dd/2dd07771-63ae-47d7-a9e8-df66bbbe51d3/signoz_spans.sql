ATTACH TABLE _ UUID 'f1863f9e-81d9-4826-bffc-dff7db689c27'
(
    `timestamp` DateTime64(9) CODEC(DoubleDelta, LZ4),
    `traceID` FixedString(32) CODEC(ZSTD(1)),
    `model` String CODEC(ZSTD(9))
)
ENGINE = MergeTree
PARTITION BY toDate(timestamp)
ORDER BY traceID
TTL toDateTime(timestamp) + toIntervalSecond(1296000)
SETTINGS index_granularity = 1024, ttl_only_drop_parts = 1
