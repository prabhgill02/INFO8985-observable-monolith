ATTACH TABLE _ UUID '56f01e67-fb0d-4125-a73d-7821e7fde0d1'
(
    `version` Int64,
    `dirty` UInt8,
    `sequence` UInt64
)
ENGINE = MergeTree
ORDER BY sequence
SETTINGS index_granularity = 8192
