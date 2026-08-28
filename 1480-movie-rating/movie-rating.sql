# Aman
WITH user_ratings AS (
    SELECT
        u.name,
        COUNT(*) AS rating_count
    FROM Users u
    JOIN MovieRating r
        ON u.user_id = r.user_id
    GROUP BY u.user_id, u.name
),

top_user AS (
    SELECT name
    FROM user_ratings
    ORDER BY rating_count DESC, name ASC
    LIMIT 1
),

movie_ratings AS (
    SELECT
        m.title,
        AVG(r.rating) AS avg_rating
    FROM Movies m
    JOIN MovieRating r
        ON m.movie_id = r.movie_id
    WHERE r.created_at >= '2020-02-01'
      AND r.created_at < '2020-03-01'
    GROUP BY m.movie_id, m.title
),

top_movie AS (
    SELECT title
    FROM movie_ratings
    ORDER BY avg_rating DESC, title ASC
    LIMIT 1
)

SELECT name AS results
FROM top_user

UNION ALL

SELECT title AS results
FROM top_movie;