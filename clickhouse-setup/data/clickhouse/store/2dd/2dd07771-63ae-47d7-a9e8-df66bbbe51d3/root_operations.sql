ATTACH MATERIALIZED VIEW _ UUID '9bedc867-2dd8-40e5-9abe-e781d0a40e08' TO signoz_traces.top_level_operations
(
    `name` LowCardinality(String),
    `serviceName` LowCardinality(String)
) AS
SELECT DISTINCT
    name,
    serviceName
FROM signoz_traces.signoz_index_v2
WHERE parentSpanID = ''
