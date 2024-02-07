SELECT
campaigns.date_date,
(finance.operational_margin - campaigns.ads_cost) as ads_margin,
finance.operational_margin,
campaigns.ads_cost,
finance.average_basket,
FROM{{ ref ('int_campaigns_day')}} as campaigns 
JOIN {{ref('finance_days')}} as finance
USING (date_date)

GROUP BY campaigns.date_date, finance.operational_margin, campaigns.ads_cost, finance.average_basket
