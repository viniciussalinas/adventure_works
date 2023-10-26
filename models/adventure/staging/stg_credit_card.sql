with
    source_data as (
        select
            creditcardid,
            cardtype
        from {{ source('erp_adventure', 'creditcard') }}
    )

select * from source_data