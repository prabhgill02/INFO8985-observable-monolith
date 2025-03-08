ATTACH TABLE _ UUID '087f45a9-9e33-4fb9-b42b-b4cb04357a12'
(
    `timestamp` DateTime64(9) CODEC(DoubleDelta, LZ4),
    `service_name` LowCardinality(String) CODEC(ZSTD(1)),
    `count` UInt64 CODEC(T64, ZSTD(1))
)
ENGINE = Distributed('cluster', 'signoz_traces', 'usage_explorer', cityHash64(rand()))
