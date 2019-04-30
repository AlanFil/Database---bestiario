USE master
GO
IF NOT EXISTS(SELECT * FROM master.sys.databases 
          WHERE name='Bestiariusz')
BEGIN
	CREATE DATABASE Bestiariusz
END
GO 
IF EXISTS(SELECT * FROM master.sys.databases 
          WHERE name='Bestiariusz')
BEGIN
    PRINT 'Database exists'
END
GO
USE Bestiariusz
GO

-------------------TABELE--------------------------------
IF OBJECT_ID('Bestiariusz.dbo.Występowania','U') IS NULL
CREATE TABLE Bestiariusz.dbo.Występowania (
ID_Występowania INT CONSTRAINT PK_Występowania PRIMARY KEY,
Występowanie NVARCHAR(MAX)
)

IF OBJECT_ID('Bestiariusz.dbo.Słabości','U') IS NULL
CREATE TABLE Bestiariusz.dbo.Słabości (
ID_Słabości INT CONSTRAINT PK_Słabości PRIMARY KEY,
Słabość NVARCHAR(MAX)
)

IF OBJECT_ID('Bestiariusz.dbo.Składniki','U') IS NULL
CREATE TABLE Bestiariusz.dbo.Składniki (
ID_Składniki INT CONSTRAINT PK_Składniki PRIMARY KEY,
Składnik NVARCHAR(MAX)
)

IF OBJECT_ID('Bestiariusz.dbo.Lista','U') IS NULL
CREATE TABLE Bestiariusz.dbo.Lista (
ID_Bestie INT CONSTRAINT PK_Bestie PRIMARY KEY,
Bestia NVARCHAR(MAX) NOT NULL,
Występowanie INT CONSTRAINT FK_Występowania REFERENCES Bestiariusz.dbo.Występowania(ID_Występowania),
Stan NVARCHAR(MAX),
Zagrożenie NVARCHAR(MAX),
Słabość INT CONSTRAINT FK_Wrażliwości REFERENCES Bestiariusz.dbo.Słabości(ID_Słabości)
)

IF OBJECT_ID('Bestiariusz.dbo.Polowania','U') IS NULL
CREATE TABLE Bestiariusz.dbo.Polowania (
ID_Polowania INT CONSTRAINT PK_Polowania PRIMARY KEY,
"Data" DATE,
Bestia INT CONSTRAINT FK_Bestie REFERENCES Bestiariusz.dbo.Lista(ID_Bestie),
Liczba INT NOT NULL,
Składnik INT CONSTRAINT FK_Składniki REFERENCES Bestiariusz.dbo.Składniki(ID_Składniki),
Polujący NVARCHAR(MAX) NOT NULL,
Uwagi NVARCHAR(MAX)
)

-------------------WRTOŚCI W TABELACH---------------------------

--Występowania
INSERT INTO Bestiariusz.dbo.Występowania VALUES (200, 'Wśród ludzi');
INSERT INTO Bestiariusz.dbo.Występowania VALUES (201, 'Pobliże potoku');
INSERT INTO Bestiariusz.dbo.Występowania VALUES (202, 'Zachód');
INSERT INTO Bestiariusz.dbo.Występowania VALUES (203, 'Las');
INSERT INTO Bestiariusz.dbo.Występowania VALUES (204, 'Bagna');
INSERT INTO Bestiariusz.dbo.Występowania VALUES (205, 'Trzęsawiska');
INSERT INTO Bestiariusz.dbo.Występowania VALUES (206, 'Legendy');
INSERT INTO Bestiariusz.dbo.Występowania VALUES (207, 'Przy skarbie');
INSERT INTO Bestiariusz.dbo.Występowania VALUES (208, 'Niebo');
INSERT INTO Bestiariusz.dbo.Występowania VALUES (209, 'Pola');
INSERT INTO Bestiariusz.dbo.Występowania VALUES (210, 'Mosty');
INSERT INTO Bestiariusz.dbo.Występowania VALUES (211, 'Góry');
INSERT INTO Bestiariusz.dbo.Występowania VALUES (212, 'Głębokie wody');
INSERT INTO Bestiariusz.dbo.Występowania VALUES (213, 'Krypty');
INSERT INTO Bestiariusz.dbo.Występowania VALUES (214, 'Ołtarze w lesie');
--SELECT * FROM Bestiariusz.dbo.Występowania

