with 
    validacao as (
        select sum(units_in_stock) as sum_stck
        from {{ ref('dim_products') }}
    )

select * from validacao where sum_stck != 3119