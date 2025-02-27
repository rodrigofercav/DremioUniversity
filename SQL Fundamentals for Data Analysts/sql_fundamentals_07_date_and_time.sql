select CURRENT_DATE(),
       CURRENT_DATE_UTC();

select t.pickup_date,
       DATE_DIFF(t.pickup_date, CURRENT_DATE()) as days_since
from   nyc_taxi t;

select pickup_date,
       DAYOFMONTH(pickup_date) as dayofmonth_function,
       WEEK(pickup_date) as week_function,
       month(pickup_date) as month_function,
       date_part('day', pickup_date) as date_part_day,
       date_part('week', pickup_date) as date_part_week,
       date_part('month', pickup_date) as date_part_month,
       date_part('year', pickup_date) as date_part_year,
       extract(EPOCH from pickup_date) extract_epoch,
       extract(day from pickup_date) extract_day,
       extract(week from pickup_date) extract_week,
       extract(month from pickup_date) extract_month,
       extract(year from pickup_date) extract_year,
       pickup_time,
       extract(hour from pickup_time) extract_hour,
       extract(minute from pickup_time) extract_minute,
       extract(second from pickup_time) extract_second,
       extract(epoch from pickup_time) extract_epoch_time,
       date_part('hour', pickup_time) as date_part_hour,
       date_part('minute', pickup_time) as date_part_minute,
       date_part('second', pickup_time) as date_part_second
from   nyc_taxi;
