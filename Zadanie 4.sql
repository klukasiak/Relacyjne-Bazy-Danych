--22.1
 SELECT imie, nazwisko, pensja FROM pracownik WHERE pensja=(SELECT MAX(pensja) FROM pracownik); 
 --22.2
 SELECT imie, nazwisko, pensja FROM pracownik WHERE pensja>(SELECT AVG(pensja) FROM pracownik);
 --22.3
 SELECT marka, typ, data_prod FROM samochod WHERE data_prod=(SELECT MIN(data_prod) FROM samochod);
 --23.1
 SELECT marka, typ, data_prod FROM samochod WHERE id_samochod NOT IN (SELECT DISTINCT id_samochod
 FROM wypozyczenie); 
 --23.2
 SELECT imie, nazwisko FROM klient WHERE id_klient NOT IN (SELECT DISTINCT id_klient FROM wypozyczenie);
 --23.3
 SELECT imie, nazwisko FROM pracownik WHERE id_pracownik NOT IN (SELECT DISTINCT id_pracownik FROM wypozyczenie);
 --24.1
 SELECT TOP 1 WITH TIES s.id_samochod, s.marka, s.typ, COUNT(w.id_samochod) AS ilosc_wyp
 FROM samochod s JOIN wypozyczenie w ON s.id_samochod=w.id_samochod
 GROUP BY s.id_samochod, s.marka, s.typ
 ORDER BY ilosc_wyp DESC, s.marka ASC, s.typ ASC;
 UNION
 SELECT imie, nazwisko FROM pracownik
 ORDER BY 2, 1; 
 UNION ALL
 SELECT imie, nazwisko FROM pracownik
 ORDER BY 2, 1;
 --27.2
 SELECT imie, nazwisko FROM pracownik
 INTERSECT
 SELECT imie, nazwisko FROM klient;
 --27.3
 SELECT imie, nazwisko FROM pracownik
 EXCEPT
 SELECT imie, nazwisko FROM klient;