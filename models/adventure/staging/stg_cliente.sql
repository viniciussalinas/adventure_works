with
    source_data as (
        select
            businessentityid as personid,
            firstname,
            middlename,
            lastname
        from {{ source('erp_adventure', 'person') }}
    )

select * from source_data