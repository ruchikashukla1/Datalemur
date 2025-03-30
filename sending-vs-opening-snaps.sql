SELECT b.age_bucket,
ROUND((SUM(CASE WHEN activity_type='send' THEN time_spent ELSE 0 END)*1.00/SUM(CASE WHEN activity_type in ('open','send') THEN time_spent ELSE 0 END)*1.00 )*100,2) AS send_perc,
ROUND((SUM(CASE WHEN activity_type='open' THEN time_spent ELSE 0 END)*1.00/SUM(CASE WHEN activity_type in ('open','send') THEN time_spent ELSE 0 END)*1.00 )*100 ,2) AS open_perc
FROM activities a full outer join age_breakdown b on a.user_id = b.user_id
GROUP BY b.age_bucket
ORDER BY 1