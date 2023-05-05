{{ config(description = 'This is a table with the raw data with just the column name changes.') }}

with exam as (
    SELECT
    *
  FROM {{ ref('stg_exam') }}
)

select * from exam