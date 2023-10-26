{{ config(materialized='table') }}

with 
    staging as (
        select *
        from {{ref('stg_credit_card')}}
    ),
    transformed as (
        select
            creditcardid as idCartao,
            cardtype as tipoCartao
        from staging
    )

select * from transformed