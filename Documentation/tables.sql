CREATE SEQUENCE courses_id_seq;
CREATE TABLE courses
(
id int PRIMARY KEY DEFAULT nextval('courses_id_seq'),
department text NOT NULL,
number text NOT NULL,
section text NOT NULL,
title text,
credit text,
fdr text,
type text,
faculty text,
consent bit,
capacity int,
location text
);

CREATE SEQUENCE times_id_seq;
CREATE TABLE times
(
time_id int PRIMARY KEY DEFAULT nextval('times_id_seq'),
course_id int REFERENCES courses ON DELETE CASCADE,
day char,
starttime int,
endtime int
);

CREATE SEQUENCE users_id_seq;
CREATE TABLE users
(
user_id int PRIMARY KEY DEFAULT nextval('users_id_seq'),
username text,
password text,
email text
);

COPY courses (course_id, day, starttime, endtime) FROM '/home/courses/cs335/shared/corsola/courseOfferings_courses.csv' DELIMITER '~' CSV;
COPY times FROM '/home/courses/cs335/shared/corsola/courseOfferings_times.csv' DELIMITER ',' CSV;

CREATE SEQUENCE course_lists_id_seq;
CREATE TABLE course_lists
(
list_id int PRIMARY KEY DEFAULT nextval('course_lists_id_seq'),
user_id int REFERENCES users ON DELETE CASCADE,
course_list text,
preferredOrSelected boolean /*True if preferredcourselist, false is selectedcourselist*/
);