--Słabości
INSERT INTO Bestiariusz.dbo.Słabości VALUES (0, 'Nieznana');
INSERT INTO Bestiariusz.dbo.Słabości VALUES (100, 'Znak Igni');
INSERT INTO Bestiariusz.dbo.Słabości VALUES (101, 'Znak Ard');
INSERT INTO Bestiariusz.dbo.Słabości VALUES (102, 'Znak Yrden');
INSERT INTO Bestiariusz.dbo.Słabości VALUES (103, 'Znak Aksji');
INSERT INTO Bestiariusz.dbo.Słabości VALUES (104, 'Znak Quen');
INSERT INTO Bestiariusz.dbo.Słabości VALUES (105, 'Znak Somne');
INSERT INTO Bestiariusz.dbo.Słabości VALUES (106, 'Znak Heliotrop');
INSERT INTO Bestiariusz.dbo.Słabości VALUES (107, 'Krwawienie');
INSERT INTO Bestiariusz.dbo.Słabości VALUES (108, 'Powalenie');
INSERT INTO Bestiariusz.dbo.Słabości VALUES (109, 'Oszołomnienie');
INSERT INTO Bestiariusz.dbo.Słabości VALUES (110, 'Zatrucie');
INSERT INTO Bestiariusz.dbo.Słabości VALUES (111, 'Olej specjalistyczny');
INSERT INTO Bestiariusz.dbo.Słabości VALUES (112, 'Petarda');
--SELECT * FROM Bestiariusz.dbo.Słabości

--Składniki
INSERT INTO Bestiariusz.dbo.Składniki VALUES (10,'Aether')
INSERT INTO Bestiariusz.dbo.Składniki VALUES (11,'Albedo')
INSERT INTO Bestiariusz.dbo.Składniki VALUES (12,'Nigredo')
INSERT INTO Bestiariusz.dbo.Składniki VALUES (13,'Rubedo')
INSERT INTO Bestiariusz.dbo.Składniki VALUES (14,'Hydragen')
INSERT INTO Bestiariusz.dbo.Składniki VALUES (15,'Rebis')
INSERT INTO Bestiariusz.dbo.Składniki VALUES (16,'Quebrith')
INSERT INTO Bestiariusz.dbo.Składniki VALUES (17,'Vitriol')
INSERT INTO Bestiariusz.dbo.Składniki VALUES (18,'Vermilion')
INSERT INTO Bestiariusz.dbo.Składniki VALUES (19,'Calcium equum')
INSERT INTO Bestiariusz.dbo.Składniki VALUES (20,'Mutagen niebieski')
INSERT INTO Bestiariusz.dbo.Składniki VALUES (21,'Mutagen zielony')
INSERT INTO Bestiariusz.dbo.Składniki VALUES (22,'Mutagen czerwony')
INSERT INTO Bestiariusz.dbo.Składniki VALUES (23,'Saletra')
--SELECT * FROM Bestiariusz.dbo.Składniki

