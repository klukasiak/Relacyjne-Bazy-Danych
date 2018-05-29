--Gr. 2E
--Data: 29.05.2018r
--Imie: Krystian
--Nazwisko: £ukasiak
--Semestr: 2

--2E.1. Dana jest tabela laptop(id_laptop,marka,cena,rabat).
--Napisaæ funkcjê posiadaj¹c¹ jeden parametr p_cena i zwracaj¹c¹ iloœæ laptopów 
--o cenie ni¿szej ni¿ wartoœæ parametru.

--Etap 1: Utwórz tabelê laptop i dodaj 7 przyk³adowych rekordów.
CREATE TABLE laptop(
	id_laptop INTEGER NOT NULL PRIMARY KEY IDENTITY(1,1),
	marka VARCHAR(45) NOT NULL,
	cena MONEY NOT NULL,
	rabat INT
);

INSERT INTO laptop (marka, cena, rabat) VALUES ('Asus', 2000.00, 0.5);
INSERT INTO laptop (marka, cena, rabat) VALUES ('Lenovo', 2130.00, 0.2);
INSERT INTO laptop (marka, cena, rabat) VALUES ('Thinkpad', 2222.00, 0.3);
INSERT INTO laptop (marka, cena, rabat) VALUES ('Acer', 3123.00, 0.1);
INSERT INTO laptop (marka, cena, rabat) VALUES ('Xiaomi', 2213.00, 0.1);
INSERT INTO laptop (marka, cena, rabat) VALUES ('Samsung', 5123.00, 0.22);
INSERT INTO laptop (marka, cena, rabat) VALUES ('Toshiba', 3453.00, 0.32);

--GO;
--Etap 2: Utwórz funkcjê.

--DROP FUNCTION dbo.tansze;
--GO
CREATE FUNCTION dbo.tansze (@parametr MONEY) 
RETURNS INT
 BEGIN
 RETURN(SELECT COUNT(*) FROM laptop WHERE cena < @parametr)
 END;
 GO

--Etap 3: Udowodnij, ¿e utworzona funkcja dzia³a.
SELECT dbo.tansze(4000) AS ile_tanszych;

GO;
--2E.2. Napisaæ procedurê posiadaj¹c¹ dwa parametry bêd¹ce cenami: 
--p_cena_od i p_cena_do.
--Procedura ma modyfikowaæ tabelê laptop ustawiaj¹c wartoœæ rabatu na 5%
--dla laptopów z zakresu cen od p_cena_od do p_cena_do.
--Etap 1: Utwórz procedurê.

--DROP PROCEDURE modyfikuj_rabat
CREATE PROCEDURE modyfikuj_rabat (@p_cena_od MONEY, @p_cena_do MONEY)
AS
UPDATE laptop SET rabat = 0.05 WHERE cena BETWEEN @p_cena_od AND @p_cena_do;
GO;

--Etap 2: Udowodnij, ¿e utworzona procedura dzia³a.

EXECUTE modyfikuj_rabat 1000.00, 2100.00;
GO;

--3E.3 Napisaæ wyzwalacz podwy¿szaj¹cy cenê dodawanego laptopa o 23%.

--Etap 1: Utwórz wyzwalacz.

--DROP TRIGGER podwyzszanie_ceny
--GO;

CREATE TRIGGER podwyzszanie_ceny ON laptop
AFTER INSERT
AS
BEGIN
	UPDATE laptop SET cena = cena + cena * 0.23 WHERE cena = (SELECT cena FROM inserted);
END
GO



--Etap 2: Udowodnij, ¿e utworzony wyzwalacz dzia³a.


INSERT INTO laptop (marka, cena, rabat) VALUES ('NoName', 2222.00, 0.32);
SELECT * FROM laptop;