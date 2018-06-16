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
  current BOOLEAN,
  timelog TIMESTAMP
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
  trip_id INT4 REFERENCES trips(id),
  amount INT,
  timelog TIMESTAMP,
  business BOOLEAN,
  company VARCHAR(255)
);

CREATE TABLE items(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  amount INT,
  transaction_id INT4 REFERENCES transactions(id)
);

CREATE TABLE people_trans(
  id SERIAL4 PRIMARY KEY,
  transaction_id INT4 REFERENCES transactions(id),
  person_id INT4 REFERENCES people(id),
  owe INT,
  timelog TIMESTAMP
);

CREATE TABLE trans_tags(
  id SERIAL4 PRIMARY KEY,
  transaction_id INT4 REFERENCES transactions(id),
  tag_id INT4 REFERENCES tags(id)
);
