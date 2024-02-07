SELECT
  DATE_TRUNC(date_date,month) AS date_month,
  SUM (ads_margin) AS ad_margin,
  COUNT(nb_trans) AS nb_trans,
  SUM(total_revenue) AS revenue,
  AVG(average_basket) AS avg_basket,
  SUM(total_margin_ord) AS margin_ord,
  SUM(total_operational_margin) AS op_margin,
  SUM(ads_costs) AS t_ads_cost,
  SUM(ads_impression) AS t_ads_impression
FROM {{ ref("finance_campaigns_day") }}
GROUP BY 1