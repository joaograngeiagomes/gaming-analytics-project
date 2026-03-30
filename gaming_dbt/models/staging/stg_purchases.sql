select
    purchase_id,
    user_id,
    amount,
    purchase_timestamp
from {{ source('raw', 'purchases') }}