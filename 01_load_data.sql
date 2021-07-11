
-- create table
DROP TABLE IF EXISTS testing.bike_forces;
CREATE TABLE IF NOT EXISTS testing.bike_forces
(
    test_name text,
    index smallint,
    raw_x double precision,
    raw_y double precision,
    raw_z double precision,
    seconds double precision,
    lat_accel double precision,
    long_accel double precision,
    vert_accel double precision,
    total_accel double precision,
    total_force double precision
);


-- import recorded accelerometer data -- units are G's (9.81 m/s2)

-- load the bike values
COPY testing.bike_forces (index, raw_x, raw_y, raw_z)
FROM '/Users/hugh.saalmans/git/minus34/bike-forces/data/acceleration - bike.txt' CSV HEADER DELIMITER ';';
-- add the test name
UPDATE testing.bike_forces SET test_name = 'bike' WHERE test_name IS NULL;

-- load the forearm values
COPY testing.bike_forces (index, raw_x, raw_y, raw_z)
FROM '/Users/hugh.saalmans/git/minus34/bike-forces/data/acceleration - forearm.txt' CSV HEADER DELIMITER ';';
-- add the test name
UPDATE testing.bike_forces SET test_name = 'forearm' WHERE test_name IS NULL;

-- load the head values
COPY testing.bike_forces (index, raw_x, raw_y, raw_z)
FROM '/Users/hugh.saalmans/git/minus34/bike-forces/data/acceleration - head.txt' CSV HEADER DELIMITER ';';
-- add the test name
UPDATE testing.bike_forces SET test_name = 'head' WHERE test_name IS NULL;

-- load the bottom values
COPY testing.bike_forces (index, raw_x, raw_y, raw_z)
FROM '/Users/hugh.saalmans/git/minus34/bike-forces/data/acceleration - bottom.txt' CSV HEADER DELIMITER ';';
-- add the test name
UPDATE testing.bike_forces SET test_name = 'bottom' WHERE test_name IS NULL;

ANALYZE testing.bike_forces;
