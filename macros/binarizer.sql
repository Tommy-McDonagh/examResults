{{ config(description = 'This is a macro that binarizes a given column name by a given value.') }}

{% macro binarizer(column_name, value) %}
    CASE
        WHEN {{ column_name }} = '{{ value }}' THEN 1
        ELSE 0
    END as {{ column_name }}_{{ value }}
{% endmacro %}
