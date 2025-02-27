--- practice time ---
-- 1:
select (fare_amount + total_amount) as fare_plus_total_amount
from   nyc_taxi;

-- 2:
select round((prcp + 5), 2) as new_prcp
from   nyc_weather;

-- 3:
select lower(concat(name, ' ', station)) as lower_name_and_station
from   nyc_weather;

--- example queries:
select round(fare_amount / trip_distance, 2) as cost_per_mile
from   nyc_taxi
where  trip_distance > 0
limit  2;

------------
select "date",
       CONCAT(station, ' - ', name) as combined_name
from   nyc_weather;

-------------
select lower(w.station) as station_lowercase,
       lower(w.name) as name_lowercase
from   nyc_weather w;
