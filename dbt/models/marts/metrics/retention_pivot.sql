select
    first_activity_date,

    max(case when days_since_signup = 0 then retention_rate end) as day_0,
    max(case when days_since_signup = 1 then retention_rate end) as day_1,
    max(case when days_since_signup = 2 then retention_rate end) as day_2,
    max(case when days_since_signup = 3 then retention_rate end) as day_3,
    max(case when days_since_signup = 4 then retention_rate end) as day_4,
    max(case when days_since_signup = 5 then retention_rate end) as day_5,
    max(case when days_since_signup = 6 then retention_rate end) as day_6,
    max(case when days_since_signup = 7 then retention_rate end) as day_7

from {{ ref('retention') }}
group by 1
order by 1