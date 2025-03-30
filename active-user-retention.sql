with current_month_active_users as (
SELECT *
FROM user_actions
where EXTRACT(MONTH FROM event_date) = 7
),

past_month_active_users as (
SELECT *
FROM user_actions
where EXTRACT(MONTH FROM event_date) = 6)

select 7 as "month" , count(distinct pm.user_id) as "monthly_active_users" from 
current_month_active_users cm inner join past_month_active_users pm
on cm.user_id=pm.user_id
;