{% test no_future_timestamps(model, column_name) %}
-- Fail if any value is in the future (warehouse current time)
select {{ column_name }} as offending_value
from {{ model }}
where {{ column_name }} > current_timestamp()
{% endtest %}