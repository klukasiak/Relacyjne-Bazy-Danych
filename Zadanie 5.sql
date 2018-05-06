--28.1
--DROP TABLE pracownik2;
--GO
CREATE TABLE pracownik2(
 id_pracownik INT IDENTITY(1,1) PRIMARY KEY,
 imie VARCHAR(15) NOT NULL,
 nazwisko VARCHAR(20) NOT NULL,
 pesel CHAR(11) UNIQUE,
 data_zatr DATETIME DEFAULT GETDATE(),
 pensja MONEY CHECK(pensja>=1000)
);
--28.2
--DROP TABLE naprawa2;
--GO
CREATE TABLE naprawa2(
 id_naprawa INT IDENTITY(1,1) PRIMARY KEY,
 data_przyjecia DATETIME CHECK(data_przyjecia<GETDATE()),
 opis_usterki VARCHAR(255) NOT NULL CHECK(LEN(opis_usterki)>10),
 zaliczka MONEY CHECK(zaliczka>100 AND zaliczka<1000)
);
--28.3
--DROP TABLE wykonane_naprawy2
--GO
CREATE TABLE wykonane_naprawy2(
 id_pracownik int FOREIGN KEY REFERENCES pracownik2(id_pracownik),
 id_naprawa int FOREIGN KEY REFERENCES naprawa2(id_naprawa),
 data_naprawy DATETIME DEFAULT GETDATE(),
 opis_naprawy VARCHAR(255) NOT NULL,
 cena MONEY
);
--29.1
ALTER TABLE student2 ALTER COLUMN nazwisko VARCHAR(20) NOT NULL;
ALTER TABLE student2 ADD CONSTRAINT unikatowy_nr_indeksu UNIQUE (nr_indeksu);
ALTER TABLE student2 ADD CONSTRAINT sprawdz_stypendium CHECK (stypendium>=1000);
ALTER TABLE student2 ADD imie VARCHAR(15) NOT NULL;
--29.2
ALTER TABLE dostawca2 ADD CONSTRAINT unikatowa_nazwa UNIQUE(nazwa);
ALTER TABLE towar2 ADD nazwa VARCHAR(25) NOT NULL;
ALTER TABLE towar2 ADD CONSTRAINT unikatowy_kod_kreskowy UNIQUE(kod_kreskowy);
ALTER TABLE towar2 ADD FOREIGN KEY (id_dostawca) REFERENCES dostawca2(id_dostawca);
--29.3
ALTER TABLE kraj2 ADD CONSTRAINT unikatowa_nazwa UNIQUE(nazwa);
ALTER TABLE gatunek2 ADD CONSTRAINT unikatowa_nazwa UNIQUE(nazwa);
ALTER TABLE zwierze2 ADD FOREIGN KEY (id_gatunek) REFERENCES gatunek2(id_gatunek);
ALTER TABLE zwierze2 ADD FOREIGN KEY (id_kraj) REFERENCES kraj2(id_kraj);
--30.1
--wersja podstawowa
DROP TABLE przedmiot2;
DROP TABLE kategoria2;
--wersja trudeniejsza
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name='przedmiot2')
DROP TABLE przedmiot2;
IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE table_name='kategoria2')
DROP TABLE kategoria2; 
--30.2
ALTER TABLE osoba2 DROP COLUMN imie2;
--30.3
ALTER TABLE uczen2 DROP CONSTRAINT uczen_nazwisko_unique;
--31.1
--DROP TABLE zwierze2;
--DROP TABLE wlasciciel2;
CREATE TABLE wlasciciel2(
 id_wlasciciel INT IDENTITY(1,1)PRIMARY KEY,
 imie VARCHAR(15) NOT NULL CHECK(LEN(imie)>2),
 nazwisko VARCHAR(15) NOT NULL CHECK(LEN(nazwisko)>2),
 data_ur DATE NOT NULL DEFAULT GETDATE(),
 ulica VARCHAR(50),
 numer VARCHAR(8),
 kod CHAR(6) NOT NULL CHECK(LEN(kod)=6),
 miejscowosc VARCHAR(30) NOT NULL CHECK(LEN(miejscowosc)>1)
);
CREATE TABLE zwierze2(
 id_zwierze INT IDENTITY(1,1) PRIMARY KEY,
 id_wlasciciel INT REFERENCES wlasciciel2(id_wlasciciel) ON DELETE SET NULL,
 rasa VARCHAR(30) NOT NULL CHECK(LEN(rasa)>2),
 data_ur DATE NOT NULL DEFAULT GETDATE(),
 imie VARCHAR(15) NOT NULL CHECK(LEN(imie)>2)
);
--INSERT INTO wlasciciel2(imie,nazwisko,data_ur,ulica,numer,kod,miejscowosc)
--VALUES ('Jan','Kos','1999-01-11','Polna','1','11-222','Nysa');
--INSERT INTO zwierze2(id_wlasciciel,rasa,data_ur,imie)
--VALUES (1,'Jamnik','2010-03-03','Krótki');
--SELECT * FROM zwierze2;
--DELETE FROM wlasciciel2 WHERE id_wlasciciel=1;
--SELECT * FROM zwierze2; 