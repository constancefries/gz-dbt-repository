SELECT
  stg_raw__sales.quantity * stg_raw__product.purchase_price as purchase_cost,
  stg_raw__sales.revenue - (stg_raw__sales.quantity * stg_raw__product.purchase_price) as margin, 
FROM {{ ref('stg_raw__sales')}} 
JOIN {{ ref('stg_raw__product')}}
USING (products_id)
