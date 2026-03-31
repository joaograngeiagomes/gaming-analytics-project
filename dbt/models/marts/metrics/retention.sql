with user_activity as (

    select
        user_id,
        date_trunc('day', event_timestamp) as activity_date
    from {{ ref('fct_events') }}

),

cohorts as (

    select *
    from {{ ref('user_cohorts') }}

),

joined as (

    select
        c.user_id,
        c.first_activity_date,
        a.activity_date,
        datediff(day, c.first_activity_date, a.activity_date) as days_since_signup
    from cohorts c
    join user_activity a
        on c.user_id = a.user_id

)

select
    first_activity_date,
    days_since_signup,
    count(distinct user_id) as active_users
from joined
group by 1,2
order by 1,2