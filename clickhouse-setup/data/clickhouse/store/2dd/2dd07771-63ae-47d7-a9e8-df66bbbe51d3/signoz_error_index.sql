ATTACH TABLE _ UUID 'ed27663e-c6de-44d3-82ea-16c0f865e349'
(
    `timestamp` DateTime64(9) CODEC(Delta(8), ZSTD(1)),
    `errorID` String CODEC(ZSTD(1)),
    `traceID` String CODEC(ZSTD(1)),
    `spanID` String CODEC(ZSTD(1)),
    `parentSpanID` String CODEC(ZSTD(1)),
    `serviceName` LowCardinality(String) CODEC(ZSTD(1)),
    `exceptionType` LowCardinality(String) CODEC(ZSTD(1)),
    `exceptionMessage` LowCardinality(String) CODEC(ZSTD(1)),
    `exceptionStacktrace` LowCardinality(String) CODEC(ZSTD(1)),
    `exceptionEscaped` LowCardinality(String) CODEC(ZSTD(1)),
    INDEX idx_traceID traceID TYPE bloom_filter GRANULARITY 4,
    INDEX idx_service serviceName TYPE bloom_filter GRANULARITY 4,
    INDEX idx_message exceptionMessage TYPE bloom_filter GRANULARITY 4,
    INDEX idx_type exceptionType TYPE bloom_filter GRANULARITY 4
)
ENGINE = MergeTree
PARTITION BY toDate(timestamp)
ORDER BY (exceptionType, exceptionMessage, serviceName, -toUnixTimestamp(timestamp))
SETTINGS index_granularity = 8192
