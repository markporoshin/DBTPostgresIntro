{{
    config(
        materialized='table',
    )
}}


{%- set types = ['Analytics', 'DataScience'] -%}


select
    id,
    name
from
    {{ ref('developers') }}
where type in (
    {%- for type in types -%}
        '{{ type }}'
        {%- if not loop.last %},{% endif -%}
    {%- endfor -%}
)