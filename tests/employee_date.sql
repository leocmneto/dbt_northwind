with
    validacao as (
    select employee_id, birth_date, hire_date
    from {{ ref('dim_employees') }}

    )

select * from validacao where birth_date > hire_date