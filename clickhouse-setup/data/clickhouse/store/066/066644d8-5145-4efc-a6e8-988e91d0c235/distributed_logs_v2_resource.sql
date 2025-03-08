ATTACH TABLE _ UUID 'd9a86ee8-c21c-47bc-a36f-5e0d30a0aedc'
(
    `labels` String CODEC(ZSTD(5)),
    `fingerprint` String CODEC(ZSTD(1)),
    `seen_at_ts_bucket_start` Int64 CODEC(Delta(8), ZSTD(1))
)
ENGINE = Distributed('cluster', 'signoz_logs', 'logs_v2_resource', cityHash64(labels, fingerprint))
