{{
    config(
        materialized='incremental'
    )
}}


select distinct on (src.id)
    src.*
from
    {{ source('raw', 'raw_source') }} src
{% if is_incremental() %}
    left join
    {{ this }} dst
    on src.id = dst.id
where dst.id is null
{% endif %}