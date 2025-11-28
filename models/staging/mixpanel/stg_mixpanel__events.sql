with 

source as (

    select * from {{ source('mixpanel', 'events') }}

),

renamed as (

    select
        event_id,
        user_id,
        event_name,
        TO_TIMESTAMP(occured_at, 'DD/MM/YYYY HH24:MI') as occured_at,
        properties

    from source

)

select * from renamed