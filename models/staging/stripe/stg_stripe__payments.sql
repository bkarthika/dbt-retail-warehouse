select id as payment_id,
order_id,
paymentmethod,
status,
amount
from raw.stripe.payments