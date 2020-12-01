with
    source as (
        select 
            /* PK */
            product_id

            /* FK */
            , order_id	

            /* Metrics */
            , discount			
            , unit_price
            , quantity				
            			
            /* Stich Metadata */
            , _sdc_table_version		
            , _sdc_received_at			
            , _sdc_sequence			
            , _sdc_batched_at			
            , _sdc_extracted_at			
        from {{ source('northwind_sql', 'order_details')}}
    )
select * from source