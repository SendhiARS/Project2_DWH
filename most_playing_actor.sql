{{ config(
    materialized="table",
    schema="mart"
) }}

select 
    count(dfa.actor_id), 
    da.first_name, 
    da.last_name 
FROM {{ ref('film_actor') }} as dfa
join {{ ref('actor') }} as da
on da.actor_id = dfa.actor_id 
group by dfa.actor_id, da.first_name , da.last_name  
order by count desc