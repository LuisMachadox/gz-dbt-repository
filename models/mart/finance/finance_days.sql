select
    date_date,
    count(orders_id) as nb_trans,
    round(sum(revenue_ord), 2) as total_revenue,
    round(sum(revenue_ord) / count(orders_id), 2) as average_basket,
    round(sum(margin_ord), 2) as total_margin_ord,
    round(sum(operational_margin), 2) as total_operational_margin
from {{ ref("int_orders_margin") }}
group by date_date
