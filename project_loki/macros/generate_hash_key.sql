{% macro generate_hash_key(columns) %}
    {#-
        Generates a null-safe, order-stable hash key.
        - Sorts the input column list alphabetically for deterministic output.
        - Coalesces nulls to '∅' and normalizes case/whitespace.
    -#}

    {% set sorted_cols = columns | sort %}

    md5(
        concat_ws(
            '||',
            {% for col in sorted_cols %}
                coalesce(trim(upper(cast({{ col }} as varchar))), '∅'){% if not loop.last %}, {% endif %}
            {% endfor %}
        )
    )
{% endmacro %}