{{
    config(
        materialized='table'
    )
}}

{% set names_start_with_a_query %}
    select
        name
    from
        {{ ref('developers') }}
    where lower(name) like 'a%'
{% endset %}

{% set names_start_with_a = [] %}
{% if execute %}
    {% set names_start_with_a = run_query(names_start_with_a_query).columns[0].values() %}
    {{ log(names_start_with_a, info=True) }}
{% endif %}

select
    id,
    name,
    type
from
    {{ ref('developers') }}
{% if names_start_with_a != () %}
    where name in (
        {%- for name in names_start_with_a %}
            '{{ name }}'
            {%- if not loop.last %},{% endif -%}
        {%- endfor -%}
    )
{% endif %}