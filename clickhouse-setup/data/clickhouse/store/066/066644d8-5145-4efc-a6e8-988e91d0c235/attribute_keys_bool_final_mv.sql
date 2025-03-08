ATTACH MATERIALIZED VIEW _ UUID '2f698622-348d-4fa3-8d7b-296af35bf843' TO signoz_logs.logs_attribute_keys
(
    `name` String,
    `datatype` String
) AS
SELECT DISTINCT
    arrayJoin(mapKeys(attributes_bool)) AS name,
    'Bool' AS datatype
FROM signoz_logs.logs_v2
ORDER BY name ASC
