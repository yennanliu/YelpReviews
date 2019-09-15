--#########################
-- review  
--#########################

--  1) sql_top_restaurants 

SELECT b.name,
       b.city,
       b.categories, 
       b.review_count,
       b.stars as stars, 
       r.review_start_sum as review_start_sum,
       --b.business_id AS business_id_b,
       r.business_id
FROM business b
INNER JOIN
  (SELECT business_id AS business_id,
          sum(stars) as review_start_sum
   FROM review
   GROUP BY 1
   ORDER BY 2 DESC
   LIMIT 100) r ON REPLACE(r.business_id, '"', '') = b.business_id
LIMIT 100;

--#########################
-- business   
--#########################

