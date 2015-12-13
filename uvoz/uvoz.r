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
library(eeptools)
library(labeling)
library(rvest)
library(extrafont)

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

#filtriramo podatke po smeri preseljevanja:
priseljeni<-filter(tabela,priseljeni.ali.odseljeni=="Priseljeni iz tujine")
odseljeni<-filter(tabela,priseljeni.ali.odseljeni=="Odseljeni v tujino")

#funkcija za razbiranje natančnejših tabele:
razberi <- function(x,y,podatki){
  return(podatki[podatki[y] == x, names(podatki) != y])
}

#PRISELJENI:
#po letih:
pri.1995 <- razberi(1995,"leto",priseljeni)
pri.1996 <- razberi(1996,"leto",priseljeni)
pri.1997 <- razberi(1997,"leto",priseljeni)
pri.1998 <- razberi(1998,"leto",priseljeni)
pri.1999 <- razberi(1999,"leto",priseljeni)
pri.2000 <- razberi(2000,"leto",priseljeni)
pri.2001 <- razberi(2001,"leto",priseljeni)
pri.2002 <- razberi(2002,"leto",priseljeni)
pri.2003 <- razberi(2003,"leto",priseljeni)
pri.2004 <- razberi(2004,"leto",priseljeni)
pri.2005 <- razberi(2005,"leto",priseljeni)
pri.2006 <- razberi(2006,"leto",priseljeni)
pri.2007 <- razberi(2007,"leto",priseljeni)
pri.2008 <- razberi(2008,"leto",priseljeni)
pri.2009 <- razberi(2009,"leto",priseljeni)
pri.2010 <- razberi(2010,"leto",priseljeni)
pri.2011 <- razberi(2011,"leto",priseljeni)
pri.2012 <- razberi(2012,"leto",priseljeni)
pri.2013 <- razberi(2013,"leto",priseljeni)
pri.2014 <- razberi(2014,"leto",priseljeni)

# po državljanstvu:
slo.p.1995 <- razberi("Državljani Republike Slovenije","državljanstvo",pri.1995)
slo.p.1996 <- razberi("Državljani Republike Slovenije","državljanstvo",pri.1996)
slo.p.1997 <- razberi("Državljani Republike Slovenije","državljanstvo",pri.1997)
slo.p.1998 <- razberi("Državljani Republike Slovenije","državljanstvo",pri.1998)
slo.p.1999 <- razberi("Državljani Republike Slovenije","državljanstvo",pri.1999)
slo.p.2000 <- razberi("Državljani Republike Slovenije","državljanstvo",pri.2000)
slo.p.2001 <- razberi("Državljani Republike Slovenije","državljanstvo",pri.2001)
slo.p.2002 <- razberi("Državljani Republike Slovenije","državljanstvo",pri.2002)
slo.p.2003 <- razberi("Državljani Republike Slovenije","državljanstvo",pri.2003)
slo.p.2004 <- razberi("Državljani Republike Slovenije","državljanstvo",pri.2004)
slo.p.2005 <- razberi("Državljani Republike Slovenije","državljanstvo",pri.2005)
slo.p.2006 <- razberi("Državljani Republike Slovenije","državljanstvo",pri.2006)
slo.p.2007 <- razberi("Državljani Republike Slovenije","državljanstvo",pri.2007)
slo.p.2008 <- razberi("Državljani Republike Slovenije","državljanstvo",pri.2008)
slo.p.2009 <- razberi("Državljani Republike Slovenije","državljanstvo",pri.2009)
slo.p.2010 <- razberi("Državljani Republike Slovenije","državljanstvo",pri.2010)
slo.p.2011 <- razberi("Državljani Republike Slovenije","državljanstvo",pri.2011)
slo.p.2012 <- razberi("Državljani Republike Slovenije","državljanstvo",pri.2012)
slo.p.2013 <- razberi("Državljani Republike Slovenije","državljanstvo",pri.2013)
slo.p.2014 <- razberi("Državljani Republike Slovenije","državljanstvo",pri.2014)

