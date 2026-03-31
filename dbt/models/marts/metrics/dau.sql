select
    date_trunc('day', event_timestamp) as event_date,
    count(distinct user_id) as dau
from {{ ref('fct_events') }}
group by 1
order by 1