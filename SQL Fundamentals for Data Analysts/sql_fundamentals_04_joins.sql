---------------------
--- practice time ---
---------------------
-- challenge 1:
select     t.pickup_date,
           t.pickup_time,
           t.total_amount,
           w.tempmax,
           w.tempmin
from       nyc_taxi t
inner join nyc_weather w
on         w."date" = t.pickup_date
where      w.tempmax > 60;

-- challenge 2:
select    t.pickup_date,
          t.pickup_time,
          t.total_amount,
          w.tempmax,
          w.tempmin
from      nyc_taxi t
left join nyc_weather w
on        w."date" = t.pickup_date;

-----------------------
--- data validation ---
-----------------------
select count(*)
from   nyc_taxi;

select min(pickup_date),
       max(pickup_date),
       count(*)
from   nyc_taxi;

select   pickup_date,
         count(*)
from     nyc_taxi
group by pickup_date;

select w."date",
       w.tempmax
from   nyc_weather w
where  1 = 1
       -- and w.tempmax < 60
       and
       w."date" in (
         '2014-08-06',
         '2014-08-07',
         '2014-08-18',
         '2014-08-19');

select min(w."date"),
       max(w."date")
from   nyc_weather w
where  w.tempmax < 60;

select   w."date",
         count(*) qtd_per_date
from     nyc_weather w
group by w."date"
having   count(*) > 1;
