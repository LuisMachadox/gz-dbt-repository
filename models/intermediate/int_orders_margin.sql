WITH prod_sales AS (
    select orders_id,
    date_date,
    round (sum (revenue),2) as revenue_ord,
    round (sum (quantity),2) as qty_ord, 
    round (sum (purchase_cost),2) as purchcost_ord, 
    round (sum (margin),2) margin_ord
from {{ ref('int_sales_margin') }}
group by orders_id, date_date
),

prodsales_ship AS (
    select *
    FROM prod_sales
    JOIN {{ ref('stg_raw__ship') }} 
    USING (orders_id))

SELECT *,
    margin_ord + shipping_fee - logcost - CAST(ship_cost AS FLOAT64) AS operational_margin
FROM prodsales_ship