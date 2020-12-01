with
    source as (
        select
            /* PK */
            customer_id

            /* Metrics */
            , country
            , city
            , contact_name
            , company_name
            , contact_title
            , region

            /* Stich Metadata */
            , _sdc_sequence
            , _sdc_table_version
            , _sdc_batched_at
            , _sdc_received_at
            , _sdc_extracted_at


        from {{ source('northwind_sql', 'customers')}}
    )
select * from source