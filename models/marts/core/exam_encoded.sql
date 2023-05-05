{{ config(description = 'This is a table that makes use of the binarizer.sql and OHE.sql macros to 
                        encode the data in each of categorical columns so that ML algorithms 
                        can deal with them without transforming them themselves.') }}

WITH data AS (
  SELECT
    *
  FROM {{ ref('stg_exam') }}
)

SELECT
  {{ binarizer('gender', 'male') }},
  {{ one_hot_encode('race', ['group_A', 'group_B', 'group_C', 'group_D', 'group_E']) }},
  {{ one_hot_encode('parent_education', ['some_college', "associates_degree", 'high_school', 'some_high_school', "bachelors_degree", "masters_degree"]) }},
  {{ binarizer('lunch', 'free_reduced') }},
  {{ binarizer('test_prep', 'completed') }},
  math_score,
  reading_score,
  writing_score
FROM data