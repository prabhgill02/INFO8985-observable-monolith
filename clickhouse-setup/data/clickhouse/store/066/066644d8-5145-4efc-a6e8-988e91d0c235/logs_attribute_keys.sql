ATTACH TABLE _ UUID '15501ea7-2941-4e26-8136-18c208d33d50'
(
    `name` String,
    `datatype` String
)
ENGINE = ReplacingMergeTree
ORDER BY (name, datatype)
SETTINGS index_granularity = 8192
