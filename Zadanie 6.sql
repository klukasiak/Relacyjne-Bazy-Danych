--32.1 
--DROP PROCEDURE wypisz_samochody;
CREATE PROCEDURE wypisz_samochody @marka VARCHAR(20)
AS
SELECT * FROM samochod WHERE marka=@marka;
GO
EXECUTE wypisz_samochody 'opel';

GO

--32.2
--DROP PROCEDURE zwieksz_pensje
CREATE PROCEDURE zwieksz_pensje (@id INT, @pensja INT)
AS
UPDATE pracownik SET pensja = pensja + @pensja WHERE id_pracownik = @id;
GO
EXECUTE zwieksz_pensje 1, 1000;

GO

--32.3
--DROP PROCEDURE dodaj_klienta
CREATE PROCEDURE dodaj_klienta (@id INT, @imie varchar(15), @nazwisko varchar(20), @nr_karty_kredyt char(20), @firma varchar(40), @ulica varchar(24), @numer varchar(8), @miasto varchar(24), @kod char(6), @nip char(11), @telefon varchar(16))
AS
INSERT INTO klient (id_klient, imie, nazwisko, nr_karty_kredyt, firma, ulica, numer, miasto, kod, nip, telefon) VALUES (@id, @imie, @nazwisko, @nr_karty_kredyt, @firma, @ulica, @numer, @miasto, @kod, @nip, @telefon);
GO
EXECUTE dodaj_klienta 50, 'Zenon', 'Cichociemy', 'ZFASD123', 'Wimest', 'Wawelska', '153', 'Przasnysz', '05-254', '37372817462', '854713697'

GO

--33.1 
--DROP FUNCTION dbo.aktywnosc_klienta;
--GO
CREATE FUNCTION dbo.aktywnosc_klienta (
 @id_klient INT
) RETURNS INT
BEGIN
RETURN (SELECT COUNT(*) FROM wypozyczenie
 WHERE id_klient=@id_klient)
END;
GO
SELECT dbo.aktywnosc_klienta(3) AS ile_wyp; 

GO

--33.2
--DROP FUNCTION dbo.ile_wypozyczen;
--GO
CREATE FUNCTION dbo.ile_wypozyczen (
 @data_od DATE, @data_do DATE) RETURNS INT
 BEGIN
 RETURN(SELECT COUNT(*) FROM wypozyczenie WHERE data_wyp BETWEEN @data_od AND @data_do)
 END;
 GO
 SELECT dbo.ile_wypozyczen('01/01/2000', '31-12-2000');

 GO

--33.3
--DROP FUNCTION dbo.roznica_pensji
CREATE FUNCTION dbo.roznica_pensji () RETURNS INT
BEGIN
RETURN(SELECT MAX(pensja) FROM pracownik SELECT MIN(pensja) FROM pracownik)
END;
