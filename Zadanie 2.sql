select * from pracownik;
select * from samochod;
select * from klient;
select * from wypozyczenie;

--10.1
select imie, nazwisko, pensja, coalesce(dodatek,0), pensja+coalesce(dodatek, 0) as do_zaplaty from pracownik;
--10.2
select imie, nazwisko, pensja, pensja + coalesce(pensja*0.5, 0) as nowa_pensja from pracownik;
--10.3
select imie, nazwisko, 0.1 * (pensja + coalesce(dodatek, 0)) as jeden_procent from pracownik order by jeden_procent asc;
--11.1
select top 1 imie, nazwisko from pracownik order by data_zatr asc;
--11.2
select top 4 imie, nazwisko from pracownik order by nazwisko asc, imie asc;
--11.3
select top 1 * from wypozyczenie order by data_wyp desc;
--12.1
select imie, nazwisko, data_zatr from pracownik where month(data_zatr)=5 order by nazwisko asc, imie asc;
--12.2
select imie, nazwisko, datediff(d, data_zatr, getdate()) as ilosc from pracownik order by ilosc desc;
--12.3
select marka, typ, datediff(yy, data_prod, getdate()) as ilosc from samochod order by ilosc desc;
--13.1
select imie, nazwisko, left(imie, 1)+'.'+left(nazwisko, 1)+'.' as inicjaly from klient order by inicjaly, nazwisko, imie;
--13.2
select imie, nazwisko, upper(left(imie, 1)) + lower(right(imie, len(imie)-1)) + ' ' + upper(left(nazwisko, 1)) + lower(right(nazwisko, len(nazwisko)-1)) as czlowiek from klient;
--13.3
select imie, nazwisko, stuff(nr_karty_kredyt, len(nr_karty_kredyt)-5, 6, 'xxxxxx') from klient;
--14.1
update pracownik set dodatek=50 where dodatek is null;
--14.2
update klient set imie='Jerzy', nazwisko='Nowak' where id_klient=10;
--14.3
update pracownik set dodatek=dodatek+100 where pensja<1500;
--15.1
delete from klient where id_klient=17;
--15.2
delete from wypozyczenie where id_klient=17;
--15.3
delete from samochod where przebieg>60000;
--16.1
insert into klient (id_klient, imie, nazwisko, ulica, numer, kod, miasto, telefon) values(121, 'Adam', 'Cichy', 'Korzenna' , '12', '00-950', 'Warszawa', '123-454-321');
--16.2
insert into samochod (id_samochod, marka, typ, data_prod, kolor, poj_silnika, przebieg) values (50, 'Skoda', 'Octavia', '2012-09-01', 'srebrny', 1896, 5000);
--16.3
insert into pracownik (id_pracownik, imie, nazwisko, data_zatr, dzial, stanowisko, pensja, dodatek, telefon, id_miejsce) values(12, 'Alojzy', 'Mikos', 2010-08-11, 'zaopatrzenie', 'magazynier', 3000, 50, '501-501-501', 1);

