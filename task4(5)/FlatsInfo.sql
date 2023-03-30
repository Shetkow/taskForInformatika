CREATE TABLE IF NOT EXISTS passport 
(
	ID SERIAL PRIMARY KEY,
	Full_name CHARACTER VARYING(30),
	Pasport_ID INTEGER UNIQUE,
	GENDER CHARACTER VARYING(3),
	DIVISION_CODE CHARACTER VARYING(7)
	
);
CREATE TABLE IF NOT EXISTS registration
(
	ID SERIAL PRIMARY KEY,
	Town CHARACTER VARYING(30),
	District CHARACTER VARYING(30),
	Rigeon CHARACTER VARYING(30),
	Area CHARACTER VARYING(30),
	Street CHARACTER VARYING(30),
	House INTEGER,
	Flat INTEGER,
	Post_ID INTEGER
);
 CREATE TABLE IF NOT EXISTS controls
 (
	 ID SERIAL PRIMARY KEY,
	 Passport_ID INTEGER NOT NULL REFERENCES passport(ID) ON DELETE CASCADE,
	 Registration_ID INTEGER NOT NULL REFERENCES registration (ID) ON DELETE CASCADE,
	 CreatedAt DATE NOT NULL,
	 Settled BOOLEAN DEFAULT FALSE
	 
	 
);

INSERT INTO passport(Full_name,Pasport_ID,Gender,DIVISION_CODE)
VALUES('Иванов Иван Иванович',2345121,'МУЖ','288-001'),
('Петрова Лариса Генадьевна',4566141,'ЖЕН','288-002'),
('Петров Виктор Олегович',789345,'МУЖ','278-003'),
('Кузьмина Ольга Николаевна',990112,'ЖЕН','236-127');

INSERT INTO registration(Town,Rigeon,Area,Street,House,Flat,Post_ID)
VALUES('Иваново','Ивановский','Ивановсая','Куконковых',3,5,153300),
('Иваново','Ивановский','Ивановсая','Лежневская',22,2,153302),
('Иваново','Ивановский','Ивановсая','23-линия',14,45,153456),
('Иваново','Ивановский','Ивановсая','Куконковых',23,66,153300),
('Иваново','Ивановский','Ивановсая','Радужная',29,6,153322);

INSERT INTO controls(Passport_ID,Registration_ID,CreatedAt,Settled)
VALUES(
	(SELECT ID FROM passport WHERE passport.Pasport_ID = 2345121),
	(SELECT ID FROM registration WHERE Street = '23-линия' AND House = 14),
	'2017-07-11',true
),
(
	(SELECT ID FROM passport WHERE passport.Pasport_ID = 4566141),
	(SELECT ID FROM registration WHERE Street = 'Куконковых' AND House = 3),
	'2022-06-12',
	true
),
(
	(SELECT ID FROM passport WHERE passport.Pasport_ID = 789345),
	(SELECT ID FROM registration WHERE Street = 'Лежневская'AND House = 22),
	'2022-01-11',
	true
),
(
	(SELECT ID FROM passport WHERE passport.Pasport_ID = 990112),
	(SELECT ID FROM registration WHERE Street = 'Куконковых' AND House = 23 ),
	'2022-06-12',
	true
);

SELECT House FROM controls,registration,passport
WHERE controls.Registration_ID = passport.ID AND  (registration.House % 2)  = 0; 

SELECT Full_name,House FROM passport
JOIN registration ON passport.ID = registration.ID;

