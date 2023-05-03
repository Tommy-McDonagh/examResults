{% macro one_hot_encode(column_name, values) %}
    CASE
        {% for value in values %}
            WHEN {{ column_name }} = '{{ value }}' THEN 1
        {% endfor %}
        ELSE 0
    END as {{ column_name }}_{{ values|join('_') }}_OHE
{% endmacro %}
