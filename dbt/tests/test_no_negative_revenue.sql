select *
from {{ ref('fct_purchases') }}
where amount < 0