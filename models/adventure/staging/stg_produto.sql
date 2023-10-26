with
    source_data as (
        select
            productid,
            name
        from {{ source('erp_adventure', 'product') }}
    )

select * from source_data