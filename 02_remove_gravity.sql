
-- clean bad readings (at the ends where phone was moved
delete from testing.bike_forces where test_name = 'bike' and index > 10420;
delete from testing.bike_forces where test_name = 'head' and index > 9938;
delete from testing.bike_forces where test_name = 'forearm' and index > 9770;
delete from testing.bike_forces where test_name = 'bottom' and index > 9414;


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
where not (raw_x > 1.0 and raw_y > 1.0 and raw_z > 1.0)
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

-- add force -- test subject has a mass of 60.5 kg
update testing.bike_forces
    set total_force = total_accel * 60.5
;

-- export to CSV
COPY testing.bike_forces
TO '/Users/hugh.saalmans/git/minus34/bike-forces/data/processed acceleration data.txt' CSV HEADER DELIMITER ',';





-- testing
select test_name,
       avg(raw_x) as avg_raw_x,
       avg(raw_y) as avg_raw_y,
       avg(raw_z) as avg_raw_z,
       avg(x) as avg_x,
       avg(y) as avg_y,
       avg(z) as avg_z
from testing.bike_forces
where index > 3000
and index < 4000
group by test_name



