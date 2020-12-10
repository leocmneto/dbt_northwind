with
    selected as (
        select
            /* PK */

            /* FK */
            , category_id	
            , product_name

            /* Metrics */
            , units_in_stock		
            , unit_price
            , units_on_order
            , reorder_level
            , quantity_per_unit
            , is_discontinued

        from {{ ref('stg_products') }}
    )

   
    , transformed as (
        select 
        row_number() over (order by product_id) as product_SK
        ,*
        from selected

    )
select * from transformed