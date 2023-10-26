with
    source_data as (
        select
            stateprovinceid,
            name,
            countryregioncode
        from {{ source('erp_adventure', 'stateprovince') }}
    )

select * from source_data