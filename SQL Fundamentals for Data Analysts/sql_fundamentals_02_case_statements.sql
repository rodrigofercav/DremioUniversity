select trip_distance,
       case when trip_distance < 1 then 'short' when trip_distance between 1 and
       5 then 'medium' else 'long' end as trip_category
from   nyc_taxi;

-------------------
select   w."date",
         w.tempmax,
         case when tempmax < 32 then 'freezing' when tempmax between 32 and
         60 then 'cool' when tempmax between 61 and
         80 then 'warm' else 'hot' end as temp_category
from     nyc_weather w
order by w."date" DESC;

----------------------
--- practice time ----
----------------------
-- 1:
select t.passenger_count,
       case when t.passenger_count <= 2 then 'coupe' when t.passenger_count between 3 and
       5 then 'sedan' else 'large' end as car_category
from   nyc_taxi t;

-- select   car_category,
--          count(*) as qtd_per_category
-- from     (select t.passenger_count,
--                  case when t.passenger_count <= 2 then 'coupe' when t.passenger_count between 3 and
--                  5 then 'sedan' else 'large' end as car_category
--           from   nyc_taxi t
--          ) rs
-- group by car_category;
-- 2:
select prcp,
       case when prcp < 1 then 'little' when prcp between 1 and
       4 then 'some' else 'much' end as prcp_category
from   nyc_weather;

-- select * from nyc_weather order by prcp desc;


-- 3:
select pickup_time,
       case when pickup_time between '00:00:00.000' and
       '11:59:59.999' then 'morning' when pickup_time between '12:00:00.000' and
       '17:59:59.999' then 'afternoon' when pickup_time between '18:00:00.000' and
       '20:59:59.999' then 'evening' else 'night' end as pickup_time_category
from   nyc_taxi
-- where pickup_time_category = 'evening'
;

-- select min(pickup_time),
--        max(pickup_time)
-- from   nyc_taxi;
