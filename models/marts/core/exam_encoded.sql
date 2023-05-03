{{ config(materialized='table') }}
{% import "macros/OHE.sql" as my_macro %}

WITH data AS (
  SELECT
    gender,
    race,
    parent_education,
    lunch,
    test_prep,
    math_score,
    reading_score,
    writing_score
  FROM {{ ref('stg_exam') }}
)

SELECT
  {{ my_macro.one_hot_encode('gender', ['male', 'female']) }},
  {{ my_macro.one_hot_encode('race', ['group A', 'group B', 'group C', 'group D', 'group E']) }},
  {{ my_macro.one_hot_encode('parent_education', ['some college', "associate's degree", 'high school', 'some high school', "bachelor's degree", "master's degree"]) }},
  {{ my_macro.one_hot_encode('lunch', ['standard', 'free/reduced']) }},
  {{ my_macro.one_hot_encode('test_prep', ['none', 'completed']) }},
  math_score,
  reading_score,
  writing_score
FROM data
