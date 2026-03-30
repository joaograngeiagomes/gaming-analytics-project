select
    purchase_id,
    user_id,
    amount,
    purchase_timestamp
from {{ ref('stg_purchases') }}