-- GROUP BY => groups rows with the same value in one or more columns
-- HAVING => Filter groups results, like "where" for groups
-----------------------------------------------------
--
select   t.passenger_count,
         count(*) as trip_count
from     nyc_taxi t
group by t.passenger_count
order by t.passenger_count;

--
select   t.passenger_count,
         count(*) as trip_count
from     nyc_taxi t
group by t.passenger_count
having   trip_count > 1000
order by t.passenger_count;

--
select   MONTH(w."date") as "month",
         round(avg(tempmax), 2) as average_temp_max
from     nyc_weather w
group by MONTH(w."date")
order by "month";

--
select   MONTH(w."date") as "month",
         round(avg(tempmax), 2) as average_temp_max
from     nyc_weather w
group by MONTH(w."date")
having   average_temp_max > 70
order by "month";

--
with     avg_tempmax as (
           select   MONTH(w."date") as "month",
                    round(avg(tempmax), 2) as average_temp_max
           from     nyc_weather w
           group by MONTH(w."date")
                    --  having   average_temp_max > 70
                    --  order by "month"
                    )
         --
select   case when "month" = 1 then 'January' when "month" = 2 then 'February' when "month" = 3 then 'March' when "month" = 4 then 'April' when "month" = 5 then 'May' when "month" = 6 then 'June' when "month" = 7 then 'July' when "month" = 8 then 'August' when "month" = 9 then 'September' when "month" = 10 then 'October' when "month" = 11 then 'November' when "month" = 12 then 'December' else 'Error' end as month_name,
         concat(average_temp_max, '°F') avg_fahrenheit_temp_max,
         concat(round(((average_temp_max - 32) * 0.5555555555555555556), 2), '°C') avg_celcius_temp_max
from     avg_tempmax
order by "month";

---------------------
--- practice time ---
---------------------
-- challenge 1: calc avg trip distance group by passenger count
select   passenger_count,
         round(avg(trip_distance), 3) as avg_trip_distance,
         min(trip_distance) as min_trip_distance, -- more than asked
         max(trip_distance) as max_trip_distance -- more than asked
from     nyc_taxi
where    trip_distance > 0 -- more than asked
group by passenger_count
order by passenger_count desc -- more than asked
         ;

-- challenge 2: which months have avg prcp > 2
select   month(w."date") as "month",
         round(avg(prcp), 2) avg_prcp
from     nyc_weather w
where    1 = 1
group by "month"
having   avg_prcp > 0.13 -- with 2 no results
order by "month";

-- challenge 3: what is the total fare amount for each hour and show only hours with +1000
select   to_char(HOUR(t.pickup_time), '00') as "hour",
         sum(fare_amount) as total_fare_amount
from     nyc_taxi t
group by "hour"
having total_fare_amount > 1000
order by 1;
