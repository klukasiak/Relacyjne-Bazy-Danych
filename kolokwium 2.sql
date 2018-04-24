--Imiê i nazwisko: Krystian £ukasiak
--Data i godzina: 24.04.2018 12:15
--Grupa laboratoryjna: 5
--Obowi¹zuj¹ca baza danych: sklep, http://fidytek.pl/bazy_danych/bd_skrypt_sql/sklep_mssql 

--Napisaæ instrukcje SQL (dla MS SQL Server) realizuj¹ce poni¿sze zadania.

--EE1 [3 pkt]
--ZnajdŸ zamówienia (id_zamowienie, data_zamowienia), w których data zamówienia jest 
--wczeœniejsza ni¿ '2014-01-01' i jednoczeœnie zamówienie by³o z³o¿one nie wczeœniej 
--ni¿ '2011-03-05'.
--Wynik posortuj malej¹co po dacie zamówienia.
--Rozwi¹zanie:

SELECT id_zamowienie, data_zamowienia FROM zamowienie WHERE data_zamowienia BETWEEN '05/03/2011' AND '01/01/2014' ORDER BY data_zamowienia DESC;

--EE2 [4 pkt]
--Podwy¿sz o 2% pensjê pracownikom, u których dodatek jest nie wiêkszy ni¿ 1000 z³.
--Rozwi¹zanie:

UPDATE pracownik SET pensja = pensja + pensja*0.02 WHERE dodatek < 1000;

--EE3 [4 pkt]
--Usuñ klientów, którzy mieszkaj¹ w miejscowoœci Gdynia.
--Rozwi¹zanie:

DELETE k FROM klient k INNER JOIN adres a ON k.id_adres=a.id_adres WHERE a.miejscowosc='Gdynia';

--EE4 [4 pkt]
--Dla ka¿dej nazwy miejscowoœci oblicz ilu mieszka w niej klientów.
--(Uwzglêdnij te¿ nazwy miejscowoœci, w których nie mieszka ¿aden klient,
--a znajduj¹ siê one w tabeli adres.)
--Wynik posortuj malej¹co po oblicznej iloœci, a dla takiej samej 
--iloœci posortuj leksykograficznie po nazwie miejscowoœci.
--Rozwi¹zanie:

SELECT a.miejscowosc, COUNT(k.id_adres) AS ilosc FROM adres a LEFT JOIN klient K ON a.id_adres=k.id_adres
GROUP BY a.miejscowosc
ORDER BY ilosc DESC, a.miejscowosc ASC;

--EE5 [5 pkt]
--ZnajdŸ nazwê kategorii, z której sprzedano najwiêcej produktów.
--(Takich kategorii mo¿e byæ kilka.)
--Proszê nie u¿ywaæ konstrukcji TOP 1 WITH TIES.
--Rozwi¹zanie:

SELECT TOP 1 WITH TIES pod.nazwa, COUNT(k.ilosc_sztuk) AS ilosc_sprzedanych
FROM koszyk k INNER JOIN produkt p ON k.id_produkt=p.id_produkt
INNER JOIN podkategoria pod ON p.id_podkategoria=pod.id_podkategoria
GROUP BY pod.nazwa
ORDER BY COUNT(k.ilosc_sztuk) DESC;
