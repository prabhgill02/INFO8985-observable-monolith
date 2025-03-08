ATTACH TABLE _ UUID '5cec8cb7-6475-4ba2-9c5e-87a0baa58cbb'
(
    `name` String,
    `datatype` String
)
ENGINE = ReplacingMergeTree
ORDER BY (name, datatype)
SETTINGS index_granularity = 8192
