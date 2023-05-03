WITH data AS (
  SELECT
    *
  FROM {{ ref('stg_exam') }}
)

SELECT
  {{ one_hot_encode('gender', ['male', 'female']) }},
  {{ one_hot_encode('race', ['group_A', 'group_B', 'group_C', 'group_D', 'group_E']) }},
  {{ one_hot_encode('parent_education', ['some_college', "associates_degree", 'high_school', 'some_high_school', "bachelors_degree", "masters_degree"]) }},
  {{ one_hot_encode('lunch', ['standard', 'free_reduced']) }},
  {{ one_hot_encode('test_prep', ['none', 'completed']) }},
  math_score,
  reading_score,
  writing_score
FROM data