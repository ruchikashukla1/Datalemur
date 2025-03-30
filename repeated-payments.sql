--2 transactions occured between 10 minutes
--amount is same 
with temp as (
SELECT *, EXTRACT( EPOCH FROM transaction_timestamp -LEAD(transaction_timestamp) OVER(ORDER BY merchant_id, credit_card_id))/60 AS diff_transaction_timestamp,
Amount - LEAD(Amount) OVER(ORDER BY merchant_id, credit_card_id) AS diff_Amount
FROM transactions 
)

select count(*) as payment_count
from temp
where diff_transaction_timestamp  >= -10
and diff_amount = 0
