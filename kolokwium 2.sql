--Imi� i nazwisko: Krystian �ukasiak
--Data i godzina: 24.04.2018 12:15
--Grupa laboratoryjna: 5
--Obowi�zuj�ca baza danych: sklep, http://fidytek.pl/bazy_danych/bd_skrypt_sql/sklep_mssql 

--Napisa� instrukcje SQL (dla MS SQL Server) realizuj�ce poni�sze zadania.

--EE1 [3 pkt]
--Znajd� zam�wienia (id_zamowienie, data_zamowienia), w kt�rych data zam�wienia jest 
--wcze�niejsza ni� '2014-01-01' i jednocze�nie zam�wienie by�o z�o�one nie wcze�niej 
--ni� '2011-03-05'.
--Wynik posortuj malej�co po dacie zam�wienia.
--Rozwi�zanie:

SELECT id_zamowienie, data_zamowienia FROM zamowienie WHERE data_zamowienia BETWEEN '05/03/2011' AND '01/01/2014' ORDER BY data_zamowienia DESC;

--EE2 [4 pkt]
--Podwy�sz o 2% pensj� pracownikom, u kt�rych dodatek jest nie wi�kszy ni� 1000 z�.
--Rozwi�zanie:

UPDATE pracownik SET pensja = pensja + pensja*0.02 WHERE dodatek < 1000;

--EE3 [4 pkt]
--Usu� klient�w, kt�rzy mieszkaj� w miejscowo�ci Gdynia.
--Rozwi�zanie:

DELETE k FROM klient k INNER JOIN adres a ON k.id_adres=a.id_adres WHERE a.miejscowosc='Gdynia';

--EE4 [4 pkt]
--Dla ka�dej nazwy miejscowo�ci oblicz ilu mieszka w niej klient�w.
--(Uwzgl�dnij te� nazwy miejscowo�ci, w kt�rych nie mieszka �aden klient,
--a znajduj� si� one w tabeli adres.)
--Wynik posortuj malej�co po oblicznej ilo�ci, a dla takiej samej 
--ilo�ci posortuj leksykograficznie po nazwie miejscowo�ci.
--Rozwi�zanie:

SELECT a.miejscowosc, COUNT(k.id_adres) AS ilosc FROM adres a LEFT JOIN klient K ON a.id_adres=k.id_adres
GROUP BY a.miejscowosc
ORDER BY ilosc DESC, a.miejscowosc ASC;

--EE5 [5 pkt]
--Znajd� nazw� kategorii, z kt�rej sprzedano najwi�cej produkt�w.
--(Takich kategorii mo�e by� kilka.)
--Prosz� nie u�ywa� konstrukcji TOP 1 WITH TIES.
--Rozwi�zanie:

SELECT TOP 1 WITH TIES pod.nazwa, COUNT(k.ilosc_sztuk) AS ilosc_sprzedanych
FROM koszyk k INNER JOIN produkt p ON k.id_produkt=p.id_produkt
INNER JOIN podkategoria pod ON p.id_podkategoria=pod.id_podkategoria
GROUP BY pod.nazwa
ORDER BY COUNT(k.ilosc_sztuk) DESC;
