with 

source as (

    select * from {{ source('mixpanel', 'users') }}

),

renamed as (

    select
        user_id,
        TO_TIMESTAMP(created_at, 'DD/MM/YYYY HH24:MI') as created_at, 
        marketing_source,
        device_os,
        tax_residence,
        subscription_status

    from source

)

select * from renamed