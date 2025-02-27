------------------------
--- Sql fundamentals ---
------------------------
select *
from   nyc_taxi tx
where  tx.trip_distance between 5 and
       10
limit  100;

-------------------------------
WITH     filter_trip_distance as (
           select case when tx.trip_distance between 5 and
                  10 then 1 else 2 end as trip_distance
           from   nyc_taxi tx
           where  tx.trip_distance between 5 and
                  10 or
                  tx.trip_distance between 15 and
                  18)
select   case when trip_distance = 1 then '5 to 10' when trip_distance = 2 then '15 to 18' else 'error' end as trip_distance,
         count(*) as qtd_trips
from     filter_trip_distance
group by trip_distance;

-------------------------------------------
select "date",
       prcp
from   nyc_weather
limit  3;

-----------------------------
select   *
from     nyc_weather
where    prcp > 0.5 and
         "date" >= '2014-03-01'
order by "date" desc;

--------------------
select *
from   nyc_taxi
where  passenger_count > 2;

------------------------------
select *
from   nyc_taxi
where  trip_distance > 5 and
       total_amount < 20;

------------------------------
select *
from   NYC_weather
where  station like 'USW%';

------------------------------
select *
from   NYC_weather
where  TRIM(LOWER(name)) LIKE '%central%';

-------------------------
select DISTINCT name
from            NYC_weather;

------------------------
select   *
from     nyc_taxi
where    trip_distance > 0
order by trip_distance desc;

----------------
select   "date",
         name,
         station,
         tempmax,
         tempmin
from     nyc_weather
order by "date" asc,
         tempmax desc;

------------------------------
--------- CHALLENGES ---------
------------------------------
-- challenge 1
select   tx.*
from     nyc_taxi tx
order by tx.total_amount desc;

-- challenge 2
select   w.*
from     nyc_weather w
order by tempmax;

-- challenge 3
select   tx.*
from     nyc_taxi tx
order by tx.passenger_count desc,
         tx.trip_distance;
