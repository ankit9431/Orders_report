#region wise top 5 prduct
with cte as(
select region,product_id,sum(sale_price) as revenue
from df_orders
group by region,product_id
),
cte2 as(
select *, row_number() over(partition by region order by revenue desc) as ranker
from cte)
select * from cte2
where ranker<=5


