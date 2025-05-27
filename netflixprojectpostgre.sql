drop table if exists netflix;
create table Netflix(
		show_id varchar(6),
		type varchar(10),
		title varchar(150),
		director varchar(208),
		casts varchar(1000),
		country	varchar(150),
		date_added	varchar(50),
		release_year int,
		rating	varchar(10),
		duration varchar(10),
		listed_in varchar(100),
		description varchar(250)

);

select * from Netflix;

select count(*) as total_count
from netflix;

select distinct type from netflix;

--Count the no.of movies vs TV shows
select 
	type,
	count(*) as total_content
from netflix
group by type

--Find the most common rating for movie and TV shows
select type, ranking from
(select type,
	rating,
	count(*),
	rank()over(partition by type order by count(*) desc) as ranking
	from netflix
	group by 1,2
) as t1
where ranking=1
--list all movies released in a specific year 2020
select * from netflix
where release_year=2020
		AND
	  type='Movie'

--find top 5 countries with most content on netflix

select 	
	unnest(string_to_array(country,',')) as new_country,
	count(show_id) as total_content
from netflix
group by country
ORDER BY 2 DESC
limit 5

--identityfy the longest movie
select * from netflix
where
	type='Movie'
	and
	duration=(select max(duration) from netflix)

	--find the content added in last 5 years
	select * from netflix
	where date_added>= current_date-interval '5 years'
select current_date-interval '5 years'
	







