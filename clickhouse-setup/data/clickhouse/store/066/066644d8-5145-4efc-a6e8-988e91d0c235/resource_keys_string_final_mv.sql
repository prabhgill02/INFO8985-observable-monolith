ATTACH MATERIALIZED VIEW _ UUID '7ef3fe57-e68b-4d7b-aba1-db5d522adf85' TO signoz_logs.logs_resource_keys
(
    `name` String,
    `datatype` String
) AS
SELECT DISTINCT
    arrayJoin(mapKeys(resources_string)) AS name,
    'String' AS datatype
FROM signoz_logs.logs_v2
ORDER BY name ASC
