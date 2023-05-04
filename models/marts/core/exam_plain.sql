with exam as (
    SELECT
    *
  FROM {{ ref('stg_exam') }}
)

select * from exam