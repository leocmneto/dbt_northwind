with
    selected as (
        select
          /* PK */
            customers.customer_id

            /* Metrics */
            , customers.country
            , customers.city
            , customers.contact_name
            , customers.company_name
            , customers.contact_title
            , customers.region

           


        from {{ ref('stg_customers') }} as customers
    )

    , transformed as (
        select 
        row_number() over (order by customer_id) as customer_SK
        ,*
        from selected

    )
select * from transformed