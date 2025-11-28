with 

source as (

    select * from {{ source('mixpanel', 'marketing_spend') }}

),

renamed as (

    select
        date :: date as _date,
        utm_source,
        utm_campaign,
        cost_eur :: numeric as cost_eur,
        impressions :: integer as impressions,
        clicks :: integer as clicks

    from source

)

select * from renamed