--Lista
INSERT INTO Bestiariusz.dbo.Lista VALUES (1,	'Bożątko',		200,	'Zdrowe',		'Nie',	100);
INSERT INTO Bestiariusz.dbo.Lista VALUES (2,	'Brzegina',		201,	'Samotna',		'Tak',	112);
INSERT INTO Bestiariusz.dbo.Lista VALUES (3,	'Buc',			202,	'Śpi',			'Tak',	101);
INSERT INTO Bestiariusz.dbo.Lista VALUES (4,	'Mróz',			203,	'Wiecznie młody','Nie',	105);
INSERT INTO Bestiariusz.dbo.Lista VALUES (5,	'Mrucek',		200,	'Odprężony',	'Nie',	0);
INSERT INTO Bestiariusz.dbo.Lista VALUES (6,	'Nocnica',		205,	'Rozżarzone',	'Tak',	100);
INSERT INTO Bestiariusz.dbo.Lista VALUES (7,	'Bagienny ognik',206,	'Przerażone',	'Nie',	109);
INSERT INTO Bestiariusz.dbo.Lista VALUES (8,	'Błotnik',		207,	'Zmęczony',		'Nie',	102);
INSERT INTO Bestiariusz.dbo.Lista VALUES (9,	'Utopiec',		206,	'Zafrasowany',	'Nie',	112);
INSERT INTO Bestiariusz.dbo.Lista VALUES (10,	'Perepłut',		209,	NULL,			'Nie',	110);
INSERT INTO Bestiariusz.dbo.Lista VALUES (11,	'Bies',			210,	'Śpi',			'Nie',	104);
INSERT INTO Bestiariusz.dbo.Lista VALUES (12,	'Licho',		211,	'Nie śpi',		'Tak',	102);
INSERT INTO Bestiariusz.dbo.Lista VALUES (13,	'Dworowy',		200,	'Odprężony',	'Nie',	102);
INSERT INTO Bestiariusz.dbo.Lista VALUES (14,	'Tęsknica',		213,	'Zadumana',		'Tak',	107);
INSERT INTO Bestiariusz.dbo.Lista VALUES (15,	'Miawka',		214,	'Oczekuje',		'Tak',	111);
INSERT INTO Bestiariusz.dbo.Lista VALUES (16,	'Troll',		210,	'Oczekuje',		'Nie',	107);
INSERT INTO Bestiariusz.dbo.Lista VALUES (17,	'Harpia',		211,	'Lata',			'Tak',	108);
INSERT INTO Bestiariusz.dbo.Lista VALUES (18,	'Syrena',		212,	'Śpiewa',		NULL,	0);
INSERT INTO Bestiariusz.dbo.Lista VALUES (19,	'Sukkub',		200,	'Zdrowa',		NULL,	103);
INSERT INTO Bestiariusz.dbo.Lista VALUES (20,	'Nekker',		205,	'Czujny',		'Tak',	0);
INSERT INTO Bestiariusz.dbo.Lista VALUES (21,	'Fleder',		213,	'Głodny',		'Tak',	109);
INSERT INTO Bestiariusz.dbo.Lista VALUES (22,	'Leszy',		214,	'Śpi',			'Nie',	103);
INSERT INTO Bestiariusz.dbo.Lista VALUES (23,	'Gul',			213,	'Oczekuje',		'Nie',	110);
--SELECT * FROM Bestiariusz.dbo.Lista

--Polowania
INSERT INTO Bestiariusz.dbo.Polowania VALUES (1, '0968-04-11',	21, 5,	15,	'Geralt', 'Sezon czas zacząć');
INSERT INTO Bestiariusz.dbo.Polowania VALUES (2, '0968-04-24',	3,  3,	22,	'Geralt', '');
INSERT INTO Bestiariusz.dbo.Polowania VALUES (3, '0968-04-30',	6,  1,	21,	'Geralt', 'Szkoda jej trochę...');
INSERT INTO Bestiariusz.dbo.Polowania VALUES (4, '0968-05-12',	15, 2, 	14,	'Vesemir', '');
INSERT INTO Bestiariusz.dbo.Polowania VALUES (5, '0968-05-25',	14,	2,	10,	'Lambert', '');
INSERT INTO Bestiariusz.dbo.Polowania VALUES (6, '0968-05-26',	4,	1,	12,	'Lambert', 'Widocznie tak miało być');
INSERT INTO Bestiariusz.dbo.Polowania VALUES (7, '0968-05-30',	17,	5,	18,	'Eskel', '');
INSERT INTO Bestiariusz.dbo.Polowania VALUES (8, '0968-06-02',	15, 2, 	14,	'Geralt', '');
INSERT INTO Bestiariusz.dbo.Polowania VALUES (9, '0968-06-30',	14,	2,	10,	'Lambert', '');
INSERT INTO Bestiariusz.dbo.Polowania VALUES (10,'0968-07-01',	12,	1,	13,	'Eskel', 'Już śpi');
INSERT INTO Bestiariusz.dbo.Polowania VALUES (11,'0968-07-10',	8,	7,	13,	'Geralt', '');
INSERT INTO Bestiariusz.dbo.Polowania VALUES (12,'0968-07-12',	15, 2, 	14,	'Vesemir', '');
INSERT INTO Bestiariusz.dbo.Polowania VALUES (13,'0968-07-20',	11,	2,	10,	'Lambert', '');
INSERT INTO Bestiariusz.dbo.Polowania VALUES (14,'0968-07-20',	20, 2, 	14,	'Lambert', '');
INSERT INTO Bestiariusz.dbo.Polowania VALUES (15,'0968-07-21',	7,	2,	10,	'Lambert', '');
INSERT INTO Bestiariusz.dbo.Polowania VALUES (16,'0968-07-23',	9,	7,	10,	'Lambert', '');
INSERT INTO Bestiariusz.dbo.Polowania VALUES (17,'0968-07-24',	9,	4,	10,	'Lambert', '');
INSERT INTO Bestiariusz.dbo.Polowania VALUES (18,'0968-07-30',	17,	4,	18,	'Eskel', '');
INSERT INTO Bestiariusz.dbo.Polowania VALUES (19,'0968-08-05',	23, 8,	15,	'Geralt', '');
INSERT INTO Bestiariusz.dbo.Polowania VALUES (20,'0968-08-13',	3,  3,	22,	'Geralt', 'Nie lubię portali...');
--SELECT * FROM Bestiariusz.dbo.Polowania


