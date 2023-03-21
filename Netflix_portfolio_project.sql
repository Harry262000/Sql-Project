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


# What are the top 10 most popular genres of movies and TV shows on Netflix?
select listed_in, count(*) as num_titles
from netflix_titles
group by  listed_in
order by num_titles desc
limit 10;

#what is the average duration of movies and TV shows on Netflix?
select type, round(avg(duration)) as avg_duration
from netflix_titles
group by type;

# Top 10 shows having  a rating of TV-MA?
select title, description, rating
from netflix_titles
where type = 'TV Show' and rating ='TV-MA'
order by title desc
limit 10;

#Which shows are listed under both the 'Drama' and 'Horror' genres
SELECT type, title, listed_in
FROM netflix_titles
WHERE listed_in IN ('TV Dramas', 'TV Horror')
  or listed_in LIKE '%TV Dramas%'
  or listed_in LIKE '%TV Horror%'
  limit 5;
  
# Which countries have the most original movies and TV shows produced by Netflix?
SELECT country, COUNT(*) as count
FROM netflix_titles
WHERE (type = 'Movie' AND listed_in LIKE '%Netflix Original%')
   OR (type = 'TV Show' AND listed_in LIKE '%Netflix Original%')
GROUP BY country
ORDER BY count DESC;

