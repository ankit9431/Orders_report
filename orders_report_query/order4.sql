#for each category which month had highest sales
with cte as(
select year(order_date) as year_no,month(order_date) as month_no,category,sum(sale_price)as revenue 
from df_orders
group by year_no,month_no,category
),
cte2 as(
select *,row_number() over(partition by category order by revenue desc) as result
from cte)

select *
from cte2
where result<=1