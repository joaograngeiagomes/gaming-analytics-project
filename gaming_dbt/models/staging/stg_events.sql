select
    event_id,
    user_id,
    event_type,
    event_timestamp
from {{ source('raw', 'events') }}