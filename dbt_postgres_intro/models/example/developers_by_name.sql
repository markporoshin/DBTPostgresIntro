{{
    config(
        materialized='view',
    )
}}


select
    id,
    type
from {{ ref('developers') }} d
where d.name = '{{ var('developer_name') }}'