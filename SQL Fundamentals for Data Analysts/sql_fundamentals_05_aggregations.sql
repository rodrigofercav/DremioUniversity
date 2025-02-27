-- Aggregations: select aggregation(numeric_column_name) from table_name
-- --- Calculation
-- --- Return single value
-- --- Summarizes your data
-- --- most used: count, sum, average, min, max.....
--
select count(*)
from   nyc_taxi;

select sum(total_amount) as total_renevue
from   nyc_taxi;

select round(avg(trip_distance), 2) as average_trip_distance
from   nyc_taxi;

---------------------
--- practice time ---
---------------------
-- challenge 1: max fare amount
select max(fare_amount) as max_fare_amount
from   nyc_taxi;

-- challenge 2: count days with prcp > 0
select count(*) as "days with prcp > 0"
from   nyc_weather
where  prcp > 0;

-- challenge 3: max temp
select max(tempmin) as max_temp_min,
       max(tempmax) as max_temp_max
from   nyc_weather;
