----------------------------------------
--total ampunt each customer spent--
----------------------------------------
select userid,sum(price)total_amt
from sales  inner join products 
using(product_id)
group by userid;

---------------------------------------------
--number of days spent by each customer--
-----------------------------------------------
select userid,count(distinct created_at)no_of_days
from sales
group by userid;

---------------------------------------------------
--user first order date--
---------------------------------------------------
select userid,min(created_at)fisrt_date
from sales
group by userid
order by userid;                                    

---------------------------------------------------
--products and number times it has been purchased--
----------------------------------------------------
select product_id,count( (product_id) ) cnt
from sales
group by product_id
order by cnt desc ;

---------------------------------------
--most purchased/most popular pruduct and number of times purchased--
-----------------------------------------
select product_id,count( (product_id) ) cnt
from sales
group by product_id
order by cnt desc 
fetch first 1 rows only;

----------------------------------------------------------
--most purchased product with the user who purchased it--
-----------------------------------------------------------
select userid,product_id,count( (product_id) ) cnt
from sales
group by product_id ,userid
order by cnt desc ;

-------------------------------------------------
--first product purchased by each user--
--------------------------------------------------
select userid,product_id 
from sales 
where created_at in (select min(created_at) 
                    from sales
                    group by userid)
order by userid;

---------------------------------------------------
