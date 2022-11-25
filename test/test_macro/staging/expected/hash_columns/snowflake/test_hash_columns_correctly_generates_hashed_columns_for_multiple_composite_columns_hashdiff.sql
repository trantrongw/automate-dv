CAST(MD5_BINARY(NULLIF(UPPER(TRIM(CAST("BOOKING_REF" AS VARCHAR))), '')) AS BINARY(16)) AS "BOOKING_PK",

CAST(MD5_BINARY(CONCAT(
    IFNULL(NULLIF(UPPER(TRIM(CAST("CUSTOMER_ID" AS VARCHAR))), ''), '^^'), '||',
    IFNULL(NULLIF(UPPER(TRIM(CAST("NATIONALITY" AS VARCHAR))), ''), '^^'), '||',
    IFNULL(NULLIF(UPPER(TRIM(CAST("PHONE" AS VARCHAR))), ''), '^^')
)) AS BINARY(16)) AS "CUSTOMER_DETAILS",

CAST(MD5_BINARY(CONCAT(
    IFNULL(NULLIF(UPPER(TRIM(CAST("ORDER_AMOUNT" AS VARCHAR))), ''), '^^'), '||',
    IFNULL(NULLIF(UPPER(TRIM(CAST("ORDER_DATE" AS VARCHAR))), ''), '^^')
)) AS BINARY(16)) AS "ORDER_DETAILS"