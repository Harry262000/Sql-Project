#How many movies are in the dataset?
SELECT COUNT(*) AS movies
FROM netflix_titles
WHERE type = 'Movie';

#How many TV shows are in the dataset?

select count(*) as Tv_shows
from netflix_titles
where type = 'TV show'

# What is the title of the longest movie in the dataset?

select title, director, duration,release_year, country
from netflix_titles
where type = 'movie'
order by duration asc
limit 1 ;

#Who directed the movie with the longest duration?

select director, title, duration, release_year
from netflix_titles
where type = 'movie'
order by duration
limit 5;

# Which show has the highest rating?

SELECT title, rating
FROM netflix_titles
WHERE type = 'Movie'
ORDER BY CASE rating
    WHEN 'TV-MA' THEN 1
    WHEN 'R' THEN 2
    WHEN 'TV-14' THEN 3
    WHEN 'TV-PG' THEN 4
    WHEN 'PG-13' THEN 5
    WHEN 'PG' THEN 6
    WHEN 'TV-G' THEN 7
    WHEN 'G' THEN 8
    ELSE 9
END
LIMIT 1;

#How many shows are added in the dataset in the year 2021?

select count(release_year)
from netflix_titles
where release_year >= 2021



#What is the total duration of all shows in the dataset?

SELECT title, release_year, type,  SUM(duration) AS total_duration
FROM netflix_titles
GROUP BY title, release_year, type
order by total_duration desc
limit 10 ;


#Who are the top 5 actors/actresses with the most appearances in the datasets?
