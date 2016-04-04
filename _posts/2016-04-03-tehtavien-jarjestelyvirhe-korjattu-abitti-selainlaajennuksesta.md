---
layout:     post
title:      Tehtävien järjestelyvirhe korjattu Abitti-selainlaajennuksesta
subtitle:   Virhe aiheutti ongelmia koetta pisteytettäessä mikäli koelaadinnassa oli järjestetty tehtäviä uudestaan
description: Abitti-koetehtävänlaadintaan liittyvä Chrome-selaimeen laajennuksen koetehtävien uudelleenjärjestelyn virhetilanne on nyt korjattu. 
keywords:   "abitti,digabi,lukio,ylioppilastutkinto,koe,koeviikko"
date:       2016-04-03 14:26:00 +0300
header-background: "#006ED2"
header-img: 2016-04-03.png
light-heading: true
category:   abitti
langcode:   fi
colorbox:   false
---

<p lang="en">(This article is only relevant to Finnish high school teachers and is hence written in Finnish.)</p>

## Taustaa

Jos tiedät jo mikä Abitti-järjestelmä on ja miten se liittyy lukioiden arkeen, <a href="#ohjelmointivirhe">hyppää varsinaiseen asiaan</a>.

### Mikä on Abitti?

[Abitti](http://www.abitti.fi)-järjestelmä on [Ylioppilastutkintolautakunnan](http://www.ylioppilastutkinto.fi) kehittämä ohjelmisto-/järjestelmäkokonaisuus sähköisiin ylioppilaskokeisiin liittyen. Järjestelmä tulee ensimmäistä kertaa käyttöön ylioppilaskirjoituksissa syksyllä 2016.

### Käyttö kurssikokeissa

Pääosin samaa järjestelmää voidaan myös hyödyntää lukioiden (ja miksi ei yläkoulujen ja ammattikoulujenkin) arjessa esimerkiksi koeviikoilla. Hyödyntäminen arjessa on jopa välttämätöntä, sillä ei voi olettaa opiskelijoiden käyttävän järjestelmää ensimmäistä kertaa vasta ylioppilaskoetilanteessa. Kurssikoekäytön näkökulmasta Abitti-kokonaisuuteen kuuluu seuraavat pääosat:

1. AbittiUSB-ohjelma
	1. Laaditaan Linux-pohjaisia USB-käyttöjärjestelmätikkuja.
	2. Koneet käynnistetään koetilanteessa näiltä.
2. [Oma.abitti.fi](https://oma.abitti.fi) -verkkopalvelu
	1. Laaditaan koekysymystiedostot kurssikoekäyttöön.
	2. Arvioidaan/pisteytetään opiskelijoiden kurssikoevastaukset
3. Koeverkko
	- Abitti-koetilapalvelin ja opiskelijoiden koneet, jotka käynnistetään em. kohdan 1.a mukaisilta USB-tikuilta.
	- Tietoliikenneyhteydet em. laitteiden välille; kurssikoekäytössä apuna [Nettiniilo](https://nettiniilo.fi)-laite.

### Opettajien toiveita arkikäyttöön

Koska Ylioppilastutkintolautakunta kehittää Abitti-järjestelmää ensisijaisesti ylioppilaskirjoitusten tarpeiden näkökulmasta, ei järjestelmä tällä hetkellä tarjoa kaikkia opettajien toivomia ominaisuuksia kurssikoekäytön näkökulmasta. Tähän liittyen olen viimeisen vähän yli vuoden kuluessa kehittänyt mm. seuraavat apuvälineet em. kohdan 2.a mukaiseen koekysymyslaadintaan liittyen:

1. [Editori.opetus.tv](http://editori.opetus.tv)
	- Tämä oli ensimmäinen laatimani työkalu alkuvuodesta 2015.
	- Mahdollistaa kuvat, tekstimuotoilut, taulukot, matematiikkakaavat ja lyhyet/datamäärällisesti kevyet ääniraidat Abitti-kurssikokeisiin.
2. [Koekopiointi-bookmarklet](http://nettiniilo.fi/abitti/)
	- Julkaistu 9/2015.
	- Mahdollisti (ja edelleen mahdollistaa) millä tahansa selaimella Abitti-kokeiden kopioinnin yhdellä klikkauksella.
3. [Tweak-A-bitti -selainlaajennus Chrome-selaimelle](https://bit.ly/abitti-chrome)
	1. Julkaistu 11/2015.
	2. Yhdistää kohtien 1-2 ominaisuudet Chrome-selainlaajennukseksi.
	3. Uutena ominaisuutena mahdollisuus muuttaa tehtävien järjestystä koelaadinnassa. 

## Ohjelmointivirhe

Edellä kohdassa 3.c mainittu tehtävien uudelleenjärjestäminen ja siinä laajennuksen versioon v0.0.9 asti ilmennyt ohjelmointivirhe ovat tämän artikkelin varsinainen sisältö.

Kiitos kuuluu YTL:n porukalle asian tutkimisesta ja raportoimisesta. Pahoittelut myös heidän suuntaansa siitä, että heillä kului työaikaa tähän. Toivoisin jatkossa, että mikäli käytät laatimiani Abitti-apuvälineitä ja huomaat jotain epäjohdonmukaisuuksia niin ilmoita asiasta myös minulle, kiitos :)

![Näkymä tehtävien uudelleenjärjestämisestä Tweak-A-bitti -laajennuksella](/img/tweak-a-bitti_jarjesta-kysymykset.png)

### Lyhyesti

[Tweak-A-bitti -selainlaajennuksen](https://bit.ly/abitti-chrome) julkaisusta (versio 0.0.1, julkaistu 21.11.2015) lähtien versioon 0.0.9 saakka tehtävien uudelleenjärjestämistoiminto on ollut rikki. Virhe ilmenee tietyissä tilanteissa niin, ettei opiskelijoiden vastauksia voi pisteyttää kokeen jälkeen.

- Näin varmistat, että Chrome-selaimeesi asentamasi laajennus on päivittänyt:
	1. Kirjoita selaimen osoiteriville: `chrome:extensions`
	2. Paina `Enter`
	3. Tarkista, että versionumero on vähintään 0.0.10.

### Entä jos laajennus ei ole päivittynyt?

- Sulje kaikki Chrome-ikkunat, varmista että nettiyhteys toimii ja avaa Chrome uudestaan.
- Mikäli *Tweak-A-bitti* -laajennuksen versio ei ole vieläkään vähintään 0.0.10:
	1. Valitse *Kehittäjätila* (*Developer mode*) oikealta ylhäältä.
	2. Paina esille tullutta *Päivitä laajennukset nyt* -nappia (*Update extensions now*).
	3. Poista *Kehittäjätila*-valinta.

### Kenen vastuu?

Vastuu on sekä minun; tarkoitus on tietysti että selainlaajennus toimisi kuten kuuluu, mutta koska kyseessä on kuitenkin epävirallinen lisäominaisuus niin *Tweak-A-bitti* -laajennuksen asennussivulla käyttöehdoissa on todettu versiosta 0.0.1 lähtien mm. näin: *"Yhteensopivuutta YTL:n Abitti-järjestelmän kanssa ei voida taata."*

Kuitenkin, mikäli opiskelijoidesi vastaukset jäivät tästä johtuen pisteyttämättä, mikäli YTL purkaa puolestani `answers_kokeennimi.meb` -vastaustiedoston salauksen (itse en teknisesti *voi* sitä tehdä), mikäli olette halukkaita lähettämään salaamattoman vastaustiedoston minulle (ja mikäli tästä kaikesta ei aiheudu juridista ongelmaa henkilötietolain tms. näkökulmasta) niin voin kaivaa opiskelijoidenne vastaukset tiedostosta esille ja lähettää ne takaisin. Pisteytys menisi tällöin "käsipelillä" eikä oma.abitti.fi:n kautta.

## Virheen teknistä taustaa

Tehtävien uudelleenjärjestämiseen liittyvä virhe ilmenee seuraavalla tavalla:

- Mikäli koetta laadittaessa on luonut ja sitten "sopivasti" uudelleenjärjestänyt erityyppisiä tehtäviä (teksti, monivalinta, aukkomonivalinta) niin kokeen jälkeisessä vastausten pisteytyksessä (ks. [*Käyttö kurssikokeissa*](#kytt-kurssikokeissa), kohta 2.b) opiskelijoiden vastaukset ovat mahdollisesti menneet niin ettei niitä ole voinut pisteyttää.

Ongelmaa ei ole esiintynyt mikäli:

- on käyttänyt vain teksti-tyyppisiä tehtäviä,
- ei ole käyttänyt uudelleenjärjestämistoimintoa tai
- on järjestänyt vain ennen ensimmäistäkään monivalintaa tai aukkomonivalintaa mahdollisesti olleita teksti-tyyppisiä tehtäviä keskenään.

Olin tehtävien järjestämiseen liittyvää ominaisuutta ohjelmoidessani olettanut `oma.abitti.fi` -koelaadintapalvelun käsittelevän teknisiä tehtäviin liittyviä ID-tunnisteita niin, että ykköstehtävä olisi ID:ltään nolla (ohjelmoinnissa aloitetaan teknisistä syistä yleensä nollasta), kakkostehtävä ID:ltään ykkönen ja niin edelleen. Tämä pitääkin paikkaansa mikäli käytetään vain teksti-tyyppisiä tehtäviä. Monivalinta- ja aukkomonivalintatehtävätyypeillä tämä oletus ei kuitenkaan päde ja virheellinen oletukseni (ja asian tarkemmatta tutkimisen puute) aikaansaivat virheen.

Ohjelmoinnin opiskelusta kiinnostuneille vinkkinä, että ongelman ratkaisussa tarvitsin [depth-first -rekursiota](https://en.wikipedia.org/wiki/Depth-first_search).

## Loppukaneetti

Eli nyt [laajennus](http://bit.ly/abitti-chrome) on tosiaan päivitetty ja myös tehtävien uudelleenjärjestäminen toimii (lopultakin) oikein. Kiitos ymmärryksestä ja anteeksi virheestä aiheutuneesta vaivasta ja frustraatiosta.

Yt, Janne Cederberg

### Kysyttävää tai kommentoitavaa?

Kerro ajatuksesi alla olevaan kommenttikenttään :)