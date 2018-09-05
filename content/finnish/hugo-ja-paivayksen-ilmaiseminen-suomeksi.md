---
title: "Hugo ja päiväyksen ilmaiseminen suomeksi"
date: 2018-09-02T00:40:53+03:00
categories:
- Hugo
- go
- web-kehitys
---
>Aina pitää harjoitella (*A.R.*)

*Tervetuloa, hyvä lukija!*  
Tämä on ensimmäinen kirjoitus blogissani, joka tulee käsittelemään niitä informaatiotekniikan aihepiirejä, joita (itse)opiskelen ja harjoitan. Juuri nyt silmiesi edessä oleva sivu on muodostettu [Hugo](https://gohugo.io) -sivustogeneraattorin avulla.<!--more--> 

Staattisia sivustoja kevyesti muotoilluista tekstidokumenteista rakentavalla ohjelmalla on omat etunsa verrattuna raskaaseen, tietokannan vaativaan alustaan. Näistä eduista ehkä lisää joskus myöhemmin. Haastavana puolena o   

Esimerkiksi sivupohjien (templatejen) lokalisointi ja kääntäminen on tehtävä itse. Törmäsin heti alussa kysymykseen, kuinka artikkelin julkaisupäivämäärä näytetään suomalaisessa muodossa. Käyttämässäni teemassa sen oletusmuoto on: "Sun, Sep 2, 2018". Tämähän ei tietenkään käynyt, koska halusin luoda englanninkielisen rinnalle puhtaasti suomenkielisen sivuston. Hugo ei Go-kielen puutteiden vuoksi toistaiseksi tarjoa locale-muuttujaa, jonka *fi-FI* -arvoon asettamalla päivämäärät, kellonajat ynnä muut merkintätavaltaan kielestä riippuvat tiedot muotoiltaisiin suomalaisesti.

(Esimerkkien asetustiedosto on kirjoitettu [TOML](https://github.com/toml-lang/toml)-merkintäkielellä, Hugo tukee myös YAML- ja JSON-tiedostoja.)

{{< highlight toml >}}
# i18n/fi.toml
...
[date]
other = "julkaistu {{ .Date.Format \"2.1.2006\" }}"
[ReadMore]
other = "Lue lisää"
...
{{< /highlight >}}