select
    *
from 
    {{ref('fct_orders')}}
where
    date(order_date) > CURRENT_DATE 
    or date(order_date) < '1990-01-01'