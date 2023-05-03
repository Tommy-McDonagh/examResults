WITH data AS (
  SELECT
    *
  FROM {{ ref('stg_exam') }}
)

SELECT
  {{ one_hot_encode('gender', ['male', 'female']) }},
  {{ one_hot_encode('race', ['group A', 'group B', 'group C', 'group D', 'group E']) }},
  {{ one_hot_encode('parent_education', ['some college', "associates degree", 'high school', 'some high school', "bachelors degree", "masters degree"]) }},
  {{ one_hot_encode('lunch', ['standard', 'free/reduced']) }},
  {{ one_hot_encode('test_prep', ['none', 'completed']) }},
  math_score,
  reading_score,
  writing_score
FROM data