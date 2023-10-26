{{ config(materialized='table') }}

with 
    staging as (
        select *
        from {{ref('stg_cliente')}}
    ),
    transformed as (
        select
            personid as idCliente,
            CONCAT (firstname, ' ', lastname) as nomeCliente
        from staging
    )

select * from transformed