with
    source_data as (
        select
            customerid,
            personid
        from {{ source('erp_adventure', 'customer') }}
    )

select * from source_data