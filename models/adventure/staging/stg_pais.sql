with
    source_data as (
        select
            countryregioncode,
            name
        from {{ source('erp_adventure', 'countryregion') }}
    )

select * from source_data