#ODSELJENI:
#po letih:
ods.1995 <- razberi(1995,"leto",odseljeni)
ods.1996 <- razberi(1996,"leto",odseljeni)
ods.1997 <- razberi(1997,"leto",odseljeni)
ods.1998 <- razberi(1998,"leto",odseljeni)
ods.1999 <- razberi(1999,"leto",odseljeni)
ods.2000 <- razberi(2000,"leto",odseljeni)
ods.2001 <- razberi(2001,"leto",odseljeni)
ods.2002 <- razberi(2002,"leto",odseljeni)
ods.2003 <- razberi(2003,"leto",odseljeni)
ods.2004 <- razberi(2004,"leto",odseljeni)
ods.2005 <- razberi(2005,"leto",odseljeni)
ods.2006 <- razberi(2006,"leto",odseljeni)
ods.2007 <- razberi(2007,"leto",odseljeni)
ods.2008 <- razberi(2008,"leto",odseljeni)
ods.2009 <- razberi(2009,"leto",odseljeni)
ods.2010 <- razberi(2010,"leto",odseljeni)
ods.2011 <- razberi(2011,"leto",odseljeni)
ods.2012 <- razberi(2012,"leto",odseljeni)
ods.2013 <- razberi(2013,"leto",odseljeni)
ods.2014 <- razberi(2014,"leto",odseljeni)

#po državljanstvu:
slo.o.1995 <- razberi("Državljani Republike Slovenije","državljanstvo",ods.1995)
slo.o.1996 <- razberi("Državljani Republike Slovenije","državljanstvo",ods.1996)
slo.o.1997 <- razberi("Državljani Republike Slovenije","državljanstvo",ods.1997)
slo.o.1998 <- razberi("Državljani Republike Slovenije","državljanstvo",ods.1998)
slo.o.1999 <- razberi("Državljani Republike Slovenije","državljanstvo",ods.1999)
slo.o.2000 <- razberi("Državljani Republike Slovenije","državljanstvo",ods.2000)
slo.o.2001 <- razberi("Državljani Republike Slovenije","državljanstvo",ods.2001)
slo.o.2002 <- razberi("Državljani Republike Slovenije","državljanstvo",ods.2002)
slo.o.2003 <- razberi("Državljani Republike Slovenije","državljanstvo",ods.2003)
slo.o.2004 <- razberi("Državljani Republike Slovenije","državljanstvo",ods.2004)
slo.o.2005 <- razberi("Državljani Republike Slovenije","državljanstvo",ods.2005)
slo.o.2006 <- razberi("Državljani Republike Slovenije","državljanstvo",ods.2006)
slo.o.2007 <- razberi("Državljani Republike Slovenije","državljanstvo",ods.2007)
slo.o.2008 <- razberi("Državljani Republike Slovenije","državljanstvo",ods.2008)
slo.o.2009 <- razberi("Državljani Republike Slovenije","državljanstvo",ods.2009)
slo.o.2010 <- razberi("Državljani Republike Slovenije","državljanstvo",ods.2010)
slo.o.2011 <- razberi("Državljani Republike Slovenije","državljanstvo",ods.2011)
slo.o.2012 <- razberi("Državljani Republike Slovenije","državljanstvo",ods.2012)
slo.o.2013 <- razberi("Državljani Republike Slovenije","državljanstvo",ods.2013)
slo.o.2014 <- razberi("Državljani Republike Slovenije","državljanstvo",ods.2014)

#RAZLIKA MED PRISELJENIMI IN ODSELJENIMI (gledano samo državljani Republike Slovenije):
priseljeni.slo <- razberi("Državljani Republike Slovenije","državljanstvo",priseljeni)
odseljeni.slo <- razberi("Državljani Republike Slovenije","državljanstvo",odseljeni)
#moški:
moškipriseljeni <- as.numeric(priseljeni.slo[,5])
moškiodseljeni <- as.numeric(odseljeni.slo[,5])
moškirazlika <- as.numeric(moškipriseljeni-moškiodseljeni) 
#ženske:
ženskepriseljeni <- as.numeric(priseljeni.slo[,6])
ženskeodseljeni <- as.numeric(odseljeni.slo[,6])
ženskerazlika <- as.numeric(ženskepriseljeni-ženskeodseljeni) 
#skupaj:
skupajpriseljeni <- as.numeric(priseljeni.slo[,4])
skupajodseljeni <- as.numeric(odseljeni.slo[,4])
skupajrazlika <- as.numeric(skupajpriseljeni-skupajodseljeni) 


