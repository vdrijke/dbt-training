select 
    orderid, 
    ordersellingprice
from {{ ref('raw_orders') }}
where ordersellingprice < 0