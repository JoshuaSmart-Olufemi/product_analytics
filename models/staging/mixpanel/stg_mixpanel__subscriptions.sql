with 

source as (

    select * from {{ source('mixpanel', 'subscriptions') }}

),

renamed as (

    select
        subscription_id,
        user_id,
        plan_id,
        status as sub_status,
        TO_TIMESTAMP(start_date, 'DD/MM/YYYY HH24:MI') as start_timestamp,
        TO_TIMESTAMP(end_date, 'DD/MM/YYYY HH24:MI') as end_timestamp,
        amount_eur :: numeric as amt_eur,
        auto_renew

    from source

)

select * from renamed