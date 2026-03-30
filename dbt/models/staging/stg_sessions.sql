select
    session_id,
    user_id,
    session_start,
    session_end
from {{ source('raw', 'sessions') }}