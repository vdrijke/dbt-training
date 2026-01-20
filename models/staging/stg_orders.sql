select 
-- from raw orders
{{ dbt_utils.generate_surrogate_key(['o.orderid', 'c.customerid', 'p.productid']) }} as sk_orders,
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
o.ordersellingprice - o.ordercostprice as orderprofit,
{{ markup() }} as markup,
-- from raw product
p.productid,
p.productname,
p.category,
p.subcategory,
-- from raw customer
c.customerid,
c.customername,
c.segment,
c.country
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_product') }} as p on o.productid = p.productid
left join {{ ref('raw_customer') }} as c on o.customerid = c.customerid