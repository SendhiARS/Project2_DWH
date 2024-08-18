{{ config(
    materialized="table",
    schema="mart"
) }}

SELECT
    sum(amount) as total_rev,
    payment_date 
FROM {{ ref('payment') }}
group by payment_date