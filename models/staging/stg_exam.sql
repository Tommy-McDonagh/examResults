with exam as (

    select
        *
    from {{ source('exam', 'EXAM_DATA') }}

)

select * from exam