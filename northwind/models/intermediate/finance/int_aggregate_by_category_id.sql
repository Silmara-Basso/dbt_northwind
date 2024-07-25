with int_aggregate_by_category_id as (
    Select 
        id,
        count(* )
    from
        {{ref("stg_crm__nova_tabela")}}
    group by
        id
)

select * from int_aggregate_by_category_id
