ATTACH MATERIALIZED VIEW _ UUID '724d372e-f61a-46aa-a6df-c09e3454feb7' TO signoz_logs.logs_attribute_keys
(
    `name` String,
    `datatype` String
) AS
SELECT DISTINCT
    arrayJoin(mapKeys(attributes_string)) AS name,
    'String' AS datatype
FROM signoz_logs.logs_v2
ORDER BY name ASC
