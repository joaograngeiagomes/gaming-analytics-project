select
    user_id,
    min(date_trunc('day', event_timestamp)) as first_activity_date
from {{ ref('fct_events') }}
group by 1