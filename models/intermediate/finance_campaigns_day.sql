select fin_days.*,
cmpg_days.ads_costs,
cmpg_days.ads_impression,
cmpg_days.ads_clicks,
round ((fin_days.total_operational_margin-cmpg_days.ads_costs),1) as ads_margin
from {{ ref("finance_days") }} as fin_days
full join {{ ref("int_campaigns_day") }} as cmpg_days 
using (date_date)
order by date_date