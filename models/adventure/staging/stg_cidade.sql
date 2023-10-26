with
    source_data as (
        select
            addressid, 
            stateprovinceid, 
            city
        from {{ source('erp_adventure', 'address') }}
    )

select * from source_data