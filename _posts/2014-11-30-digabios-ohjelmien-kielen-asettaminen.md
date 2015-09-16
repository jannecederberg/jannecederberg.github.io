---
layout:     post
title:      DigabiOS-ohjelmien kielen asettaminen
subtitle:   eli mitä tehdä jos oikoluku on englanniksi?
date:       2014-11-30 12:00:00
header-img: "2014-11-30.png"
---

## Taustaa

Ylioppilastutkintoa sähköistetään ja ensimmäiset sähköiset kokeet pidetään syksyllä 2016. Sähköistymisestä vastaava osio Ylioppilastutkintolautakuntaa on nimeltään [Digabi][digabi]. Kokeet toteutetaan teknisesti käyttäen Ylioppilastutkintolautakunnan rakentamaa kustomoitua Linux-käyttöjärjestelmää sekä hajautettua palvelinratkaisua, johon opiskelijoiden koneet ovat yhteydessä. Mikäli tarkemmat tekniset nyanssit kiinnostavat, 31.10.2014 julkaistu [Sähköisen ylioppilaskokeen järjestämisohje][jarjohje] antaa hyvän peruskäsityksen koejärjestelyiden tietoteknisestä osuudesta.

Digabi-käyttöjärjestelmää eli DigabiOS:ää (eli tuttavallisemmin DOS:ia) voi halutessaan [kokeilla/käyttää][kokeile] myös ihan muuten vaan koulussa, kurssikokeissa tai vain testaillakseen:

- [DigabiOS:n lataus, 64 bit][digabi64] (kokeile ensin tätä)
- [DigabiOS:n lataus, 32 bit][digabi32]
- [MEBDD][mebdd] – Ohjelma, jolla em. levykuvatiedosto kirjoitetaan muistitikulle.

Digabi-käyttöjärjestelmää käytetään siis käynnistämällä kone muistitikulta ko. käyttöjärjestelmään. Mikäli virtuaalikoneet ovat tuttuja, voit myös käyttää DigabiOS:ää esim. [VirtualBox][vb]illa tai [VMWare Player][vmplayer]illa.

## Ongelma

Kirjoitushetkellä viimeisin julkaistu DigabiOS (versio: digabi-os-14.08a1) sisältää sellaisen puutteen, että kun käyttöjärjestelmän käynnistää, ovat ohjelmien kieli- ja lokalisaatioasetukset englanninkielisissä/amerikkalaisissa asetuksissa. Käyttöliittymän kielen osalta ongelma ei ole niinkään suuri, mutta esimerkiksi taulukkolaskentaohjelman komentojen kieli, rahayksiköt, desimaalierotin ja pituusmitat ovat vähän hankalasti suomalaisella käyttäjälle.

## Ratkaisu

Kirjoitin pienen apuvälineen, jota voi käyttää ainakin toistaiseksi mikäli kokee toistuvan asetusten säädön ongelmaksi. Tämä työkalu asettaa kieli- ja lokalisaatioasetukset tällä hetkellä seuraavista ohjelmista: LibreOffice, GIMP, Inkscape ja Pinta. Lyhyimmillään työkalun käyttö menee näin:

1. Käynnistä Digabi-käyttöjärjestelmä ja tee seuraavat vaiheet siinä:
2. Kopioi (<kbd>Ctrl+C</kbd>) seuraava komento leikepöydälle:
	- `wget -O - https://bit.ly/digabi-app-settings | bash`
4. Avaa Terminator päävalikosta
5. Liitä kohdassa 2 kopioitu teksti Terminator-ikkunaan:
	- klikkaa hiiren oikeaa nappia ja valitse <kbd>Paste</kbd>
	- TAI paina <kbd>Shift+Insert</kbd>
5. Paina <kbd>Enter</kbd>

## Tekniikasta kiinnostuneille

Mikäli olet kiinnostunut siitä kuinka ko. työkalu on teknisesti toteutettu, tsekkaa koodi [GitHub-palvelusta][github].

May the DigabiOS be with you.

[digabi]: https://digabi.fi/
[jarjohje]: https://digabi.fi/wordpress/wp-content/uploads/2014/10/ytl_jarjestamisohje_2014-10-31.pdf
[kokeile]: https://digabi.fi/tekniikka/digabi-os/kokeile/
[digabi64]: https://digabi.fi/64bit
[digabi32]: https://digabi.fi/32bit
[mebdd]: https://digabi.fi/mebdd
[vb]: https://www.virtualbox.org/
[vmplayer]: http://www.vmware.com/products/player
[github]: https://github.com/jannecederberg/digabi-app-settings