povrsti<-c("pozitiven prirast","ni prirasta","negativen prirast")
prirastskupaj<-factor(rep("ni prirasta",length(skupajrazlika)),
                                    levels=povrsti,ordered=TRUE)
prirastskupaj[skupajrazlika<0] <- "negativen prirast"
prirastskupaj[skupajrazlika>0] <- "pozitiven prirast"

prirastmoški<-factor(rep("ni prirasta",length(moškirazlika)),
                                  levels=povrsti,ordered=TRUE)
prirastmoški[moškirazlika<0] <- "negativen prirast"
prirastmoški[moškirazlika>0] <- "pozitiven prirast"

#tabela razlike priseljenih-odseljenih:
priseljeni.minus.odseljeni <- data.frame(leto=(priseljeni.slo[,2]),
                                         starostna.skupina=priseljeni.slo[,3],
                                         moški.razlika=moškirazlika,
                                         prirast.moški=prirastmoški,
                                         ženske.razlika=ženskerazlika,
                                         razlika.skupaj=skupajrazlika,
                                         prirast.skupaj=prirastskupaj)

priseljeni.minus.odseljeni.order <- priseljeni.minus.odseljeni[order(priseljeni.minus.odseljeni$razlika.skupaj),]

priseljeni.slovenci <- data.frame("leto"=as.numeric(priseljeni.minus.odseljeni [,1]),
                                "starostna.skupina"=as.character(priseljeni.minus.odseljeni [,2]),
                                "razlika skupaj"=as.numeric(priseljeni.minus.odseljeni [,5]))

#graf za negativen prirast slovenskega prebivalstva:
ggplot(data=priseljeni.minus.odseljeni%>%filter(starostna.skupina !="Starostne skupine - SKUPAJ"),
       aes(x=leto, y=razlika.skupaj,color=prirast.skupaj, size=starostna.skupina)) + geom_point()

moški.slovenci.p.m.o<-priseljeni.minus.odseljeni[,-(5:7)]

ggplot(data=moški.slovenci.p.m.o %>% filter(starostna.skupina=="25-29 let"),
       aes(x=leto, fill=moški.razlika,color=prirast.moški)) + geom_bar()

#2.tabela: PRESELJENI V TUJINO-PO REGIJAH:

#uvozimo html:
library(rvest)
html <- file("podatki/preseljevanje-v-tujino-po-regijah") %>% read_html()
tabela2 <- html %>% html_nodes(xpath="//table[1]") %>%
  html_table(fill = TRUE) %>% .[[1]] %>%
  apply(1, function(x) c(x[is.na(x)], x[!is.na(x)])) %>% t()

colnames(tabela2)<- c("regija","leto","Priseljeni iz tujine - Skupaj","Priseljeni iz tujine-moški",
                  "Priseljeni iz tujine-ženske","Odseljeni v tujino-skupaj","Odseljeni v tujino-moški","Odseljeni v tujino-ženske",
                  "Priseljeni iz tujine na 1000 prebivalcev","Odseljeni v tujino na 1000 prebivalcev")

tabela2<-tabela2[-1,]

#funkcija za podvajanje regije:
podvoji<-function(tabela, x, y, z, max = nrow(tabela)){
  s <- seq(x, max, z+1)
  tabela[t(matrix(x:max, ncol=length(s))), y] <- tabela[s, y]
  return(tabela)
}
podvoji<-function(tabela,x,y,z){
  for(i in length(tabela)){
    tabela[x:(x+z),]<-tabela[x,y]
    i<-x+z+1
  }
  return(tabela)
}

podvoji(tabela2,1,1,19)
