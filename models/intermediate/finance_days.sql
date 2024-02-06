SELECT
    date_date,
    COUNT(orders_id) AS nb_trans,
    ROUND (SUM(revenue_ord),2) AS total_revenue,
    ROUND (SUM(revenue_ord) / COUNT(orders_id),2) AS average_basket,
    ROUND (SUM(margin_ord),2) AS total_margin_ord,
    ROUND (SUM(operational_margin),2) AS total_operational_margin
FROM {{ ref('int_orders_margin') }}
GROUP BY date_date