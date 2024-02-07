SELECT date_date,
sum (ads_cost) as ads_costs,
sum (impression) as ads_impression,
sum (click) as ads_clicks
FROM {{ ref('int_campaigns') }}
GROUP BY date_date
ORDER BY date_date