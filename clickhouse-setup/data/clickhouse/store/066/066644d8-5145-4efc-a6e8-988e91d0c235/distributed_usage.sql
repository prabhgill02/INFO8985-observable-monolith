ATTACH TABLE _ UUID '8d7e2c36-a469-49b0-b3c7-8d82805ad8db'
(
    `tenant` String,
    `collector_id` String,
    `exporter_id` String,
    `timestamp` DateTime,
    `data` String
)
ENGINE = Distributed('cluster', 'signoz_logs', 'usage', cityHash64(rand()))
