with
    source as (
        select 
                /* PK */ 
            order_id	
            	/* FK */
            , employee_id			
            , customer_id
            , ship_via as shipper_id		

                /* Metrics */
            , ship_name					
            , order_date			
            , ship_region			
            , shipped_date			
            , ship_country							
            , ship_city			
            , freight						
            , cast(required_date as timestamp) as required_date			

                /* Stich */
            , _sdc_table_version
            , _sdc_sequence	
            , _sdc_received_at
            , _sdc_batched_at			
            , _sdc_extracted_at			
        from {{ source('northwind_sql', 'orders')}}
    )
select * from source