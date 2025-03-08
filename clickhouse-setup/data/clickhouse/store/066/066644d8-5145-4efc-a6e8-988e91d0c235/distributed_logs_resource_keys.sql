ATTACH TABLE _ UUID '75ad0c8d-a8ec-427d-bc9e-3e7f640f5d97'
(
    `name` String,
    `datatype` String
)
ENGINE = Distributed('cluster', 'signoz_logs', 'logs_resource_keys', cityHash64(datatype))
