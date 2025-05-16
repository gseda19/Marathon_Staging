{% macro calculate_runner_pace(distance_km, finish_time_minutes) %}
    case 
        when {{ distance_km }} > 0 then ROUND({{ finish_time_minutes }} / {{ distance_km }}, 2)
        else null
    end
{% endmacro %}