with 
    customers as (
        select *
        from {{ ref('dim_customers') }}
    ),

    employees as (
        select *
        from {{ ref('dim_employees') }}
    ),

    products as (
        select *
        from {{ ref('dim_products') }}
    ),

    shippers as (
        select *
        from {{ ref('dim_shippers') }}
    ),

    suppliers as (
        select *
        from {{ ref('dim_suppliers') }}
    ),

    orders_with_sk as (
        select 
                /* PK */ 
            orders.order_id	
            	/* FK */
            , employees.employee_SK as employee_fk		
            , customers.customer_SK as customer_fk
            , shippers.shipper_SK as shipper_fk		

                /* Metrics */
            , orders.ship_name					
            , orders.order_date			
            , orders.ship_region			
            , orders.shipped_date			
            , orders.ship_country							
            , orders.ship_city			
            , orders.freight						
            , orders.required_date	

        from {{ ref('stg_orders') }} as orders
        left join employees on orders. employee_id = employees.employee_id
        left join customers on orders.customer_id = customers.customer_id
        left join shippers on orders.shipper_id = shippers.shipper_id
        


    ),

    order_details_with_sk as (
        select
            order_detail.order_id	
            
            , products.product_SK as product_fk

            /* FK */
            

            /* Metrics */
            , order_detail.discount			
            , order_detail.unit_price
            , order_detail.quantity

            from {{ ref('stg_order_details') }} as order_detail
            left join products on order_detail.product_id = products.product_id



    ),

    final as (
        select
            order_details_with_sk.order_id
            , order_details_with_sk.product_fk
            , orders_with_sk.employee_fk		
            , orders_with_sk.customer_fk
            , orders_with_sk.shipper_fk	

            /* FK */
            	

            /* Metrics */
            , order_details_with_sk.discount			
            , order_details_with_sk.unit_price
            , order_details_with_sk.quantity



            , orders_with_sk.ship_name					
            , orders_with_sk.order_date			
            , orders_with_sk.ship_region			
            , orders_with_sk.shipped_date			
            , orders_with_sk.ship_country							
            , orders_with_sk.ship_city			
            , orders_with_sk.freight						
            , orders_with_sk.required_date

            



        from orders_with_sk
        left join  order_details_with_sk on orders_with_sk.order_id = order_details_with_sk.order_id

    )


select * from final



    