select * from pracownik;
select * from samochod;
select * from klient;

--1.1
select * from pracownik;
--1.2
select imie from pracownik;
--1.3
select imie, nazwisko, dzial from pracownik;
--2.1
select imie, nazwisko, pensja from pracownik order by pensja desc;
--2.2
select nazwisko, imie from pracownik order by nazwisko asc, imie asc;
--2.3
select nazwisko, dzial, stanowisko from pracownik order by dzial asc, stanowisko desc;
--3.1
select distinct dzial from pracownik;
--3.2
select distinct dzial, stanowisko from pracownik;
--3.3
select distinct dzial, stanowisko from pracownik order by dzial desc, stanowisko desc;
--4.1
select imie,nazwisko from pracownik where imie='Jan';
--4.2
select imie, nazwisko from pracownik where stanowisko='sprzedawca';
--4.3
select imie, nazwisko, pensja from pracownik where pensja>1500 order by pensja desc;
--5.1
select imie, nazwisko, dzial, stanowisko from pracownik where dzial='obsluga klienta' and stanowisko='sprzedawca';
--5.2
select imie, nazwisko, dzial, stanowisko from pracownik where (stanowisko='kierownik' or stanowisko='sprzedawca') and dzial='techniczny';
--5.3
select * from samochod where not marka='fiat' and not marka='ford';
--6.1
select * from samochod where marka in ('Mercedes', 'Seat', 'Opel');
--6.2
select imie, nazwisko, data_zatr from pracownik where imie in ('Anna', 'Marzena', 'Alicja');
--6.3
select imie, nazwisko, miasto from klient where miasto not in ('Warszawa', 'Wrocław');
--7.1
select imie,nazwisko from klient where nazwisko like '%k%';
--7.2
select imie, nazwisko from klient where nazwisko like 'D%SKI';
--7.3
select imie, nazwisko from klient where nazwisko like '_O%' or nazwisko like '_A%';
--8.1
select * from samochod where poj_silnika between 1100 and 1600;
--8.2
select * from pracownik where data_zatr between 1997-01-01 and 1997-12-31;
--8.3
select * from samochod where przebieg between 10000 and 20000 or przebieg between 30000 and 40000;
--9.1
select * from pracownik where dodatek is null;
--9.2
select * from klient where nr_karty_kredyt is not null;
--9.3
select imie, nazwisko, coalesce(dodatek, 0) from pracownik;
