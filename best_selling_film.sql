{{ config(
    materialized="table",
    schema="mart"
) }}

select 
    title 
FROM {{ ref('film') }}
    where rental_duration >= (
        select max(rental_duration) 
        FROM {{ ref('film') }})