select *
from {{ ref('fct_events') }}
where event_timestamp > current_timestamp