{{ config(description = 'This is a macro that one-hot-encodes a given column by its given possible values.') }}

{% macro one_hot_encode(column_name, values) %}
    {% for value in values %}
        CASE
            WHEN {{ column_name }} = '{{ value }}' THEN 1
            ELSE 0
        END as {{ column_name }}_{{ value }}
        {% if not loop.last %},{% endif %}
    {% endfor %}
{% endmacro %}
