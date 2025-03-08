ATTACH TABLE _ UUID '8d334474-9ef8-4e9d-b7fa-3c7f127988bf'
(
    `version` Int64,
    `dirty` UInt8,
    `sequence` UInt64
)
ENGINE = MergeTree
ORDER BY sequence
SETTINGS index_granularity = 8192
