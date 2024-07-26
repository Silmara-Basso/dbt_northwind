with sources as (

select * from {{ source('northwind', 'orders')}}

)

select 
*
from 
    sources
    