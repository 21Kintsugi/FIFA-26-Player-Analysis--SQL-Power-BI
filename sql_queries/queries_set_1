-- EASY LEVEL QUERIES --

-- Q1:TOP 10 countries by Count of Players/Nationality:
SELECT n.nationality_name,
    COUNT(*) AS player_count
FROM nationalities n
    JOIN players p ON p.nationality_id = n.nationality_id
GROUP BY n.nationality_name
ORDER BY COUNT(*) DESC
LIMIT 10

-- Q2:TOP 10 clubs by Count of Players/Club:
SELECT c.club_name,
    COUNT(*) AS player_count
FROM players p
    JOIN clubs c ON c.club_team_id = p.club_team_id
GROUP BY c.club_name
ORDER BY COUNT(*) DESC
LIMIT 10

-- Q3:Tallest VS Shortest Player VS Heaviest Player VS Lightest Player:
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

-- Q4:Overall rating by club/count of players per club:
SELECT ROUND(AVG(overall), 1) AS club_rating,
    c.club_name AS club_name,
    COUNT(*) AS player_count
FROM players p
    JOIN clubs c ON p.club_team_id = c.club_team_id
GROUP BY c.club_name, c.club_team_id
ORDER BY club_rating DESC

-- Q5:Rating of the top 5 leagues:
SELECT ROUND(AVG(overall), 1) AS league_rating,
    c.league_name,
    c.league_id,
    COUNT(*) AS player_count
FROM players p
    JOIN clubs c ON p.club_team_id = c.club_team_id
WHERE c.league_name = 'Premier League'
    OR c.league_name = 'Bundesliga'
    OR c.league_name = 'Serie A'
    OR c.league_name = 'Ligue 1'
    OR c.league_name = 'La Liga'
GROUP BY c.league_name,
    c.league_id
ORDER BY league_rating DESC
LIMIT 5

-- Q6:Young players with the most growth potential:
SELECT short_name,
    potential - overall AS growth_potential,
    dob,
    c.club_name
FROM players p
    JOIN clubs c ON p.club_team_id = c.club_team_id
WHERE potential - overall > 10
    AND age < 25
ORDER BY growth_potential DESC


