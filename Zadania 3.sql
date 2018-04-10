--17.1
select s.id_samochod, s.marka, s.typ, w.data_wyp, w.data_odd
from samochod s inner join wypozyczenie w on s.id_samochod=w.id_samochod
where w.data_odd is null; --17.2SELECT k.imie, k.nazwisko, w.id_samochod, w.data_wypFROM klient k INNER JOIN wypozyczenie w ON k.id_klient=w.id_klient WHERE w.data_odd IS NULL ORDER BY k.nazwisko asc, k.imie asc;--17.3SELECT k.imie, k.nazwisko, w.data_wyp, w.kaucjaFROM klient k INNER JOIN wypozyczenie w on k.id_klient=w.id_klientWHERE w.kaucja IS NOT NULL;--18.1SELECT k.imie, k.nazwisko, w.data_wyp, s.marka, s.typ
FROM klient k INNER JOIN wypozyczenie w ON k.id_klient=w.id_klient
INNER JOIN samochod s ON w.id_samochod=s.id_samochod
ORDER BY k.nazwisko, k.imie, s.marka, s.typ; --18.2SELECT m.ulica, m.miasto, s.marka, s.typFROM miejsce m INNER JOIN wypozyczenie w ON m.id_miejsce=w.id_miejsca_wypINNER JOIN samochod s ON  w.id_samochod=s.id_samochodORDER BY m.miasto, m.ulica, s.marka, s.typ;--18.3SELECT s.id_samochod, s.marka, s.typ, k.imie, k.nazwiskoFROM klient k INNER JOIN wypozyczenie w ON k.id_klient=w.id_klientINNER JOIN samochod s ON s.id_samochod=w.id_samochodORDER BY s.id_samochod, k.nazwisko, k.imie;--19.1SELECT MAX(pensja) FROM pracownik;--19.2SELECT AVG(pensja) FROM pracownik;--19.3SELECT MIN(data_prod) FROM samochod;--20.1SELECT k.imie, k.nazwisko, COUNT(w.id_klient) AS ilosc_wypozyczen
FROM klient k LEFT JOIN wypozyczenie w ON k.id_klient=w.id_klient
GROUP BY k.imie, k.nazwisko, k.id_klient
ORDER BY COUNT(w.id_klient) DESC;--20.2SELECT s.id_samochod, s.marka, s.typ, COUNT(w.id_samochod) AS ilosc_wypozyczenFROM samochod s LEFT JOIN wypozyczenie w ON s.id_samochod=w.id_samochodGROUP BY s.id_samochod, s.marka, s.typORDER BY COUNT(w.id_samochod);--20.3SELECT p.imie, p.nazwisko, COUNT(w.id_pracow_wyp) AS ilosc_wypozyczenFROM pracownik p LEFT JOIN wypozyczenie w ON p.id_pracownik=w.id_pracow_wypGROUP BY p.imie, p.nazwiskoORDER BY ilosc_wypozyczen;--21.1SELECT k.imie, k.nazwisko, COUNT(w.id_klient) AS ilosc_wypozyczen
FROM klient k INNER JOIN wypozyczenie w ON k.id_klient=w.id_klient
GROUP BY k.imie, k.nazwisko, k.id_klient
HAVING COUNT(w.id_klient)>=2
ORDER BY nazwisko ASC, imie ASC; 
--21.2
SELECT s.id_samochod, s.marka, s.typ, COUNT(w.id_wypozyczenie) AS ilosc_wypozyczen
FROM samochod s INNER JOIN wypozyczenie w ON s.id_samochod=w.id_samochod
GROUP BY s.id_samochod, s.marka, s.typ
HAVING COUNT(w.id_wypozyczenie)>=5
ORDER BY s.marka, s.typ;
--21.3
SELECT p.imie, p.nazwisko, COUNT(w.id_pracow_wyp) AS ilosc_wypozyczenFROM pracownik p LEFT JOIN wypozyczenie w ON p.id_pracownik=w.id_pracow_wypGROUP BY p.imie, p.nazwiskoHAVING COUNT(w.id_pracow_wyp)<=20ORDER BY ilosc_wypozyczen;