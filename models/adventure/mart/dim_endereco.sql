{{ config(materialized='table') }}

with
    pais as (
        select
            countryregioncode,
            name
        from {{ref('stg_pais')}}
    ),
    estado as (
        select
            stateprovinceid,
            name,
            countryregioncode
        from {{ref('stg_estado')}}
    ),
    endereco as (
        select
            cidade.addressid as idEndereco,
            -- cidade.stateprovinceid, 
            cidade.city as cidade,
            -- estado.stateprovinceid,
            estado.name as estado,
            -- estado.countryregioncode,
            -- pais.countryregioncode,
            pais.name as pais
        from {{ ref('stg_cidade') }} cidade
        LEFT JOIN estado ON estado.stateprovinceid = cidade.stateprovinceid
        LEFT JOIN pais ON pais.countryregioncode = estado.countryregioncode
    )
select * from endereco