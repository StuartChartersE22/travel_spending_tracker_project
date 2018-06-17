DROP TABLE trans_tags;
DROP TABLE people_trans;
DROP TABLE items;
DROP TABLE transactions;
DROP TABLE tags;
DROP TABLE people;
DROP TABLE trips;

CREATE TABLE trips(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  budget INT,
  current BOOLEAN UNIQUE,
  business BOOLEAN,
  timelog DATE
);

CREATE TABLE people(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE tags(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE transactions(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  trip_id INT4 REFERENCES trips(id) ON DELETE CASCADE,
  amount INT,
  timelog TIMESTAMP,
  business BOOLEAN,
  company VARCHAR(255)
);

CREATE TABLE items(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  amount INT,
  transaction_id INT4 REFERENCES transactions(id) ON DELETE CASCADE
);

CREATE TABLE people_trans(
  id SERIAL4 PRIMARY KEY,
  transaction_id INT4 REFERENCES transactions(id) ON DELETE CASCADE,
  person_id INT4 REFERENCES people(id) ON DELETE CASCADE,
  owe INT,
  timelog TIMESTAMP
);

CREATE TABLE trans_tags(
  id SERIAL4 PRIMARY KEY,
  transaction_id INT4 REFERENCES transactions(id) ON DELETE CASCADE,
  tag_id INT4 REFERENCES tags(id) ON DELETE CASCADE
);
