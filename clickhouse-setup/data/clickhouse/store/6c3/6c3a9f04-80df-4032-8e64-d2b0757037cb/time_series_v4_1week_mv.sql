ATTACH MATERIALIZED VIEW _ UUID '0db51dc5-ab6b-4293-82b9-6901f498e517' TO signoz_metrics.time_series_v4_1week
(
    `env` LowCardinality(String),
    `temporality` LowCardinality(String),
    `metric_name` LowCardinality(String),
    `description` LowCardinality(String),
    `unit` LowCardinality(String),
    `type` LowCardinality(String),
    `is_monotonic` Bool,
    `fingerprint` UInt64,
    `unix_milli` Float64,
    `labels` String
) AS
SELECT
    env,
    temporality,
    metric_name,
    description,
    unit,
    type,
    is_monotonic,
    fingerprint,
    floor(unix_milli / 604800000) * 604800000 AS unix_milli,
    labels
FROM signoz_metrics.time_series_v4_1day
