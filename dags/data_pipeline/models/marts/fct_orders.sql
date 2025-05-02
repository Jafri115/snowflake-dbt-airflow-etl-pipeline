select
    orders.*,
    int_order_items_summary.gross_item_sales_amount,
    int_order_items_summary.item_discount_amount
from 
    {{ref('stg_tpch_orders')}} as orders
join 
    {{ref('int_order_items_summary')}} as int_order_items_summary
on
    orders.order_key = int_order_items_summary.order_key
order by
    orders.order_date