--#########################
-- review  
--#########################

---------  1) RESTAURANT WITH BEST REVIEW 

SELECT b.name,
       b.city,
       b.review_count,
       b.stars AS stars,
       r.review_star_sum AS review_star_sum,
       b.categories AS categories
FROM business b
INNER JOIN
  (SELECT business_id AS business_id,
          sum(stars) AS review_star_sum
   FROM review
   GROUP BY 1
   ORDER BY 2 DESC
   LIMIT 100) r ON REPLACE(r.business_id, '"', '') = b.business_id
ORDER BY 3,4
LIMIT 100;

---------   2) TOP REVIEW CATEGORIES 

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


---------   4) REVIEW OVER TIME  

SELECT substring(date, 1, 5) AS MONTH,
       count(review_id) AS review_count,
       count(DISTINCT user_id) AS user_did_review,
       count(DISTINCT business_id) AS reivewed_business
FROM review r
GROUP BY 1
ORDER BY 1
LIMIT 100 ;


--#########################
-- user   
--#########################

---------   5) NEW JOINED USER 

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

-- SELECT
--     substring_index(categories,',',1) as categories_,  
--     count(case when city = 'Las Vegas' then 1 else NULL END ) as 'Las Vegas',
--     count(case when city = 'Toronto' then 1 else NULL END ) as 'Toronto',
--     count(case when city = 'Charlotte' then 1 else NULL END ) as 'Charlotte',
--     count(case when city = 'Scottsdale' then 1 else NULL END ) as 'Scottsdale',
--     count(case when city = 'Calgary' then 1 else NULL END ) as 'Calgary',
--     count(case when city = 'Pittsburgh' then 1 else NULL END ) as 'Pittsburgh',
--     count(case when city = 'Montréal' then 1 else NULL END ) as 'Montréal',
--     count(case when city = 'Mesa' then 1 else NULL END ) as 'Mesa',
--     count(case when city = 'Henderson' then 1 else NULL END ) as 'Henderson'
-- FROM business
-- GROUP BY 1 limit 100;


SELECT city,
       substring_index(categories,',',1) AS categories,
       COUNT(*)
FROM business
WHERE city IN
    (SELECT city
     FROM
       (SELECT city,
               count(*) AS COUNT
        FROM business
        GROUP BY 1
        ORDER BY 2 DESC
        LIMIT 10) sub)
  AND categories IN
    (SELECT categories
     FROM
       (SELECT substring_index(categories,',',1) AS categories,
               count(*) AS COUNT
        FROM business
        GROUP BY 1
        ORDER BY 2 DESC
        LIMIT 10) sub)
  AND categories IS NOT NULL
GROUP BY 1,
         2;
         
---------   10)  BUSINESS LOCATIONS 

-- SELECT 
-- name, 
-- latitude,
-- longitude
-- FROM business
-- limit 10000;



SELECT name,
       CASE
           WHEN stars = '5.0'
                OR stars = '4.5' THEN '5'
           WHEN stars = '4.0'
                OR stars = '3.5' THEN '4'
           WHEN stars = '3.0'
                OR stars = '2.5' THEN '3'
           WHEN stars = '2.0'
                OR stars = '1.5' THEN '2'
           WHEN stars = '1.0' THEN '1'
           ELSE 'else'
       END AS group_,
       latitude,
       longitude
FROM business
LIMIT 100000;


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

