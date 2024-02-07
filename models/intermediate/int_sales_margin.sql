with sales_prod as ( SELECT *
FROM {{ ref('stg_raw__sales') }} as sales
JOIN {{ ref('stg_raw__product') }} as prod
USING (products_id))

, salesprod AS (select *,
quantity* cast (purchase_price as float64) as purchase_cost,
round (revenue-(quantity* cast (purchase_price as float64)),2) as margin
from sales_prod)

SELECT *
,{{margin_percent(revenue,purchase_cost)}} as margin_percent
from salesprod