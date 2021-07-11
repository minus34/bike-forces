


-- average and total forces
select test_name,
       avg(total_force) as avg_force,
       sum(total_force) as sum_force
from testing.bike_forces
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

