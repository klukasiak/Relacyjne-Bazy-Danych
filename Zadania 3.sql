--17.1
select s.id_samochod, s.marka, s.typ, w.data_wyp, w.data_odd
from samochod s inner join wypozyczenie w on s.id_samochod=w.id_samochod
where w.data_odd is null; 
FROM klient k INNER JOIN wypozyczenie w ON k.id_klient=w.id_klient
INNER JOIN samochod s ON w.id_samochod=s.id_samochod
ORDER BY k.nazwisko, k.imie, s.marka, s.typ; 
FROM klient k LEFT JOIN wypozyczenie w ON k.id_klient=w.id_klient
GROUP BY k.imie, k.nazwisko, k.id_klient
ORDER BY COUNT(w.id_klient) DESC;
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
SELECT p.imie, p.nazwisko, COUNT(w.id_pracow_wyp) AS ilosc_wypozyczen