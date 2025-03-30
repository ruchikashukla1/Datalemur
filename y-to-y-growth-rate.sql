WITH Staging as (
SELECT EXTRACT(YEAR FROM  transaction_date) as year,
product_id,
spend as curr_year_spend, 
LAG (spend )  
    OVER ( PARTITION BY product_id
           ORDER BY  transaction_date) as prev_year_spend

FROM user_transactions t
ORDER BY product_id, transaction_date)

SELECT s.*, 
ROUND(((curr_year_spend - prev_year_spend)/prev_year_spend)*100::numeric,2) as yoy_rate
FROM staging s      