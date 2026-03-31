select
    date_trunc('day', purchase_timestamp) as purchase_date,
    sum(amount) as revenue
from {{ ref('fct_purchases') }}
group by 1
order by 1