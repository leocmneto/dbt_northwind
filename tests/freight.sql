with 
    validacao as (
        select sum(freight) as frei
        from {{ ref('fct_order_details') }}
        where order_date between '1998-03-01' and '1998-03-31'
    )

select * from validacao 
where frei != 16112.589999999997
