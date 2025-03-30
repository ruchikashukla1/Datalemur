with department_averages as (
SELECT department_id, 
avg(amount) as department_avg, 
max(to_char(payment_date::timestamp, 'MM-YYYY')) as payment_date
FROM employee e inner join salary s on e.employee_id = s.employee_id
group by 1 ), 

company_average as (

select avg(amount) as company_avg
from salary 

)

select department_id, payment_date, 
case when department_avg > company_avg then 'higher'
     when department_avg < company_avg then 'lower' end as comparison
from department_averages, company_average