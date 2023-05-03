with exam as (

    select
        gender,
        replace(race, ' ', '_') as race,
        replace(parent_education, '''', '') as parent_education,
        lunch,
        test_prep,
        math_score,
        reading_score,
        writing_score
    from {{ source('exam', 'EXAM_DATA') }}

)

select * from exam