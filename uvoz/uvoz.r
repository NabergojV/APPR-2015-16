# 2. faza: Uvoz podatkov

# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.

#odpremo pakete:
library(dplyr)
library(gsubfn)
library(ggplot2)
library(XML)

#1.tabela: PODATKI O PRESELJEVANJU - STAROSTNE SKUPINE:

#poimenujemo stolpce:

stolpci<-c("priseljeni.ali.odseljeni","leto","starostna.skupina","državljanstvo","skupaj","moški","ženske")

#uvozimo podatke:

uvozi<-function(){
  return(read.csv2(file="podatki/podatki-o-preseljevanju-starostneskupine",
                   skip=4,
                   col.names=stolpci,
                   header=FALSE,
                   fileEncoding = "UTF-8"))
}

tabela<-uvozi()

#funkcija za urejanje vrstic:
uredimo <- function(tabela, x, y, z, max = nrow(tabela)) {
  s <- seq(x, max, z+1)
  tabela[t(matrix(x:max, ncol=length(s))), y] <- tabela[s, y]
  tabela <- tabela[-s,]
  return(tabela)
}

#uredimo prazna mesta:
tabela <- uredimo(tabela, 1, 1, 1540)
tabela <- uredimo(tabela, 1, 2, 76)
tabela <- uredimo(tabela, 1, 3, 3)

#oblika izpisa:
tabela[,5]<-as.integer(tabela[,5])
tabela[,6]<-as.integer(tabela[,6])
tabela[,7]<-as.integer(tabela[,7])
tabela[,1]<-as.character(tabela[,1])
tabela[,2]<-as.character(tabela[,2])
tabela[,3]<-as.character(tabela[,3])
tabela[,4]<-as.character(tabela[,4])

#filtriramo podatke po določenih lastnostih:
priseljeni<-filter(tabela,priseljeni.ali.odseljeni=="Priseljeni iz tujine")
odseljeni<-filter(tabela,priseljeni.ali.odseljeni=="Odseljeni v tujino")

#funkcija za razbiranje natančnejših tabele:
razberi <- function(x,y,podatki){
  razberix<-filter(podatki, y==x)
  končna<-razberix[,-y]
  return(končna)
}




#2.tabela: PRESELJENI V TUJINO-PO REGIJAH:

#uvozimo html:
html <- file("podatki/preseljevanje-v-tujino-po-regijah") %>% readLines()

imenastolpcev<-grep("var dataValues",html) %>% 
  strapplyc('var dataValues="(=1>)([a-z]+ )[0-9]+\\w+</TH>$"')%>% .[[1]]

