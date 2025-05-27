% === GOALS ===
goal(weight_loss).
goal(weight_gain).
goal(maintenance).

% === BODY TYPES ===
body_type(ectomorph).  % naturally thin
body_type(mesomorph).  % muscular/athletic
body_type(endomorph).  % higher fat storage

% === ACTIVITY LEVELS ===
activity_level(low).
activity_level(moderate).
activity_level(high).

% === DIET PLAN RECOMMENDATION RULES ===

diet_plan(weight_loss, endomorph, low, 'Low-carb diet with high protein and moderate fat.').
diet_plan(weight_loss, mesomorph, moderate, 'Balanced diet with calorie deficit and cardio.').
diet_plan(weight_loss, ectomorph, high, 'Ensure slight calorie deficit, keep protein high.').

diet_plan(weight_gain, ectomorph, high, 'High-calorie, high-carb, and protein-rich diet.').
diet_plan(weight_gain, mesomorph, moderate, 'Moderate calorie surplus with strength training.').
diet_plan(weight_gain, endomorph, low, 'Controlled calorie surplus with lean protein.').

diet_plan(maintenance, _, moderate, 'Balanced macronutrients with portion control.').
diet_plan(maintenance, mesomorph, high, 'Slightly increased protein for recovery.').
diet_plan(maintenance, ectomorph, low, 'Add healthy fats and whole grains to maintain weight.').

% === MAIN QUERY ===

recommend_diet(Goal, BodyType, ActivityLevel, Plan) :-
    diet_plan(Goal, BodyType, ActivityLevel, Plan), !.

% Fallback for missing match
recommend_diet(_, _, _, 'No exact match found. Please consult a nutritionist.').
