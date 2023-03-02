-- Clean up tables, functions, domain
DROP TABLE IF EXISTS USERS;
DROP TABLE IF EXISTS  ROLES;
DROP TABLE IF EXISTS QUESTIONSLOOKUP;
DROP TABLE IF EXISTS QUESTIONS;
DROP TABLE IF EXISTS ANSWERED;
DROP DOMAIN IF EXISTS email_address;
DROP FUNCTION IF EXISTS get_user_info;

--- Creating Custom Domain
--DOMAIN - email
CREATE DOMAIN email_address AS TEXT
CHECK (VALUE ~* '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');


---Create Tables.
--ROLES
CREATE TABLE ROLES(id  SERIAL PRIMARY KEY,
description TEXT);

TRUNCATE TABLE ROLES;
INSERT INTO ROLES (description)VALUES ('Admin');
INSERT INTO ROLES (description)VALUES ('User');
INSERT INTO ROLES (description)VALUES ('Guest');

--USERS
CREATE TABLE USERS(id  SERIAL PRIMARY KEY,
first_name	TEXT	NOT NULL,
last_name	TEXT	NOT NULL,
usr_role 	INT		NOT NULL,
email		email_address	NOT NULL,
phone		TEXT	NOT NULL,
updated_date_time TIMESTAMP WITH TIME ZONE DEFAULT NOW());

TRUNCATE TABLE USERS;
INSERT INTO USERS (first_name,last_name,usr_role,email,phone)VALUES ('navin','nkumar',1,'n@n.com','+9751449866');
INSERT INTO USERS (first_name,last_name,usr_role,email,phone)VALUES ('Dhanvika','Navin',2,'d@d.com','+9456449866');
INSERT INTO USERS (first_name,last_name,usr_role,email,phone)VALUES ('Suga','Priya',2,'s@s.com','+9751449858');

--QUESTIONS TYPE LOOKUP
CREATE TABLE QUESTIONSLOOKUP(id  SERIAL PRIMARY KEY,
description TEXT NOT NULL,
q_point INT        NOT NULL);

TRUNCATE TABLE QUESTIONSLOOKUP;
INSERT INTO QUESTIONSLOOKUP(description,q_point) VALUES ('Multiple Option',10);

--QUESTIONS
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
CREATE TABLE ANSWERED(id  SERIAL PRIMARY KEY,
q_id INT NOT NULL,
usr_id INT NOT NULL,
taken BOOLEAN NOT NULL);
TRUNCATE TABLE ANSWERED;
INSERT INTO ANSWERED (q_id,usr_ID,taken)VALUES (1,1,false);
INSERT INTO ANSWERED (q_id,usr_ID,taken)VALUES (2,1,true);
INSERT INTO ANSWERED (q_id,usr_ID,taken)VALUES (3,1,false);
INSERT INTO ANSWERED (q_id,usr_ID,taken)VALUES (4,1,true);
INSERT INTO ANSWERED (q_id,usr_ID,taken)VALUES (5,1,false);
INSERT INTO ANSWERED (q_id,usr_ID,taken)VALUES (6,1,false);

INSERT INTO ANSWERED (q_id,usr_ID,taken)VALUES (1,2,false);
INSERT INTO ANSWERED (q_id,usr_ID,taken)VALUES (2,2,false);
INSERT INTO ANSWERED (q_id,usr_ID,taken)VALUES (3,2,false);
INSERT INTO ANSWERED (q_id,usr_ID,taken)VALUES (4,2,false);
INSERT INTO ANSWERED (q_id,usr_ID,taken)VALUES (5,2,true);
INSERT INTO ANSWERED (q_id,usr_ID,taken)VALUES (6,2,true);


INSERT INTO ANSWERED (q_id,usr_ID,taken)VALUES (1,3,false);
INSERT INTO ANSWERED (q_id,usr_ID,taken)VALUES (2,3,true);
INSERT INTO ANSWERED (q_id,usr_ID,taken)VALUES (3,3,false);
INSERT INTO ANSWERED (q_id,usr_ID,taken)VALUES (4,3,false);
INSERT INTO ANSWERED (q_id,usr_ID,taken)VALUES (5,3,false);
INSERT INTO ANSWERED (q_id,usr_ID,taken)VALUES (6,3,true);


-- Select * from ROLES;
-- Select * from QUESTIONS;
-- Select * from QUESTIONSLOOKUP;
-- Select (first_name || ' ' ||last_name) as name from USERS us;
-- Select * from ANSWERED;

--- Creating Function
CREATE FUNCTION get_user_info(usr_id INT)
RETURNS TABLE (
    name TEXT,
    email email_address,
    phone TEXT,
    answered INT,
    un_answerred INT
)
AS $$
BEGIN
    test=# WITH ansr AS
    (
   		SELECT taken,q_id,usr_ID,count(*) AS res
    	FROM   ANSWERED AS a
		WHERE usr_id = 1
	    GROUP BY taken,q_id,usr_ID
		order by 1 desc
    )
    RETURN QUERY SELECT  (usr.first_name || ' ' ||usr.last_name) as name, 
    usr.email, usr.phone, 
    FROM USERS usr 
    WHERE usr.id = usr_id;
END;
$$ LANGUAGE plpgsql;
