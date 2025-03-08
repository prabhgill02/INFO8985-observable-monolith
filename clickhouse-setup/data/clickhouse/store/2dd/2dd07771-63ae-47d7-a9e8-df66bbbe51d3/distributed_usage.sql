ATTACH TABLE _ UUID 'f5e0ffae-c5c8-4e52-8770-29e242aa37ae'
(
    `tenant` String,
    `collector_id` String,
    `exporter_id` String,
    `timestamp` DateTime,
    `data` String
)
ENGINE = Distributed('cluster', 'signoz_traces', 'usage', cityHash64(rand()))
