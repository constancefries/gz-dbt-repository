SELECT
  stg_raw__sales.orders_id,
  stg_raw__sales.date_date,
  stg_raw__sales.revenue,
  stg_raw__sales.quantity,
  (stg_raw__sales.quantity * stg_raw__product.purchase_price) as purchase_cost,
  ROUND(stg_raw__sales.revenue - (stg_raw__sales.quantity * stg_raw__product.purchase_price),2) as margin,
FROM {{ ref('stg_raw__sales')}} 
JOIN {{ ref('stg_raw__product')}}
USING (products_id)
