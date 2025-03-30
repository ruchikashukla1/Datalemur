with combinations as (
    select concat(p1.topping_name,',', p2.topping_name,',', p3.topping_name) as pizza, 
    (p1.ingredient_cost + p2.ingredient_cost + p3.ingredient_cost) as total_cost
    from pizza_toppings p1
    inner join pizza_toppings p2 on p1.topping_name != p2.topping_name
    inner join pizza_toppings p3 on p2.topping_name != p3.topping_name
    
    where (p1.topping_name !=  p2.topping_name 
    and p2.topping_name!= p3.topping_name
    and p3.topping_name!= p1.topping_name)
    
    and 
    
    (lower(p1.topping_name) < lower(p2.topping_name))
    and (lower(p2.topping_name) < lower(p3.topping_name))
    and (lower(p1.topping_name) < lower(p3.topping_name))

)

select * from combinations 
order by total_cost desc, pizza asc