ATTACH TABLE _ UUID '325f4634-54d4-483b-8f2d-e2891076ffb8'
(
    `ts_bucket_start` UInt64 CODEC(DoubleDelta, LZ4),
    `resource_fingerprint` String CODEC(ZSTD(1)),
    `timestamp` UInt64 CODEC(DoubleDelta, LZ4),
    `observed_timestamp` UInt64 CODEC(DoubleDelta, LZ4),
    `id` String CODEC(ZSTD(1)),
    `trace_id` String CODEC(ZSTD(1)),
    `span_id` String CODEC(ZSTD(1)),
    `trace_flags` UInt32,
    `severity_text` LowCardinality(String) CODEC(ZSTD(1)),
    `severity_number` UInt8,
    `body` String CODEC(ZSTD(2)),
    `attributes_string` Map(LowCardinality(String), String) CODEC(ZSTD(1)),
    `attributes_number` Map(LowCardinality(String), Float64) CODEC(ZSTD(1)),
    `attributes_bool` Map(LowCardinality(String), Bool) CODEC(ZSTD(1)),
    `resources_string` Map(LowCardinality(String), String) CODEC(ZSTD(1)),
    `scope_name` String CODEC(ZSTD(1)),
    `scope_version` String CODEC(ZSTD(1)),
    `scope_string` Map(LowCardinality(String), String) CODEC(ZSTD(1))
)
ENGINE = Distributed('cluster', 'signoz_logs', 'logs_v2', cityHash64(id))
