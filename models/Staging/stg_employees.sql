with
    source as (
        select 
            /* PK */
            employee_id	

            /* Metrics */
            , country			
            , city					
            , hire_date				
            , extension					
            , birth_date			
            , region					
            , last_name
            , first_name			
            , title					
            , home_phone			
            , reports_to		
            		
            /* Stich Metadata */
            , _sdc_received_at			
            , _sdc_sequence			
            , _sdc_table_version		
            , _sdc_batched_at			
            , _sdc_extracted_at			
            					
		
        from {{ source('northwind_sql', 'employees')}}
    )
select * from source