---
layout:     post
title:      Nimihuijaus Abitti-kurssikokeessa
subtitle:   Eli kuinka opiskelijat voivat vastata kokeeseen toistensa nimillä
description: Ylioppilastutkintolautakunnan Abitti-järjestelmää kurssikokeissa käytettäessä opiskelijat voivat melko pienellä vaivalla uskottavasti vastata kokeeseen toistensa nimillä ellei kokeen valvoja ole tarkkana.
keywords:   "ylioppilastutkinto,ytl,abitti,digabi,lukio,koe,kurssikoe,koeviikko,yo-koe,ylioppilaskoe,huijaus,lunttaus,koeviikko,yläkoulu,yläaste"
date:       2016-02-18 13:00:00 +0200
header-img: 2016-02-18.png
header-img-mobile: 2016-02-18_mobile.png
light-heading: true
category:   infosec
langcode:   fi
tags:
  - abitti
  - digabi
colorbox:   false
---

*(This article is only essential for Finnish schools and is hence only available in Finnish.)*

[YTL](http://ylioppilastutkinto.fi):n [Abitti](https://www.abitti.fi)-järjestelmän käyttäminen koulun arjessa ja kurssikokeissa on suotavaa/tärkeää, jotta opiskelijat tottuvat järjestelmän käyttöön ja saavat näin harjoitusta ennen ensimmäisiä sähköisiä ylioppilaskokeita syksyllä 2016.

Ylioppilaskoetilanteessa koejärjestelmään kirjautuminen on tarkasti valvottua ja valvojat varmistavat henkilöllisyystodistuksen ja varmistustunnusten avulla, että kukin opiskelija kirjautuu järjestelmään omalla nimellään. Kuitenkin arkikäytössä koeviikoilla tms. valvontakäytänne on helposti löysempää jo pelkästään ajansäästämissyistä.

Mikäli Abitti-järjestelmää käytetään kurssikokeessa tai muun arvioitavan kurssisuorituksen toteutusalustana ja koetilanteen valvoja ei ole tarkkana, on opiskelijoilla mahdollisuus vastata kokeeseen esim. toistensa nimillä.

HUOM! Alla olevalla videolla kuvattu huijausmahdollisuus jountaa juurensa Internet-selainten normaaleihin ominaisuuksiin. Koska Abitti-järjestelmässä koevastaaminen tehdään selainkäyttöliittymän kautta, ovat selaimen mahdollistamat ominaisuudet (kuten `F12`-napin painamisella aukeava kehittäjätila) käytettävissä:

<iframe width="560" height="315" src="https://www.youtube.com/embed/iGbf1TdIa8w" frameborder="0" allowfullscreen></iframe>
*(Videon äänenlaatu ei ole paras mahdollinen, koska minulla ei ollut kondensaattorimikrofonia mukana nauhoitushetkellä.)*

## Kuinka ongelmalta voi suojautua?

Edellä kuvatulta nimihuijausmahdollisuudelta voi suojautua ainakin seuraavilla tavoilla:

1. Valvo jokaisen opiskelijan kirjautuminen Abitti-koejärjestelmään, ts. tunne jokainen opiskelijasi nimeltä ja naamalta (tai pyydä henkkarit) ja katso että jokainen todella kirjoittaa oman etu- ja sukunimensä koejärjestelmään kirjautuessaan TAI
2. Tarkista opiskelijoiden Abitti-järjestelmään kirjauduttua, että ruudulla näkyvä nimi ja "koneen ääressä oleva naama" täsmäävät:
	- Tarkistaminen tulee tehdä siten, että ennenkuin käyttäjän ruudulla näkyvään nimitietoon luotetaan, on opiskelijan vastauskäyttöliittymä päivitettävä/ladattava uudestaan painamalla näppäimistöltä `F5` tai `Ctrl+R` tai klikkaamalla hiirellä osoiterivin lopussa olevaa "uudelleenlatauskiertonuolta".
3. Opiskelijoille jaetaan jotkut *henkilökohtaiset* varmistusnumerot/-koodit/-tiedot, jotka kukin opiskelija vastaa kokeen ensimmäiseen "kysymykseen" ja opettaja kokeen tarkastus-/pisteytysvaiheessa varmistaa, että kukin opiskelija on syöttänyt hänelle kuuluvan varmistetiedon.
	- Opettaja joutuu tällöin generoimaan tarvittavat tunnisteet itse esim. taulukkolaskentaohjelmalla

## Kuinka koulun laajuinen langaton Abitti-verkko edesauttaa huijaamista

Mikäli koulussa on toteutettu yksi koulun laajuinen Abitti-käyttöön tarkoitettu langaton verkko, on tällä muutamia huomionarvoisia lieveilmiöitä:

1. Koska verkon salasana on käytännössä kaikkialla/kaikille opiskelijoille sama tai sitä ei ole ollenkaan, kuka tahansa opiskelija mistäpäin tahansa verkon kantaman alueelta voi liittyä ko. verkkoon. Tästä seuraa mm. että:
	- Mikäli joku opettaja pitää hyvin saman tyylisen kokeen kahdelle eri ryhmälle vaikkapa peräkkäisinä päivinä, voi kuka tahansa opiskelija käydä katsomassa aiemman kokeen kysymykset vaikka koulun aulassa istuessaan ja kirjoittaa kysymykset itselleen muistiin. Tätä varten opiskelija voi käynnistää Abitti-järjestelmän virtuaalikoneeseen ja halutessaan ottaa esimerkiksi ruudunkaappauskuvia kysymyksistä ja tarkastella mahdollisesti jaettuja oheisaineistoja.
	- Tällaista toimintaa on käytännössä mahdoton estää ellei kokeisiin ole YTL:n toimesta toteutettu opiskelijoille suunnattua koekohtaista liittymissalasanavaatimusta.
2. Opiskelijat voivat vastata toistensa nimillä mistäpäin koulua tahansa elleivät kaikkien samaa koeverkkoa käyttävien kokeiden valvojat ole "hereillä".

## Monen samaa KTP:ta käyttävän Abitti-kokeen koekohtaiset salasanat?

Mikäli YTL toteuttaisi samalta koetilapalvelimelta suoritettavan monen yhtäaikaisen Abitti-kokeen tilanteeseen koekohtaisen salasanavaatimuksen, kaventaisi tämä huijausmahdollisuuksia. YTL:n fokus on kuitenkin ensisijaisesti YO-kokeessa tarvittavissa ominaisuuksissa, joten voi olla ettei tällaista salasanakyselyä toteuteta Abitti-järjestelmän kurssikoekäyttöä varten. Tai sitten totetutetaan.

## Kuinka Nettiniilo-laite pienentää huijausriskiä

Abitti-järjestelmän käytön avuksi tarkoitettu [Nettiniilo](https://nettiniilo.fi)-laite mahdollistaa opiskelijoille Abitti-koetta varten tarjottavan langattoman verkon salasanan muuttamisen hyvin pienellä vaivalla pari minuuttia ennen kokeen alkua.

Jos käytettävän langattoman verkon salasana on juuri vaihdettu ja voimassaoleva salasana kerrottu vain koetilassa oleville opiskelijoille, kaventuvat opiskelijoiden huijaus- ja saman opettajan rinnakkaisryhmän kokeen "tirkistelymahdollisuudet" huomattavasti. Samassa tilassa/kokeessa olevat opiskelijat voivat edelleen vastata toistensa nimillä (ja tämä mahdollisuus on myös kaapeliyhteyksillä Abitti-kurssikoeverkko luotaessa), mutta ongelma on estettävissä esimerkiksi yllä listattujen suojautumisohjeiden kohdan 2 tavalla.

## Kommentteja tai kysyttävää?

Mikäli sinulla on kysyttävää tai en ole mielestäsi maininnut jotain oleellista asiaa tai olen esittänyt jonkun asian mielestäsi virheellisesti, kommentoithan ystävällisesti alle.