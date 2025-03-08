ATTACH TABLE _ UUID 'badb1cf2-e5e8-4b2b-ab83-d64720a08035'
(
    `labels` String CODEC(ZSTD(5)),
    `fingerprint` String CODEC(ZSTD(1)),
    `seen_at_ts_bucket_start` Int64 CODEC(Delta(8), ZSTD(1)),
    INDEX idx_labels lower(labels) TYPE ngrambf_v1(4, 1024, 3, 0) GRANULARITY 1,
    INDEX idx_labels_v1 labels TYPE ngrambf_v1(4, 1024, 3, 0) GRANULARITY 1
)
ENGINE = ReplicatedReplacingMergeTree('/clickhouse/tables/{uuid}/{shard}', '{replica}')
PARTITION BY toDate(seen_at_ts_bucket_start / 1000)
ORDER BY (labels, fingerprint, seen_at_ts_bucket_start)
TTL (toDateTime(seen_at_ts_bucket_start) + toIntervalSecond(1296000)) + toIntervalSecond(1800)
SETTINGS ttl_only_drop_parts = 1, index_granularity = 8192
