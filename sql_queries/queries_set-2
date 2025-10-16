-- INTERMEDIATE LEVEL QUERIES

-- Q1: TOP 10 players by potential in each league:
WITH potential_rank AS (
    SELECT ROW_NUMBER() OVER (
            PARTITION BY c.league_name
            ORDER BY p.potential DESC
        ) AS potential_rnk,
        p.short_name,
        p.potential,
        c.league_name,
        c.club_name,
        p.dob
    FROM players p
        JOIN clubs c ON p.club_team_id = c.club_team_id
    WHERE dob BETWEEN '1999-01-01' AND '2005-01-01'
)
SELECT *
FROM potential_rank
WHERE potential_rnk <= 10
ORDER BY league_name

-- Q2: Average potential vs. average overall per nationality
SELECT ROUND(AVG(overall), 2) AS average_overall,
    ROUND(AVG(potential), 2) AS average_potential,
    ROUND(AVG(potential) - AVG(overall), 2) AS average_growth_potential,
    n.nationality_name
FROM players p
    JOIN nationalities n ON n.nationality_id = p.nationality_id
GROUP BY n.nationality_name
ORDER BY average_growth_potential DESC,
    average_overall DESC,
    average_potential DESC

-- Q3: Top 10 clubs with the highest average player potential, only considering players under 23 years old
SELECT c.club_name,
    ROUND(AVG(potential), 2) AS average_potential,
    COUNT(*) AS player_count
FROM players p
    JOIN clubs c ON c.club_team_id = p.club_team_id
WHERE p.age < 23
GROUP BY c.club_name
HAVING COUNT(*) > 3
ORDER BY average_potential DESC
LIMIT 10

-- Q4: Top young players who outperform their clubs
WITH club_overall_rtng AS(
    SELECT c.club_name,
        ROUND(AVG(overall), 2) AS club_overall_average
    FROM players p
        JOIN clubs c ON p.club_team_id = c.club_team_id
    GROUP BY c.club_name
)
SELECT p.short_name,
    p.age,
    CASE
        WHEN p.age <= 18 THEN 'Teen Star'
        WHEN p.age <= 20 THEN 'Rising Talent'
        ELSE 'Young Professional'
    END AS age_category,
    p.overall,
    p.potential - p.overall AS growth_potential,
    n.nationality_name,
    c.club_name,
    r.club_overall_average
FROM players p
    JOIN clubs c ON p.club_team_id = c.club_team_id
    JOIN club_overall_rtng r ON c.club_name = r.club_name
    JOIN nationalities n ON p.nationality_id = n.nationality_id
WHERE p.age < 23
    AND p.overall > r.club_overall_average
ORDER BY growth_potential DESC
LIMIT 100

-- Q5: Top 5 players by growth potential/league
WITH growth_potential_rank AS (
    SELECT p.short_name,
        p.age,
        p.overall,
        p.potential,
        c.league_name,
        c.league_id,
        c.club_name,
        n.nationality_name,
        ROW_NUMBER() OVER (
            PARTITION BY c.league_name
            ORDER BY (p.potential - p.overall) DESC
        ) AS potential_rnk
    FROM players p
        JOIN clubs c ON p.club_team_id = c.club_team_id
        JOIN nationalities n ON p.nationality_id = n.nationality_id
)
SELECT *
FROM growth_potential_rank
WHERE age < 23
    AND potential_rnk <= 5

-- Q6: Top 20 clubs by average technical skill (passing, dribbling, ball control, vision, short passing) for players under 23
SELECT c.club_name,
    c.league_name,
    ROUND(AVG(s.passing), 2) AS average_passing,
    ROUND(AVG(s.dribbling), 2) AS average_dribbling,
    ROUND(AVG(s.skill_ball_control), 2) AS average_ball_control,
    ROUND(AVG(s.mentality_vision), 2) AS average_vision,
    ROUND(AVG(s.attacking_short_passing), 2) AS short_passing,
    ROUND(
        (
            AVG(s.passing) + AVG(s.dribbling) + AVG(s.skill_ball_control) + AVG(s.mentality_vision) + AVG(s.attacking_short_passing)
        ) / 5,
        2
    ) AS average_overall_skills
FROM clubs c
    JOIN players p ON c.club_team_id = p.club_team_id
    JOIN skills s ON p.player_id = s.player_id
WHERE p.age < 23
GROUP BY c.club_name,
    c.league_name
ORDER BY average_overall_skills DESC
LIMIT 20


    
