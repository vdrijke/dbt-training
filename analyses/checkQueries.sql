---- below are 9800 orders
-- select count(orderid) from raw_orders

---- how come the staging has more? 10131
-- select count(orderid) from stg_orders

---- some orderids are listed twice in staging
-- select orderid, count(orderid) as num from stg_orders group by orderid order by num desc
select orderid, count(orderid) as numb from stg_orders group by orderid having numb > 1

---- looking at the orders in staging one orderid is linked to two product names
-- select * from stg_orders where orderid = '1510'

---- in the raw orders the id only occurs once
-- select * from raw_orders where orderid = '1510'

---- in the raw product the productid appears twice
-- select * from raw_product where productid = 'FUR-FU-10004270'

-- select productid, orderprofit, count(orderid) as numberOfOrders from stg_orders group by productid, orderprofit order by numberOfOrders desc

-- select * from {{ ref('delivery_team')}}

---- 1418 is a duplicate
-- select orderid, count(orderid) as numb from raw_orders group by orderid order by numb desc
-- select orderid, count(orderid) as numb from raw_orders group by orderid having numb > 1

-- select * from raw.globalmart.orders where orderid = '1418'

---- text orderid so that does not work...
--select max(orderid) as max from raw.globalmart.orders 

-- select * from raw.globalmart.orders where orderid = '1418' and productid = 'FUR-FU-10001706'

---- returns an error because dbt adds limit to the query
-- delete from raw.globalmart.orders where orderid = '1418' and productid = 'FUR-FU-10001706'