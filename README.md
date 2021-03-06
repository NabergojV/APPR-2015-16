# Analiza podatkov s programom R, 2015/16

Avtor: Veronika Nabergoj

Repozitorij z gradivi pri predmetu APPR v študijskem letu 2015/16.

## Tematika: Analiza preseljevanje in izseljevanja

V tem projektu bom raziskala in analizirala priseljevanje in izseljevanje prebivalstva, od leta 1995 do leta 2014, po posameznih regijah Slovenije in po starostnih skupinah. Pregledala bom podatke Slovenije in analizirala v katerih starostnih skupinah in v katerih regiajh je prišlo do porasta preseljevanja. Ločila bom preseljevanje tudi po državljanstvu in tako natančneje določila koliko slovenskih državljanov se je izselilo iz Slovenije ali priselilo nazaj v Slovenijo.

Podatke sem dobila na naslednjih straneh:
* Statistični urad RS: `http://www.stat.si/StatWeb/pregled-podrocja?idp=17&headerbar=15`

Cilji tega projekta so:
* natančnejše vedenje o priseljevanju in izseljevanju v Sloveniji

## Program

Glavni program in poročilo se nahajata v datoteki `projekt.Rmd`. Ko ga prevedemo,
se izvedejo programi, ki ustrezajo drugi, tretji in četrti fazi projekta:

* obdelava, uvoz in čiščenje podatkov: `uvoz/uvoz.r`
* analiza in vizualizacija podatkov: `vizualizacija/vizualizacija.r`
* napredna analiza podatkov: `analiza/analiza.r`

Vnaprej pripravljene funkcije se nahajajo v datotekah v mapi `lib/`. Podatkovni
viri so v mapi `podatki/`. Zemljevidi v obliki SHP, ki jih program pobere, se
shranijo v mapo `../zemljevidi/` (torej izven mape projekta).

## Spletni vmesnik

Spletni vmesnik se nahaja v datotekah v mapi `shiny/`. Poženemo ga tako, da v
RStudiu odpremo datoteko `server.R` ali `ui.R` ter kliknemo na gumb *Run App*.
Alternativno ga lahko poženemo tudi tako, da poženemo program `shiny.r`.

## Potrebni paketi za R

Za zagon tega vzorca je potrebno namestiti sledeče pakete za R:

* `knitr` - za izdelovanje poročila
* `rmarkdown` - za prevajanje poročila v obliki RMarkdown
* `shiny` - za prikaz spletnega vmesnika
* `DT` - za prikaz interaktivne tabele
* `maptools` - za uvoz zemljevidov
* `sp` - za delo z zemljevidi
* `digest` - za zgoščevalne funkcije (uporabljajo se za shranjevanje zemljevidov)
* `httr` - za pobiranje spletnih strani
* `XML` - za branje spletnih strani
* `extrafont` - za pravilen prikaz šumnikov (neobvezno)
