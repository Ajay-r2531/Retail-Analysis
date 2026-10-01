use retail;

select o.order_id, p.product_name, oi.quantity, oi.list_price, oi.discount
from orders o 
inner join order_items oi
on o.order_id=oi.order_id
inner join products p 
on oi.product_id=p.product_id;

select p.product_name, sum(oi.quantity) as totalsales 
from products p 
join order_items oi 
on p.product_id=oi.product_id 
group by p.product_name
order by totalsales desc
limit 5;

select c.customer_id, c.first_name, count(distinct o.order_id) as totalorders, sum(oi.quantity) as totalitems, sum(oi.quantity*oi.list_price) as revenue
from customers c 
join orders o 
on c.customer_id=o.customer_id 
join order_items oi 
on o.order_id = oi.order_id 
group by c.customer_id,c.first_name; 

select customer_id, sum(quantity*list_price) as totalspend,
case
when sum(quantity*list_price)<1000 then 'low'
when sum(quantity*list_price)<5000 then 'medium'
else 'high'
end as segment 
from orders o 
join order_items oi 
on o.order_id=oi.order_id
group by customer_id;

select s.staff_id, s.first_name, sum(oi.quantity*oi.list_price) as revenue 
from staffs s 
join orders o 
on s.staff_id=o.staff_id 
join order_items oi 
on o.order_id=oi.order_id
group by s.staff_id,s.first_name;