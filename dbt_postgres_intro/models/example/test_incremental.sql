{{
    config(
        materialized='incremental'
    )
}}

{%- set data_to_insert = 1 -%}

{% if is_incremental() and execute %}
    {% set max_number_query %}
        select max(num) from {{ this }}
    {% endset %}
    {% set data_to_insert = run_query(max_number_query).columns[0].values()[0]|int + 1 %}
{% endif %}

{{ log('number to insert: ' + data_to_insert|string, info=True)}}

select {{ data_to_insert }} as num