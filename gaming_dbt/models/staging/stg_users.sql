select
    user_id,
    signup_date,
    country,
    acquisition_channel
from {{ source('raw', 'users') }}