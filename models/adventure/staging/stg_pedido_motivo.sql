with
    source_data as (
        select
            salesorderid,
            salesreasonid
        from {{ source('erp_adventure', 'salesorderheadersalesreason') }}
    )

select * from source_data