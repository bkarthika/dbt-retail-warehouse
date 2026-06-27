with customers as (
select * from {{ref("stg_jaffle_shop__customers")}}
),
orders as (
select * from {{ref("stg_jaffle_shop__orders")}}
),
cusotmer_orders as (
    select cusotmer_id,
    min(order_date) as first_order_date,
    max(order_date) as most_recent_order_date,
    count(order_id) as number_of_orders
    from orders
    group by 1
),
final as (
select customers.cusotmer_id,
customers.first_name,
customers.last_name,
cusotmer_orders.first_order_date,
cusotmer_orders.most_recent_order_date,
coalesce(cusotmer_orders.number_of_orders,0) as number_of_orders
from customers
left join cusotmer_orders using (cusotmer_id)
)
select * from final