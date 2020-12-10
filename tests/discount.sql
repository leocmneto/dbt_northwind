with 
    validacao as (
        select discount as disc
        from {{ ref('fct_order_details') }}
        where order_date between '1998-03-01' and '1998-03-31'
    )

select * from validacao 
where disc > 1 or disc < 0