{{ config (
    materialized='incremental',
    unique_key='id',
    on_schema_changes='fail'
    ) }}

with vendas as (
    select 
        *
    from
        {{ref("stg_crm__nova_tabela")}}
)

select * from vendas

{% if is_incremental() %}

-- Assuming Postgres database 
where updated_at>
(select max(updated_at) from {{ this }})

{% endif %}
