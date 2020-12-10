with

    divisions as (
        select * from {{ ref('seed_country_divisions') }}
    ),

    suppliers as (
        select * from {{ ref('stg_suppliers') }} 
    )


    , transformed as (
        select 
        row_number() over (order by suppliers.supplier_id) as supplier_SK

            /* Metrics */   
        , suppliers.country	    		
        , suppliers.city	    			    			    			    		
        , suppliers.contact_name	    			    		
        , suppliers.company_name	    		
        , suppliers.contact_title		    		
        , suppliers.region
        , divisions.division	

        from suppliers
        left join divisions on suppliers.country = divisions.country

    )
select * from transformed