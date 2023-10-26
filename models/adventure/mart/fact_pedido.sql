{{ config(materialized='table') }}

with
    cliente as (
        select
            customerid,
            personid
        from {{ref('stg_cliente_venda')}}
    ),
    motivo as (
        select
            salesorderid,
            salesreasonid
        from {{ref('stg_pedido_motivo')}}
    ),
    produto as (
        select
            productid,
            name
        from {{ref('stg_produto')}}
    ),
    pedido as (
        select
            salesorderid, 
            orderdate, 
            status, 
            shiptoaddressid,
            creditcardid, 
            customerid
        from {{ref('stg_pedido')}}
    ),
    pedido_final as (
        select
            pedido_det.salesorderdetailid as idPedidoDetalhe,
            --produto.productid,
            pedido_det.salesorderid as idPedido,
            pedido.orderdate as data,
            pedido.status,
            produto.name as nomeProduto,
            pedido_det.orderqty as quantidadeProduto,
            --pedido_det.productid,
            pedido_det.unitprice as precoUnitario,
            pedido_det.unitpricediscount as precoUnitarioDesconto,
            --pedido.salesorderid,
            --pedido.businessentityid
            --motivo.salesorderid,
            motivo.salesreasonid as idMotivo,
            --cliente.customerid,
            pedido.shiptoaddressid as idEndereco,
            pedido.creditcardid as idCartao,
            cliente.personid as idCliente
        from {{ ref('stg_pedido_det') }} pedido_det
        LEFT JOIN produto ON produto.productid = pedido_det.productid
        LEFT JOIN pedido ON pedido.salesorderid = pedido_det.salesorderid
        LEFT JOIN motivo ON motivo.salesorderid = pedido_det.salesorderid
        LEFT JOIN cliente ON cliente.customerid = pedido.customerid
    )
select * from pedido_final