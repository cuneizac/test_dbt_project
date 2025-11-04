{% macro convert_to_aest(timestamp_col) %}
    -- Converts UTC timestamp to AEST (UTC+10)
    CONVERT_TIMEZONE('Australia/Sydney', {{ timestamp_col }})
{% endmacro %}