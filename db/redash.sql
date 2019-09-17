--#########################
-- review  
--#########################

---------  1) top_riview_restaurants 

SELECT b.name,
       b.city,
       b.categories, 
       b.review_count,
       b.stars as stars, 
       r.review_star_sum as review_star_sum,
       --b.business_id AS business_id_b,
       r.business_id
FROM business b
INNER JOIN
  (SELECT business_id AS business_id,
          sum(stars) as review_star_sum
   FROM review
   GROUP BY 1
   ORDER BY 2 DESC
   LIMIT 100) r ON REPLACE(r.business_id, '"', '') = b.business_id
LIMIT 100;

---------   2) top_riview_categories 

SELECT b.categories as categories,
       sum(r.stars) AS review_stars_sum
FROM review r
INNER JOIN business b ON REPLACE(r.business_id, '"', '') = b.business_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 100 ;


---------   3) top_got_riview_categories 

SELECT b.name as name,
       count(r.review_id) AS review_count
FROM review r
INNER JOIN business b ON REPLACE(r.business_id, '"', '') = b.business_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 100 ;


---------   4) review over time 

SELECT 
substring(date, 1, 5) as month, 
count(*) as review_count 
FROM review r 
group by 1 
order by 1 
limit 100 ;


--#########################
-- user   
--#########################

---------   5) new joined user 

SELECT 
substring(yelping_since, 1, 5) as joined_month, 
count(*) as user_count 
FROM user u 
group by 1 
order by 1 
limit 100 ;


---------   6) average star counts 

SELECT CAST(average_stars AS DECIMAL(4,0)) as avg_star, 
count(*) as count 
FROM user u 
group by 1 
order by 1 
limit 1000 ;

-- SELECT 
-- case 
-- when  1 <= CAST(average_stars AS DECIMAL(4,2)) < 1.5 then '1 - 1.5'
-- when  1.5 <= CAST(average_stars AS DECIMAL(4,2)) < 2 then '1.5 - 2'
-- when  2 <= CAST(average_stars AS DECIMAL(4,2)) < 2.5 then '2 - 2.5'
-- when  2.5 <= CAST(average_stars AS DECIMAL(4,2)) < 3 then '2.5 - 3'
-- when  3 <= CAST(average_stars AS DECIMAL(4,2)) < 3.5 then '3 - 3.5'
-- when  3.5 <= CAST(average_stars AS DECIMAL(4,2)) < 4 then '3.5 - 4'
-- when  4 <= CAST(average_stars AS DECIMAL(4,2)) < 4.5 then '4 - 4.5'
-- when  4.5 <= CAST(average_stars AS DECIMAL(4,2)) < 5 then '4.5 - 5'
-- else 'others' end, 
-- count(*) as count 
-- FROM user u 
-- group by 1 
-- order by 1 
-- limit 1000 ;


---------   6) TOTAL USER COUNT 

SELECT 
COUNT(user_id) as all_user_count 
sum( case 1 when DATE_ADD( now( ) , INTERVAL -1 MONTH ) else 0 end  ) as last_month_joined_user_count
 FROM user; 




--#########################
-- business    
--#########################

---------   7) BUSINESS COUNT BY TYPE BY TYPE  

select 
substring_index(categories,',',1) as categories_, 
count(*) businss_count,
avg(stars) as avg_star
from 
business
group by 1 order by 2 desc 
 limit 10 ;

---------   8) BUSINESS COUNT  BY CITY 

select 
city as city, 
count(*)
from 
business
group by 1 order by 2 desc 
 limit 10 ;

---------   10) TOP BUSINESS COUNT BY TYPE BY CITY

SELECT
    substring_index(categories,',',1) as categories_,  
    count(case when city = 'Las Vegas' then 1 else NULL END ) as 'Las Vegas',
    count(case when city = 'Toronto' then 1 else NULL END ) as 'Toronto',
    count(case when city = 'Charlotte' then 1 else NULL END ) as 'Charlotte',
    count(case when city = 'Scottsdale' then 1 else NULL END ) as 'Scottsdale',
    count(case when city = 'Calgary' then 1 else NULL END ) as 'Calgary',
    count(case when city = 'Pittsburgh' then 1 else NULL END ) as 'Pittsburgh',
    count(case when city = 'Montréal' then 1 else NULL END ) as 'Montréal',
    count(case when city = 'Mesa' then 1 else NULL END ) as 'Mesa',
    count(case when city = 'Henderson' then 1 else NULL END ) as 'Henderson'
FROM business
GROUP BY 1 limit 100;


---------   10)  BUSINESS LOCATIONS 

SELECT 
name, 
latitude,
longitude
FROM business
limit 10000;


---------   11)  TOTAL BUSINESS COUNT  

SELECT 
COUNT(business_id) as all_buiness_count ,
sum(case when is_open = 1 then 1 else 0 end ) as open_buiness_count
 FROM business; 


--#########################
-- checkin    
--#########################


--#########################
-- tip    
--#########################

