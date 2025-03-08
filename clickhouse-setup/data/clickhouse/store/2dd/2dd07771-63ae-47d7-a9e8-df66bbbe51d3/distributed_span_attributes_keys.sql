ATTACH TABLE _ UUID 'f296b012-0ca4-476e-b3a8-989ab5dc67cd'
(
    `tagKey` LowCardinality(String) CODEC(ZSTD(1)),
    `tagType` Enum8('tag' = 1, 'resource' = 2) CODEC(ZSTD(1)),
    `dataType` Enum8('string' = 1, 'bool' = 2, 'float64' = 3) CODEC(ZSTD(1)),
    `isColumn` Bool CODEC(ZSTD(1))
)
ENGINE = Distributed('cluster', 'signoz_traces', 'span_attributes_keys', cityHash64(rand()))
