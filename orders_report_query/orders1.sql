#top 10 product by revenue
select product_id,sum(sale_price) as revenue
from df_orders
group by product_id
order by revenue desc
limit 10
