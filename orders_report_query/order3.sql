#find month over month growth comparison for 2022 and 2023
with cte as(
select distinct year(order_date) as year_no,month(order_date) as month_no,sum(sale_price) as revenue
from df_orders
group by year(order_date),month(order_date)
order by year(order_date) asc,month(order_date) asc
)
select month_no,
sum(case when year_no=2022 then revenue else 0 end) as sale_2022,
sum(case when year_no=2023 then revenue else 0 end) as sale_2022
from cte
group by month_no