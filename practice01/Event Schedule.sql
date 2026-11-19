USE practice_exercise;

CREATE TABLE events (
    event_id         INT,
    event_code       VARCHAR(15),
    event_name       VARCHAR(150),
    venue            VARCHAR(150),
    city             VARCHAR(80),
    start_date       VARCHAR(10),
    end_date         VARCHAR(10),
    capacity         INT,
    registration_fee INT,
    event_type       VARCHAR(20),
    event_status     VARCHAR(20),
    created_at       VARCHAR(10)
);

DESCRIBE events;

SHOW CREATE TABLE events;

INSERT INTO events (event_id, event_code, event_name, venue, city,
                    start_date, end_date, capacity, registration_fee,
                    event_type, event_status, created_at)
VALUES (1, 'EVT-JAVA-01', 'Java Developer Meetup', 'Tech Hall', 'Bengaluru',
        '2026-10-10', '2026-10-10', 250, 500,
        'OFFLINE', 'OPEN', '2026-09-01');

INSERT INTO events (event_id, event_code, event_name, venue, city,
                    start_date, end_date, capacity, registration_fee,
                    event_type, event_status, created_at)
VALUES
    (2, 'EVT-CLOUD-02', 'Cloud Fundamentals Webinar', 'Online Platform', 'Online',
     '2026-10-12', '2026-10-12', 1000, 0,
     'ONLINE', 'OPEN', '2026-09-01'),
    (3, 'EVT-DATA-03', 'Data Engineering Summit', 'Convention Centre', 'Hyderabad',
     '2026-11-05', '2026-11-06', 600, 2500,
     'HYBRID', 'PLANNED', '2026-09-01');

INSERT INTO events (event_id, event_code, event_name, venue, city,
                    start_date, end_date, capacity, registration_fee,
                    event_type, event_status, created_at)
VALUES (4, 'EVT-UI-04', 'UI Design Workshop', 'Creative Hub', 'Chennai',
        '2026-10-20', '2026-10-20', 80, 1200,
        'OFFLINE', 'PLANNED', '2026-09-01');

INSERT INTO events (event_id, event_code, event_name, venue, city,
                    start_date, end_date, capacity, registration_fee,
                    event_type, event_status, created_at)
VALUES (5, 'EVT-OLD-05', 'Cancelled Training Event', 'Test Venue', 'Pune',
        '2026-10-01', '2026-10-01', 30, 100,
        'OFFLINE', 'CANCELLED', '2026-09-01');

SELECT event_id, event_code, event_name, venue, city, start_date, end_date, capacity, registration_fee, event_type, event_status, created_at
FROM events;

UPDATE events
SET capacity = 750
WHERE event_code = 'EVT-DATA-03';

UPDATE events
SET event_status = 'OPEN'
WHERE event_code = 'EVT-UI-04'
  AND event_status = 'PLANNED';

UPDATE events
SET registration_fee = ROUND(registration_fee * 1.10)
WHERE event_type = 'OFFLINE'
  AND registration_fee > 0;

UPDATE events
SET start_date = DATE_FORMAT(DATE_ADD(start_date, INTERVAL 1 DAY), '%Y-%m-%d'),
    end_date   = DATE_FORMAT(DATE_ADD(end_date,   INTERVAL 1 DAY), '%Y-%m-%d')
WHERE event_code = 'EVT-CLOUD-02';

UPDATE events
SET end_date = start_date
WHERE event_code = 'EVT-JAVA-01';

SELECT event_code, start_date, end_date
FROM events
WHERE event_code = 'EVT-JAVA-01';

SELECT event_id, event_code, event_name, venue, city, start_date, end_date, capacity, registration_fee, event_type, event_status, created_at
FROM events
WHERE event_code = 'EVT-OLD-05';

DELETE FROM events
WHERE event_code = 'EVT-OLD-05';

INSERT INTO events (event_id, event_code, event_name, venue, city,
                    start_date, end_date, capacity, registration_fee,
                    event_type, event_status, created_at)
VALUES (99, 'EVT-TEMP-99', 'Temporary Event', 'Temp Venue', 'Delhi',
        '2026-12-01', '2026-12-01', 10, 0,
        'ONLINE', 'OPEN', '2026-09-01');

DELETE FROM events
WHERE event_code = 'EVT-TEMP-99';

SELECT event_id, event_code, event_name, venue, city, start_date, end_date, capacity, registration_fee, event_type, event_status, created_at
FROM events
WHERE event_type = 'ONLINE'
  AND registration_fee = 0
  AND event_status = 'OPEN';

DELETE FROM events
WHERE event_type = 'ONLINE'
  AND registration_fee = 0
  AND event_status = 'OPEN';

SELECT event_id, event_code, event_name, venue, city, start_date, end_date, capacity, registration_fee, event_type, event_status, created_at
FROM events;