with
    source as (
        select 
            /* PK */
            shipper_id
            
            /* Metrics */	
            , company_name			
            

            /* Stich Metadata */			
            , _sdc_extracted_at			
            , _sdc_sequence			
            , _sdc_received_at			
            , _sdc_batched_at			
            , _sdc_table_version			
		
        from {{ source('northwind_sql', 'shippers')}}
    )
select * from source