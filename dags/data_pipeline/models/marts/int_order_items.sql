select
    orders.order_key,
    orders.customer_key,
    orders.order_date,
    line_items.order_item_key,
    line_items.part_key,
    line_items.line_number,
    line_items.extended_price,
    {{discount_amount('line_items.extended_price','line_items.discount')}} as item_discount_amount,
from 
    {{ref('stg_tpch_orders')}} as orders
join 
    {{ref('stg_tpch_line_items')}} as line_items
on
    orders.order_key = line_items.order_key
order by
    orders.order_date
