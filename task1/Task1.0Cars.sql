CREATE TABLE IF NOT EXISTS  cars
(
  	Id SERIAL PRIMARY KEY,
	Brand CHARACTER VARYING(30) NOT NULL ,
	Model CHARACTER VARYING(30) NOT NULL,
	Transmission CHARACTER VARYING(4),
	Price NUMERIC NOT NULL
	
);

CREATE TABLE IF NOT EXISTS clients
(
	Id SERIAL PRIMARY KEY,
	First_name CHARACTER VARYING(20),
	Last_name CHARACTER VARYING(20),
	Age INTEGER DEFAULT 18 ,
	Phone CHARACTER VARYING(20) UNIQUE,
	CHECK((Age > 18 AND Age < 85) AND (Phone != ''))
);

CREATE TABLE IF NOT EXISTS dealer_center
(
	Id SERIAL PRIMARY KEY,
	CarsID INTEGER NOT NULL REFERENCES cars(Id)ON DELETE CASCADE,
	ClientsId INTEGER NOT NULL REFERENCES clients(Id)ON DELETE CASCADE,
	Rents_at_date DATE NOT NULL,
	Rental BOOLEAN DEFAULT FALSE
	
);


INSERT INTO cars(Brand,Model,Transmission,Price)
VALUES('Toyota','RAV4','AUTO',1260000),
('Renault','Sandero I','MECH',456000),
('BMW','X5','AUTO',2500000),
('Mercedes-Benz','e-200','MECH',150000);

INSERT INTO clients(First_name,Last_name,Age,Phone)
VALUES('Ivan','IVANOV',23,'+7905353521'),
('Peter','Petrov',28,'+790747474'),
('Pavel','Shectkov',28,'+79087564');
INSERT INTO dealer_center(CarsId,ClientsId,Rents_at_date,Rental)
VALUES
(
(SELECT Id FROM cars where Brand='BMW'),
(SELECT Id FROM clients WHERE First_name ='Pavel'),
'2023-03-26',
TRUE
	),
	(
(SELECT Id FROM cars where Brand='Renault'),
(SELECT Id FROM clients WHERE First_name ='Ivan'),
'2023-01-02',
TRUE
	);
	
SELECT * FROM dealer_center,cars
WHERE dealer_center.CarsId = Cars.Id;

SELECT dealer_center.Rents_at_date, clients.First_name, cars.Brand 
FROM dealer_center
JOIN cars ON cars.Id = dealer_center.CarsId
JOIN clients ON clients.Id=dealer_center.ClientsId
WHERE Cars.Price > 45000
ORDER BY clients.First_name;
