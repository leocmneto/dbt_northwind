with 
    validacao as (
        select count(is_discontinued) as sum_disc
        from {{ ref('dim_products') }}
        where is_discontinued = True
    )

select * from validacao where sum_disc != 10
