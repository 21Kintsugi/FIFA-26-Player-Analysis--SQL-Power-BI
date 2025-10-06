-- EASY LEVEL QUERIES --

-- TOP 10 countries by Count of Players/Nationality:
SELECT n.nationality_name,
    COUNT(*) AS player_count
FROM nationalities n
    JOIN players p ON p.nationality_id = n.nationality_id
GROUP BY n.nationality_name
ORDER BY COUNT(*) DESC
LIMIT 10

-- TOP 10 clubs by Count of Players/Club:
SELECT c.club_name,
    COUNT(*) AS player_count
FROM players p
    JOIN clubs c ON c.club_team_id = p.club_team_id
GROUP BY c.club_name
ORDER BY COUNT(*) DESC
LIMIT 10

-- Tallest VS Shortest Player VS Heaviest Player VS Lightest Player:
SELECT short_name,
    'Heaviest' AS category,
    weight_kg,
    height_cm
FROM players
WHERE weight_kg = (
        SELECT MAX(weight_kg)
        FROM players
    )
UNION 
SELECT short_name,
    'Lightest' AS category,
    weight_kg,
    height_cm
FROM players
WHERE weight_kg = (
        SELECT MIN(weight_kg)
        FROM players
    )
UNION
SELECT short_name,
    'Tallest' AS category,
    weight_kg,
    height_cm
FROM players
WHERE height_cm = (
        SELECT MAX(height_cm)
        FROM players
    )
UNION
SELECT short_name,
    'Shortest' AS category,
    weight_kg,
    height_cm
FROM Players
WHERE height_cm = (
        SELECT MIN(height_cm)
        FROM players
    )
ORDER BY
    weight_kg DESC
