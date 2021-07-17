


-- average and total forces
select test_name,
       avg(total_accel) as avg_total_accel,
       avg(total_force) as avg_total_force,
       max(total_accel) as max_total_accel,
       max(total_force) as max_total_force,
       sum(case when total_accel > 1.0 then 1 else 0 end) as over_1g_count,
       sum(case when total_accel > 2.0 then 1 else 0 end) as over_2g_count,
       sum(case when total_accel > 3.0 then 1 else 0 end) as over_3g_count,
       sum(case when total_accel > 4.0 then 1 else 0 end) as over_4g_count,
       sum(case when total_accel > 5.0 then 1 else 0 end) as over_5g_count
from testing.bike_forces
where test_name <> 'bike'
group by test_name
;









SELECT count(*) as point_count,
       test_name
FROM testing.bike_forces
group by test_name
;



-- points   test_name

-- 10742	bike
-- 9655	    bottom
-- 10071	head
-- 9877	    forearm

