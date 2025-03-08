ATTACH MATERIALIZED VIEW _ UUID '76438777-7477-4598-8105-7dd9a36127f0' TO signoz_traces.durationSort
(
    `timestamp` DateTime64(9),
    `traceID` FixedString(32),
    `spanID` String,
    `parentSpanID` String,
    `serviceName` LowCardinality(String),
    `name` LowCardinality(String),
    `kind` Int8,
    `durationNano` UInt64,
    `statusCode` Int16,
    `httpMethod` LowCardinality(String),
    `httpUrl` LowCardinality(String),
    `httpRoute` LowCardinality(String),
    `httpHost` LowCardinality(String),
    `hasError` Bool,
    `rpcSystem` LowCardinality(String),
    `rpcService` LowCardinality(String),
    `rpcMethod` LowCardinality(String),
    `responseStatusCode` LowCardinality(String),
    `stringTagMap` Map(String, String),
    `numberTagMap` Map(String, Float64),
    `boolTagMap` Map(String, Bool),
    `isRemote` LowCardinality(String),
    `statusMessage` String,
    `statusCodeString` String,
    `spanKind` String
) AS
SELECT
    timestamp,
    traceID,
    spanID,
    parentSpanID,
    serviceName,
    name,
    kind,
    durationNano,
    statusCode,
    httpMethod,
    httpUrl,
    httpRoute,
    httpHost,
    hasError,
    rpcSystem,
    rpcService,
    rpcMethod,
    responseStatusCode,
    stringTagMap,
    numberTagMap,
    boolTagMap,
    isRemote,
    statusMessage,
    statusCodeString,
    spanKind
FROM signoz_traces.signoz_index_v2
ORDER BY
    durationNano ASC,
    timestamp ASC
