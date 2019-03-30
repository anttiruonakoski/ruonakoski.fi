---
title: "Hugo ja päiväyksen ilmaiseminen suomeksi"
date: 2018-09-02T00:40:53+03:00
draft: true
comments: true
topics:
- Hugo
- Go
- Web-kehitys
---
*Tervetuloa, hyvä lukija!*  

Tämä on ensimmäinen kirjoitus blogissani, joka tulee käsittelemään niitä informaatiotekniikan aihepiirejä, joita harjoitan ja (itse)opiskelen. Juuri nyt silmiesi edessä oleva sivu on muodostettu [Hugo](https://gohugo.io) -sivustogeneraattorin avulla.<!--more--> 

Staattisia sivustoja kevyesti muotoilluista tekstidokumenteista rakentavalla ohjelmalla on omat, merkittävät etunsa verrattuna raskaaseen, tietokannan vaativaan julkaisualustaan. Hyötypuolista ehkä lisää toisessa artikkelissa. Sivuston luomisessa ja mukauttamisessa pitää kuitenkin nähdä erityyppistä vaivaa. Koodausta tarvitaan enemmän tai vähemmän.       

>Aina pitää harjoitella (*A.R.*) 

Esimerkiksi Hugon kanssa pelatessa sivupohjat (templatet) on lokalisoitava ja käännettävä itse. Törmäsin heti alussa kysymykseen, kuinka artikkelin julkaisupäivämäärä näytetään suomalaisessa muodossa. Käyttämässäni teemassa sen oletusmuoto on: "Sun, Sep 2, 2018". Tämähän ei tietenkään käynyt, koska halusin luoda englanninkielisen rinnalle puhtaasti suomenkielisen sivuston. Hugo ei Go-kielen puutteiden vuoksi toistaiseksi tarjoa locale-muuttujaa, jonka *fi-FI* -arvoon asettamalla päivämäärät, kellonajat ynnä muut merkintätavaltaan kielestä riippuvat tiedot muotoiltaisiin suomalaisesti.

Hugon sivupohjiin on tarkoitus kirjoittaa Go-kielellä fragmentteja? DateTime-tietotyypin tulostusmuotoilu on Go:ssa tehty jännittävästi. Format-funktion parametrinä toimii esimerkki kaivatusta muodosta. Esimerkin aika on seisautettu hetkeen kello 15:40 toinen päivä tammikuuta vuonna 2006.

(Asetukset on kirjoitettu [TOML](https://github.com/toml-lang/toml)-merkintäkielellä, Hugo tukee myös YAML- ja JSON-tiedostoja.)

{{< highlight toml >}}
# i18n/fi.toml
[date]
other = "julkaistu {{ .Date.Format \"2.1.2006\" }}"
{{< /highlight >}}

{{< highlight toml >}}
# i18n/en.toml
[date]
other = "published {{ .Date.Format \"Mon, Jan 2, 2006\" }}"
{{< /highlight >}}

Vastaava pätkä sivupohjan templatessa on alla. Siitä voi lisäksi huomioida, kuinka sivua koskevat muuttujat välitetään pisteen kautta eteenpäin eli tässä tapauksessa lokalisointifunktiolle.
 
{{< highlight md >}}
<span class="post-date">{{ i18n "date" . }}</span>
{{< /highlight >}}
