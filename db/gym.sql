DROP TABLE members;
DROP TABLE gymclasses;
DROP TABLE timetable;
DROP TABLE bookings;

CREATE TABLE members
(
  id SERIAL8 primary key,
  name VARCHAR(255),
  membership VARCHAR(255)
);

CREATE TABLE gymclasses
(
  id SERIAL8 primary key,
  type VARCHAR(255)
);

CREATE TABLE timetable
(
  id SERIAL8 primary key,
  gymclass_id INT8 references gymclasses(id) ON DELETE CASCADE,
  time TIME,
  day VARCHAR(255),
  capacity INT8
);

CREATE TABLE bookings
(
  id SERIAL8 primary key,
  member_id INT8 references members(id) ON DELETE CASCADE,
  timetable_id INT8 references timetable(id) ON DELETE CASCADE
);
