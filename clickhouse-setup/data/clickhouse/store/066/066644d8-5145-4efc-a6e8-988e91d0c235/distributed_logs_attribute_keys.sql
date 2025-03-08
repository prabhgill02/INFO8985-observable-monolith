ATTACH TABLE _ UUID '22b9e428-bbfb-40f0-b9f9-6abe9f11f29a'
(
    `name` String,
    `datatype` String
)
ENGINE = Distributed('cluster', 'signoz_logs', 'logs_attribute_keys', cityHash64(datatype))
