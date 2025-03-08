ATTACH TABLE _ UUID '47132f85-94c8-41bd-99a9-e8f2e68117fe'
(
    `tenant` String,
    `collector_id` String,
    `exporter_id` String,
    `timestamp` DateTime,
    `data` String
)
ENGINE = Distributed('cluster', 'signoz_metrics', 'usage', cityHash64(rand()))
