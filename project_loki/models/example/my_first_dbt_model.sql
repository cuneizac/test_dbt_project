
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}

with source_data as (

    select 1 as id, {{ convert_to_aest('CURRENT_TIMESTAMP()') }} as event_time_aest
    union all
    select null as id, {{ convert_to_aest('CURRENT_TIMESTAMP()') }} as event_time_aest

)

select {{ generate_hash_key(["id", "event_time_aest"]) }} as HASH_SK, {{ generate_hash_key(["event_time_aest","id"]) }} as HASH_SK2,*
from source_data

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
