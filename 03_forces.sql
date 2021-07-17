



-- average and total forces (values don't include gravity)
select test_name,
       avg(total_accel)::numeric(5,1) as avg_3D_accel_g,
       avg(total_force)::numeric(5,1) as avg_3D_force_N,
       max(total_accel)::numeric(5,1) as max_3D_accel_g,
       max(total_force)::numeric(5,1) as max_3D_force_N,
       (sum(case when total_accel > 1.0 then 1 else 0 end)::float / 30.0)::numeric(5,1) as seconds_over_1g,
       (sum(case when total_accel > 2.0 then 1 else 0 end)::float / 30.0)::numeric(5,1) as seconds_over_2g,
       (sum(case when total_accel > 3.0 then 1 else 0 end)::float / 30.0)::numeric(5,1) as seconds_over_3g,
       (sum(case when total_accel > 4.0 then 1 else 0 end)::float / 30.0)::numeric(5,1) as seconds_over_4g,
       (sum(case when total_accel > 5.0 then 1 else 0 end)::float / 30.0)::numeric(5,1) as seconds_over_5g
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

