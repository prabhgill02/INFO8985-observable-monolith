ATTACH TABLE _ UUID '40743085-3bf8-4a7c-8ddf-9cb205e5baef'
(
    `version` Int64,
    `dirty` UInt8,
    `sequence` UInt64
)
ENGINE = MergeTree
ORDER BY sequence
SETTINGS index_granularity = 8192
