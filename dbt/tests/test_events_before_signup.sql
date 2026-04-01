select e.*
from {{ ref('fct_events') }} e
join {{ ref('dim_users') }} u
    on e.user_id = u.user_id
where e.event_timestamp < u.signup_date