with results as (
    select *
    from {{ ref('stg_results') }}
),

events as (
    select *
    from {{ ref('events') }}
)

select
    res.runner_id,
    ev.event_id,
    res.event,
    res.time_minutes,
    res.distance_in_km,
    res.distance_in_m
from results res
left join events ev
    on res.event = ev.event_name