with
    selected as (
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


        from {{ ref('stg_employees') }}
    )

    , transformed as (
        select 
        row_number() over (order by employee_id) as employee_SK
        ,*
        from selected

    )
select * from transformed