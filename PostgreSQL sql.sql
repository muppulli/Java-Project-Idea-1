--ROLES
DROP TABLE IF EXISTS  ROLES;
CREATE TABLE ROLES(id  SERIAL PRIMARY KEY,
description TEXT);

TRUNCATE TABLE ROLES;
INSERT INTO ROLES (description)VALUES ('Admin');
INSERT INTO ROLES (description)VALUES ('User');
INSERT INTO ROLES (description)VALUES ('Guest');

--USERS
DROP TABLE IF EXISTS USERS;
CREATE TABLE USERS(id  SERIAL PRIMARY KEY,
first_name TEXT       NOT NULL,
last_name TEXT       NOT NULL,
role INT        NOT NULL);

TRUNCATE TABLE USERS;
INSERT INTO USERS (first_name,last_name,role)VALUES ('navin','nkumar',1);
INSERT INTO USERS (first_name,last_name,role)VALUES ('Dhanvika','Navin',2);
INSERT INTO USERS (first_name,last_name,role)VALUES ('Suga','Priya',2);

--QUESTIONS TYPE LOOKUP
CREATE TABLE QUESTIONSLOOKUP(id  SERIAL PRIMARY KEY,
description TEXT NOT NULL,
q_point INT        NOT NULL);

TRUNCATE TABLE QUESTIONS;
INSERT INTO QUESTIONSLOOKUP(description,q_point) VALUES ('Multiple Option',10);

--QUESTIONS
DROP TABLE IF EXISTS QUESTIONS;
CREATE TABLE QUESTIONS(id  SERIAL PRIMARY KEY,
question TEXT       NOT NULL,
options TEXT       NOT NULL,
answer TEXT       NOT NULL,
q_type_id INT NOT NULL);

TRUNCATE TABLE QUESTIONS;
INSERT INTO QUESTIONS (question,options,answer,q_type_id)VALUES ('What is C#','a.Language b.Program c.Joke','a',1);
INSERT INTO QUESTIONS (question,options,answer,q_type_id)VALUES ('What is Collections','a.Language b.Program c.Joke','a',1);
INSERT INTO QUESTIONS (question,options,answer,q_type_id)VALUES ('What is JAVA','a.Language b.Program c.Joke','c',1);
INSERT INTO QUESTIONS (question,options,answer,q_type_id)VALUES ('What is Rust','a.Language b.Program c.Joke','b',1);
INSERT INTO QUESTIONS (question,options,answer,q_type_id)VALUES ('What is Angular','a.Language b.Program c.Joke','b',1);
INSERT INTO QUESTIONS (question,options,answer,q_type_id)VALUES ('What is React','a.Language b.Program c.Joke','b',1);

--ANSWERED
DROP TABLE IF EXISTS ANSWERED;
CREATE TABLE ANSWERED(id  SERIAL PRIMARY KEY,
q_id INT NOT NULL,
usr_id INT NOT NULL,
taken BOOLEAN NOT NULL);
INSERT INTO ANSWERED (q_id,usr_ID,taken)VALUES (1,3,false);
INSERT INTO ANSWERED (q_id,usr_ID,taken)VALUES (2,1,true);
INSERT INTO ANSWERED (q_id,usr_ID,taken)VALUES (2,1,false);
INSERT INTO ANSWERED (q_id,usr_ID,taken)VALUES (3,2,true);
INSERT INTO ANSWERED (q_id,usr_ID,taken)VALUES (4,3,true);
INSERT INTO ANSWERED (q_id,usr_ID,taken)VALUES (5,2,true);


-- Select * from ROLES;
-- Select * from QUESTIONS;
-- Select * from QUESTIONSLOOKUP;
-- Select * from USERS;
-- Select * from ANSWERED;