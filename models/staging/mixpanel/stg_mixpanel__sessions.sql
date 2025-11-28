with 

source as (

    select * from {{ source('mixpanel', 'sessions') }}

),

renamed as (

    select
        session_id,
        user_id,
        TO_TIMESTAMP(start_timestamp, 'DD/MM/YYYY HH24:MI') as start_timestamp,
        TO_TIMESTAMP(end_timestamp, 'DD/MM/YYYY HH24:MI') as end_timestamp,
        session_duration_seconds :: integer as session_duration_seconds,
        event_count :: integer as event_count,
        platform

    from source

)

select * from renamed