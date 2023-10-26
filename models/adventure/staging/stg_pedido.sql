with
    source_data as (
        select
            salesorderid, 
            orderdate, 
            status, 
            shiptoaddressid,
            creditcardid, 
            customerid
        from {{ source('erp_adventure', 'salesorderheader') }}
    )

select * from source_data