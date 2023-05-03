# Staging:
 - Loaded in data from src_exam_results.yml using {{ source() }} jinja 
 - Formatted the 'race', 'parent education' and 'lunch' column entries to remove spaces, apostrophes and forward slashes.
 This was in order to make the data more digestible for later transformations.
 - Selected the newly formatted columns to be carried through.