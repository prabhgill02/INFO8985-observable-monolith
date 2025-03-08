ATTACH MATERIALIZED VIEW _ UUID '9e2ab0f9-0d25-4e96-a21b-8868303fb7dd' TO signoz_metrics.time_series_v4_6hrs
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
    floor(unix_milli / 21600000) * 21600000 AS unix_milli,
    labels
FROM signoz_metrics.time_series_v4
