ATTACH TABLE _ UUID '4ec2bf25-c7c1-48ab-a0c5-ec7c1dbc397d'
(
    `timestamp` DateTime64(9) CODEC(DoubleDelta, LZ4),
    `traceID` FixedString(32) CODEC(ZSTD(1)),
    `model` String CODEC(ZSTD(9))
)
ENGINE = Distributed('cluster', 'signoz_traces', 'signoz_spans', cityHash64(traceID))
