{{ config(description = 'This is a view that renames columns in the src data to remove apostrophes, spaces and slashes
                         so that later transformations are more straightforward.') }}

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