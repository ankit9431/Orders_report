#which sub_category has highest growth profit in 2023 compared to 2022
with cte as 
(select sub_category,year(order_date) as year_no,sum(sale_price) as revenue
from df_orders
group by sub_category,year_no
order by sub_category asc
),
cte2 as
(select sub_category,
sum(case when year_no=2022 then revenue else 0 end)as sales_2022,
sum(case when year_no=2023 then revenue else 0 end)as sales_2023
from cte
group by sub_category)
 select *,(sales_2023-sales_2022)*100/sales_2022 as growth
 from cte2
 order by growth desc
 limit 1
 