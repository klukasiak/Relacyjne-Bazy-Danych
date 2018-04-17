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
 ORDER BY ilosc_wyp DESC, s.marka ASC, s.typ ASC; --24.2 SELECT TOP 1 WITH TIES k.id_klient, k.imie, k.nazwisko, COUNT(w.id_wypozyczenie) AS ilosc_wyp FROM klient k JOIN wypozyczenie w ON k.id_klient=w.id_klient GROUP BY k.id_klient, k.imie, k.nazwisko ORDER BY ilosc_wyp ASC, k.imie ASC, k.nazwisko ASC; --24.3 SELECT TOP 1 WITH TIES p.id_pracownik, p.nazwisko, p.imie, COUNT(w.id_wypozyczenie) as ilosc_wyp FROM pracownik p JOIN wypozyczenie w ON p.id_pracownik=w.id_pracow_wyp GROUP BY p.id_pracownik, p.nazwisko, p.imie ORDER BY ilosc_wyp DESC, p.nazwisko ASC, p.imie ASC; --25.1 UPDATE pracownik SET pensja=1.1*pensja WHERE pensja < (SELECT AVG(pensja) FROM pracownik); --25.2 UPDATE pracownik SET dodatek=10+dodatek WHERE id_pracownik IN (SELECT DISTINCT id_pracow_wyp FROM wypozyczenie WHERE MONTH(data_wyp)=5); --25.3 UPDATE pracownik SET pensja=pensja*0.95 WHERE id_pracownik NOT IN (SELECT DISTINCT id_pracow_wyp FROM wypozyczenie WHERE YEAR(data_wyp)=1999); --26.1 DELETE FROM klient WHERE id_klient NOT IN (SELECT DISTINCT id_klient FROM wypozyczenie);  --26.2 DELETE FROM samochod WHERE id_samochod NOT IN (SELECT DISTINCT id_samochod FROM wypozyczenie); --26.3 DELETE FROM pracownik WHERE id_pracownik NOT IN (SELECT DISTINCT id_pracownik FROM wypozyczenie); --27.1a  SELECT imie, nazwisko FROM klient
 UNION
 SELECT imie, nazwisko FROM pracownik
 ORDER BY 2, 1;  --27.1b SELECT imie, nazwisko FROM klient
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