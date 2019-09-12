-- create db 1 

#USE superset; 

#SHOW TABLES; 

CREATE DATABASE transactions_db;
use transactions_db;

CREATE TABLE favorite_colors (
  name VARCHAR(20),
  color VARCHAR(10)
);

INSERT INTO favorite_colors
  (name, color)
VALUES
  ('Lancelot', 'blue'),
  ('Galahad', 'yellow');

CREATE TABLE transactions (
ts timestamp,
user_id int,
currency varchar(3),
amount numeric
);

INSERT INTO transactions
VALUES 
('2018-04-01 00:00:00', 1, 'EUR', 2.45),
('2018-04-01 01:00:00', 1, 'EUR', 8.45),
('2018-04-01 01:30:00', 1, 'USD', 3.5),
('2018-04-01 20:00:00', 1, 'EUR', 2.45),
('2018-04-01 00:30:00', 2, 'USD', 2.45),
('2018-04-01 01:20:00', 2, 'USD', 0.45),
('2018-04-01 01:40:00', 2, 'USD', 33.5),
('2018-04-01 18:00:00', 2, 'EUR', 12.45),
('2018-04-01 18:01:00', 3, 'GBP', 2),
('2018-04-01 00:01:00', 4, 'USD', 2),
('2018-04-01 00:01:00', 4, 'GBP', 2)
;

