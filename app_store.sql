
SELECT prime_genre, COUNT(*) AS CountofApps
From AppleStore
GROUP BY prime_genre
Order BY CountofApps;

SELECT avg(user_rating) AS AvgRating,
       min(user_rating) AS MinRating,
       max(user_rating) AS MaxRating
FROM AppleStore;

SELECT CASE
       WHEN price > 0 THEN 'Paid'
       ELSE 'Free'
       END AS Free_Or_Paid,
       avg(user_rating) AS avg_rating
FROM AppleStore
GROUP BY Free_Or_Paid

SELECT CASE
       WHEN lang_num < 10 THEN 'Low_languages'
       WHEN lang_num BETWEEN 10 AND 30 THEN 'Medium_languages'
       ELSE 'High_languages'
       END AS Number_of_languages_bucket,
       avg(user_rating) AS avg_rating
FROM AppleStore
GROUP BY Number_of_languages_bucket
ORDER BY avg_rating DESC;

SELECT prime_genre,
       avg(user_rating) AS avg_rating
FROM AppleStore
GROUP BY prime_genre
ORDER BY avg_rating ASC
LIMIT 10;


SELECT CASE 
       WHEN length(b.app_desc) < 500 THEN 'Short'
       WHEN length(b.app_desc) BETWEEN 500 and 1000 THEN 'Medium'
       ELSE 'Long'
       END AS description_length_bucket,
       avg(a.user_rating) AS average_rating
FROM AppleStore AS a 
JOIN appleStore_description AS b 
ON a.id = b.id
GROUP BY description_length_bucket
ORDER BY average_rating DESC;


SELECT 
     a.prime_genre,
     a.track_name,
     a.user_rating
FROM (     	
  		SELECT 
            prime_genre,
            track_name,
            user_rating,
            RANK() OVER(Partition BY prime_genre ORDER BY user_rating DESC, rating_count_tot DESC) AS rank
         FROM AppleStore) AS a 
WHERE a.rank <= 2;

       
SELECT CASE 
       WHEN size_bytes < 80000000 THEN 'small_size'
       WHEN size_bytes BETWEEN 80000000 AND 150000000 THEN 'medium_size'
       ELSE 'large_size'
       END AS app_size_bucket,
       avg(user_rating) AS avg_rating
FROM AppleStore
GROUP BY app_size_bucket
ORDER BY avg_rating DESC;


SELECT CASE 
		WHEN price BETWEEN 0.01 AND 2 THEN 'Low_price'
        WHEN price BETWEEN 2.01 AND 4 THEN 'Medium_price'
        WHEN price > 4 THEN 'High Price'
        ELSE 'FREE'
        END AS price_category,
        avg(user_rating) AS avg_rating
FROM AppleStore
GROUP BY price_category
ORDER BY avg_rating DESC;
        
        
