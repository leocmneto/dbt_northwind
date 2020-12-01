with
    source as (
        select 
            /* PK */
            product_id	

            /* FK */
            , category_id	
            , supplier_id
            , product_name

            /* Metrics */
            , units_in_stock		
            , unit_price
            , units_on_order
            , reorder_level
            , quantity_per_unit
            , 
             case
                when discontinued = 1 then True
                else False
             end as is_discontinued


            /* Stich columns */
            , _sdc_table_version		
            , _sdc_received_at	
            , _sdc_sequence		
            , _sdc_batched_at	
            , _sdc_extracted_at	as last_elt_run
        from {{ source('northwind_sql', 'products')}}
    )
select * from source