-- CREATING A DATABASE TO CREATE TABLES AND STORE INFORMATION
CREATE DATABASE MHA_TEST;

-- USE STATEMENT TO USE THIS DATABASE
USE[MHA_TEST];

-- CREATING TABLE Beneficiaries
CREATE TABLE Beneficiaries 
(
	BEN_ID VARCHAR(10) PRIMARY KEY NOT NULL, 	
	BEN_FNAME VARCHAR(50) NOT NULL,
	BEN_SNAME VARCHAR(150) NOT NULL,
	BEN_ADDRESS VARCHAR(50) NOT NULL,
	BEN_CONTACT VARCHAR(10) NOT NULL
);

-- CREATING TABLE Policies
CREATE TABLE Policies (
    POLICY_ID INT PRIMARY KEY NOT NULL,
    PlanId INT NOT NULL,
    BEN_ID VARCHAR(10) FOREIGN KEY REFERENCES Beneficiaries(BEN_ID) NOT NULL,
    START_DATE DATE NOT NULL,
    END_DATE DATE NOT NULL
);

-- CREATING TABLE Transactions 
CREATE TABLE Transactions 
(
	TRANS_ID INT PRIMARY KEY NOT NULL,
	TRANS_DATE DATE NOT NULL,
	TRANS_AMOUNT INT NOT NULL
); 

-- INSERTING DATA INTO Beneficiaries
INSERT INTO Beneficiaries VALUES 
('BEN_1','Jeff ','Willis','3 Main Road','0821253659'),
('BEN_2','Andre ','Watson','13 Cape Road','0769658547'),
('BEN_3','Wallis ','Smit','3 Mountain Road','0863256574'),
('BEN_4','Alex ','Lodewyks','8 Circle Road','0762356587'),
('BEN_5','Philip ','Smit','3 Long Road','0745556658');

-- INSERTING DATA INTO Policies TABLE
INSERT INTO Policies VALUES 
(1, 934, 'BEN_1', CONVERT(date, '01-01-2021', 105), CONVERT(date, '20-01-2028', 105)),
(2, 934, 'BEN_1', CONVERT(date, '03-04-2018', 105), CONVERT(date, '24-02-2026', 105)),
(3, 123, 'BEN_5', CONVERT(date, '25-03-2016', 105), CONVERT(date, '01-03-2020', 105)),
(4, 456, 'BEN_4', CONVERT(date, '14-04-2020', 105), CONVERT(date, '31-12-2027', 105)),
(5, 934, 'BEN_2', CONVERT(date, '12-05-2011', 105), CONVERT(date, '24-05-2024', 105));

-- INSERTING DATA INTO Transactions
INSERT INTO Transactions VALUES 
(1, CONVERT(date, '13-11-2017', 105), 1000),
(2, CONVERT(date, '13-12-2018', 105), 700),
(3, CONVERT(date, '13-02-2014', 105), 4000),
(4, CONVERT(date, '13-02-2014', 105), 3600),
(5, CONVERT(date, '13-12-2018', 105), 5000),
(6, CONVERT(date, '13-02-2014', 105), 2500);

-- VIEWING TABLE OUTPUT 
SELECT * FROM Beneficiaries;
SELECT * FROM Policies;
SELECT * FROM Transactions;

-- Select “Beneficiaries” where the “Surname” is alphabetically between (and including) “Lodewyks” and “Smit”
SELECT * FROM Beneficiaries WHERE BEN_SNAME BETWEEN 'Lodewyks' AND 'Smit' ORDER BY BEN_SNAME ASC;

-- Select “Beneficiaries” sorted descending by “Surname” then “Name”SELECT * FROM Beneficiaries ORDER BY BEN_SNAME, BEN_FNAME DESC;-- Change all “Policies” where the “PlanId” is 934 to “PlanId” 16 UPDATE Policies SET PlanId = 16 WHERE PlanId = 934;-- TO VIEW UPDATED TABLESELECT * FROM Policies;-- Get the sum (“Amount”) of all “Transactions” made in December 2018 
SELECT SUM(Transactions.TRANS_AMOUNT) AS [Total Amount]
FROM Transactions WHERE Transactions.TRANS_DATE BETWEEN '2018-12-01' AND '2018-12-31';

-- Create a new table with the name “Asset” containing an auto incremented unique identifier (“AssetId”),
-- a description of the asset (“AssetDescription”), and the owner (“Owner”)
-- CREATING TABLE Assets
CREATE TABLE Assets
(
	AssetId INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
	AssetDescription VARCHAR(350) NOT NULL,
	Owner VARCHAR(200) NOT NULL,
);

-- INSERTING DATA INTO TABLE Assets
INSERT INTO Assets VALUES 
('House and Business','Alex, Lodewyks'),
('House, Vehicle and Business','Bongani, Chauke'),
('Business and shares','Jeff, Willies');

-- SELECT TABLE TO VIEW OUTPUT
SELECT * FROM Assets;