--------------------Widoki---------------------------
GO
CREATE VIEW Polowanie AS
SELECT "Data", Bestiariusz.dbo.Lista.Bestia, Liczba, Bestiariusz.dbo.Składniki.Składnik, Polujący, Uwagi FROM Bestiariusz.dbo.Polowania
INNER JOIN Bestiariusz.dbo.Lista on Polowania.Bestia=ID_Bestie
INNER JOIN Bestiariusz.dbo.Składniki on Polowania.Składnik=ID_Składniki
GO

CREATE VIEW Polowanie_uwagi AS
SELECT "Data", Bestiariusz.dbo.Lista.Bestia, Liczba, Bestiariusz.dbo.Składniki.Składnik, Polujący, Uwagi FROM Bestiariusz.dbo.Polowania
INNER JOIN Bestiariusz.dbo.Lista on Bestiariusz.dbo.Polowania.Bestia=ID_Bestie
INNER JOIN Bestiariusz.dbo.Składniki on Bestiariusz.dbo.Polowania.Składnik=ID_Składniki
WHERE Uwagi != ''
GO

CREATE VIEW Polowanie_zabitych AS
SELECT SUM(Liczba) AS Zabitych_bestii_łącznie FROM Bestiariusz.dbo.Polowania
GO

CREATE VIEW Polowanie_Geralt AS
SELECT "Data", Bestiariusz.dbo.Lista.Bestia, Liczba, Bestiariusz.dbo.Składniki.Składnik, Polujący, Uwagi FROM Bestiariusz.dbo.Polowania
INNER JOIN Bestiariusz.dbo.Lista on Bestiariusz.dbo.Polowania.Bestia=ID_Bestie
INNER JOIN Bestiariusz.dbo.Składniki on Bestiariusz.dbo.Polowania.Składnik=ID_Składniki
WHERE Polujący = 'Geralt'
GO

CREATE VIEW Polowanie_Eskel AS
SELECT "Data", Bestiariusz.dbo.Lista.Bestia, Liczba, Bestiariusz.dbo.Składniki.Składnik, Polujący, Uwagi FROM Bestiariusz.dbo.Polowania
INNER JOIN Bestiariusz.dbo.Lista on Bestiariusz.dbo.Polowania.Bestia=ID_Bestie
INNER JOIN Bestiariusz.dbo.Składniki on Bestiariusz.dbo.Polowania.Składnik=ID_Składniki
WHERE Polujący = 'Eskel'
GO

CREATE VIEW Polowanie_Lambert AS
SELECT "Data", Bestiariusz.dbo.Lista.Bestia, Liczba, Bestiariusz.dbo.Składniki.Składnik, Polujący, Uwagi FROM Bestiariusz.dbo.Polowania
INNER JOIN Bestiariusz.dbo.Lista on Bestiariusz.dbo.Polowania.Bestia=ID_Bestie
INNER JOIN Bestiariusz.dbo.Składniki on Bestiariusz.dbo.Polowania.Składnik=ID_Składniki
WHERE Polujący = 'Lambert'
GO

