with user_activity as (

    select
        user_id,
        date_trunc('day', event_timestamp) as activity_date
    from {{ ref('fct_events') }}

),

cohorts as (

    select
        user_id,
        min(date_trunc('day', event_timestamp)) as first_activity_date
    from {{ ref('fct_events') }}
    group by 1

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

),

aggregated as (

    select
        first_activity_date,
        days_since_signup,
        count(distinct user_id) as active_users
    from joined
    group by 1,2

),

cohort_size as (

    select
        first_activity_date,
        count(distinct user_id) as cohort_size
    from cohorts
    group by 1

)

select
    a.first_activity_date,
    a.days_since_signup,
    a.active_users,
    c.cohort_size,
    a.active_users * 1.0 / c.cohort_size as retention_rate
from aggregated a
join cohort_size c
    on a.first_activity_date = c.first_activity_date
order by 1,2