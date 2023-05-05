with exam as (

    select
        gender,
        replace(race, ' ', '_') as race,
        replace(parent_education, '''', '') as parent_education_,
        replace(parent_education_, ' ', '_') as parent_education,
        replace(lunch, '/', '_') as lunch,
        test_prep,
        math_score,
        reading_score,
        writing_score
    from {{ source('exam', 'EXAM_DATA') }}

)

select
    gender,
    race,
    parent_education,
    lunch,
    test_prep,
    math_score,
    reading_score,
    writing_score
from exam