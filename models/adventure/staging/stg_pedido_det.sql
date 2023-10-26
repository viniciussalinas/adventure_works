with
    source_data as (
        select
            salesorderdetailid,
            salesorderid,
            orderqty,
            productid,
            unitprice,
            unitpricediscount
        from {{ source('erp_adventure', 'salesorderdetail') }}
    )

select * from source_data