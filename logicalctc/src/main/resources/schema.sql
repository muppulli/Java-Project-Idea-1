
--ROLES
CREATE TABLE IF NOT EXISTS ROLES(id SMALLINT NOT NULL AUTO_INCREMENT,
description VARCHAR(MAX));
--QUESTIONS
CREATE TABLE IF NOT EXISTS QUESTIONS(id SMALLINT NOT NULL AUTO_INCREMENT,
question VARCHAR(MAX) NOT NULL,
options VARCHAR(MAX) NOT NULL,
answer VARCHAR(MAX) NOT NULL,
point SMALLINT NOT NULL);
--USERS
CREATE TABLE IF NOT EXISTS USERS(id SMALLINT NOT NULL AUTO_INCREMENT,
first_name VARCHAR(MAX) NOT NULL,
last_name VARCHAR(MAX) NOT NULL,
role NUMERIC NOT NULL,
rank NUMERIC NOT NULL);

TRUNCATE TABLE USERS;
INSERT INTO USERS (first_name,last_name,role,rank)VALUES ('navin','nkumar',1,0);
INSERT INTO USERS (first_name,last_name,role,rank)VALUES ('Dhanvika','Navin',2,0);
INSERT INTO USERS (first_name,last_name,role,rank)VALUES ('Suga','Priya',2,0);

TRUNCATE TABLE ROLES;
INSERT INTO ROLES (description)VALUES ('Admin');
INSERT INTO ROLES (description)VALUES ('User');
INSERT INTO ROLES (description)VALUES ('Guest');

TRUNCATE TABLE QUESTIONS;
INSERT INTO QUESTIONS (question,options,answer,point)VALUES ('What is C#','a.Language b.Program c.Joke','a',2);
INSERT INTO QUESTIONS (question,options,answer,point)VALUES ('What is JAVA','a.Language b.Program c.Joke','c',4);
INSERT INTO QUESTIONS (question,options,answer,point)VALUES ('What is Angular','a.Language b.Program c.Joke','b',6);