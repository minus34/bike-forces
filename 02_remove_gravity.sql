

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


SELECT * FROM testing.bike_forces;


-- get raw accel values in the first second to remove gravity
select test_name,
       avg(raw_x) as avg_x,
       avg(raw_y) as avg_y,
       avg(raw_z) as avg_z
from testing.bike_forces
where index < 30
group by test_name
;