CREATE VIEW Polowanie_Vesemir AS
SELECT "Data", Bestiariusz.dbo.Lista.Bestia, Liczba, Bestiariusz.dbo.Składniki.Składnik, Polujący, Uwagi FROM Bestiariusz.dbo.Polowania
INNER JOIN Bestiariusz.dbo.Lista on Bestiariusz.dbo.Polowania.Bestia=ID_Bestie
INNER JOIN Bestiariusz.dbo.Składniki on Bestiariusz.dbo.Polowania.Składnik=ID_Składniki
WHERE Polujący = 'Vesemir'
GO

CREATE VIEW Lista_pełna AS
SELECT ID_Bestie, Bestia, Występowania.Występowanie, Stan, Zagrożenie, Słabości.Słabość FROM Bestiariusz.dbo.Lista
INNER JOIN Bestiariusz.dbo.Występowania on Lista.Występowanie=ID_Występowania
INNER JOIN Bestiariusz.dbo.Słabości on Lista.Słabość=ID_Słabości
GO

IF OBJECT_ID('Raport_1','V') IS NOT NULL
DROP VIEW Raport_1
GO

CREATE VIEW Raport_1 AS
SELECT TOP 3 Bestia, SUM(Liczba) AS Liczba
FROM Polowanie
GROUP BY Bestia
ORDER BY Liczba DESC
GO

IF OBJECT_ID('Raport_2','V') IS NOT NULL
DROP VIEW Raport_2
GO

CREATE VIEW Raport_2 AS
SELECT Polujący, SUM(Liczba) AS Liczba
FROM Polowanie
GROUP BY Polujący
GO

IF OBJECT_ID('Raport_3','V') IS NOT NULL
DROP VIEW Raport_3
GO

CREATE VIEW Raport_3 AS
SELECT TOP 5 Składnik, SUM(Liczba) AS Liczba
FROM Polowanie
GROUP BY Składnik
ORDER BY Liczba
GO
--------------------Procedury---------------------------
IF OBJECT_ID('Wiedźmin_miesiąca','P') IS NOT NULL
DROP PROCEDURE Wiedźmin_miesiąca
GO

CREATE PROCEDURE Wiedźmin_miesiąca @pocz DATE = '0968-07-01', @kon DATE = '0968-07-31' AS
SELECT SUM(Liczba) AS Liczba, Polujący FROM Polowanie
WHERE "Data" >= @pocz AND "Data" <= @kon
GROUP BY Polujący
ORDER BY Liczba DESC
GO

IF OBJECT_ID('Uwgai_Wiedźmina','P') IS NOT NULL
DROP PROCEDURE Uwagi_Wiedźmina
GO

CREATE PROCEDURE Uwagi_Wiedźmina @bestia NVARCHAR(20), @wiedźmin NVARCHAR(20) AS
SELECT "Data", Bestiariusz.dbo.Lista.Bestia, Liczba, Polujący, Uwagi FROM Bestiariusz.dbo.Polowania
INNER JOIN Bestiariusz.dbo.Lista on Bestiariusz.dbo.Polowania.Bestia=ID_Bestie
WHERE Bestiariusz.dbo.Lista.Bestia = @bestia AND Polujący = @wiedźmin AND Uwagi != ''
GO



--------------------Raporty-----------------------------
--Raport 1
SELECT * FROM Raport_1

--Raport 2
SELECT * FROM Raport_2

--Raport 3
SELECT * FROM Raport_3

--Raport 4
EXEC Wiedźmin_miesiąca

--Raport 5
EXEC Uwagi_Wiedźmina 'Licho', 'Eskel'


--Raport 6
SELECT TOP 5 "Data", Bestiariusz.dbo.Lista.Bestia, Liczba, Polujący, Uwagi
FROM Bestiariusz.dbo.Polowania
INNER JOIN Bestiariusz.dbo.Lista on Bestiariusz.dbo.Polowania.Bestia=ID_Bestie
WHERE Uwagi != ''
GO

USE master
GO
DROP DATABASE Bestiariusz