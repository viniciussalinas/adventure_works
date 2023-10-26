with
    source_data as (
        select
            salesreasonid,
            name
        from {{ source('erp_adventure', 'salesreason') }}
    )

select * from source_data