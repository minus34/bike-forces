
-- get raw accel values in the first half second and use as a baseline to approximately remove gravity
with raw as (
select test_name,
       avg(total_accel) as avg_total_accel,
       stddev(total_accel) as std_dev_total_accel,
       avg(raw_x) as avg_x,
       stddev(raw_x) as std_dev_x,
       avg(raw_y) as avg_y,
       stddev(raw_y) as std_dev_y,
       avg(raw_z) as avg_z,
       stddev(raw_z) as std_dev_z
from testing.bike_forces
where index < 15
group by test_name
)
update testing.bike_forces as bike
    set x = raw_x - avg_x,
        y = raw_y - avg_y,
        z = raw_z - avg_z
from raw
where bike.test_name = raw.test_name
;

-- add total acceleration
UPDATE testing.bike_forces
    SET total_accel = sqrt(power(x, 2) + power(y, 2) + power(z, 2))
;
