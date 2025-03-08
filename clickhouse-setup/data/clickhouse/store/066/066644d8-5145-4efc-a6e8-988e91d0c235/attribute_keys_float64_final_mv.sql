ATTACH MATERIALIZED VIEW _ UUID '99876522-174a-4da9-9126-3725124ec2f5' TO signoz_logs.logs_attribute_keys
(
    `name` String,
    `datatype` String
) AS
SELECT DISTINCT
    arrayJoin(mapKeys(attributes_number)) AS name,
    'Float64' AS datatype
FROM signoz_logs.logs_v2
ORDER BY name ASC
