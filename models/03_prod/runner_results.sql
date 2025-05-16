with results as (
    select *
    from {{ ref('stg_results') }}
),

runners as (
    select *
    from {{ ref('stg_runners') }}
)

select
    r.runner_id,
    r.name,
    r.gender,
    res.event,
    res.time_minutes,
    {{ calculate_runner_pace('res.distance_in_km', 'res.time_minutes') }} as pace_min_per_km
from results res
join runners r
    on res.runner_id = r.runner_id