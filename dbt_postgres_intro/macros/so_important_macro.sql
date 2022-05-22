{% macro so_important_macro(number) %}
    {% set so_important_query %}
        select 1 as info
        union
        select 2 as info
    {% endset %}
    {%- set info = run_query(so_important_query).columns[0].values() -%}
    {{ log('number ' + number|string, info=True) }}
    {{ return(info) }}
{% endmacro %}