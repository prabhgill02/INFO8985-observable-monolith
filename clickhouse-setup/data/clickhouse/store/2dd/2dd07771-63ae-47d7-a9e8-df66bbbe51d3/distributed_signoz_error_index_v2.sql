ATTACH TABLE _ UUID 'fbd0d0cc-8df5-41e8-adf1-a6a356fd5df7'
(
    `timestamp` DateTime64(9) CODEC(DoubleDelta, LZ4),
    `errorID` FixedString(32) CODEC(ZSTD(1)),
    `groupID` FixedString(32) CODEC(ZSTD(1)),
    `traceID` FixedString(32) CODEC(ZSTD(1)),
    `spanID` String CODEC(ZSTD(1)),
    `serviceName` LowCardinality(String) CODEC(ZSTD(1)),
    `exceptionType` LowCardinality(String) CODEC(ZSTD(1)),
    `exceptionMessage` String CODEC(ZSTD(1)),
    `exceptionStacktrace` String CODEC(ZSTD(1)),
    `exceptionEscaped` Bool CODEC(T64, ZSTD(1)),
    `resourceTagsMap` Map(LowCardinality(String), String) CODEC(ZSTD(1))
)
ENGINE = Distributed('cluster', 'signoz_traces', 'signoz_error_index_v2', cityHash64(groupID))
