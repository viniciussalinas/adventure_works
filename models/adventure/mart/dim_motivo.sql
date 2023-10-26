{{ config(materialized='table') }}

with 
    staging as (
        select *
        from {{ref('stg_motivo')}}
    ),
    transformed as (
        select
            salesreasonid as idMotivo,
            name as motivoVenda
        from staging
    )

select * from transformed