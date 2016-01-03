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

stolpci<-c("priseljeni.ali.odseljeni","leto","starostna.skupina","državljanstvo","spol","stevilka")

#uvozimo podatke:

uvozi<-function(){
  return(read.csv2(file="podatki/podatki-o-preseljevanju-starostneskupine",
                   skip=3,
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
tabela <- uredimo(tabela, 1, 1, 4960)
tabela <- uredimo(tabela, 1, 2, 247)
tabela <- uredimo(tabela, 1, 3, 12)
tabela <- uredimo(tabela, 1, 4, 3)

#oblika izpisa:
tabela[,5]<-as.character(tabela[,5])
tabela[,6]<-as.integer(tabela[,6])
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



#TIDY DATA oblika:
tidytabela <- tabela %>% filter(starostna.skupina != "Starostne skupine - SKUPAJ") %>% 
  filter(državljanstvo != "Selitve - SKUPAJ") %>%
  filter(spol != "Spol - SKUPAJ")




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

##razlika:
razlika.slo <- as.numeric(priseljeni.slo[,5]-odseljeni.slo[,5])

##prirast:
povrsti<-c("pozitiven","ga ni","negativen")
prirastslo<-factor(rep("ga ni",length(razlika.slo)),
                                    levels=povrsti,ordered=TRUE)
prirastslo[razlika.slo<0] <- "negativen"
prirastslo[razlika.slo>0] <- "pozitiven"
prirastslo[razlika.slo==0] <- "ga ni"

#tabela razlike priseljenih-odseljenih:
priseljeni.minus.odseljeni <- data.frame(leto=(priseljeni.slo[,2]),
                                         starostna.skupina=priseljeni.slo[,3],
                                         spol=priseljeni.slo[,4],
                                         razlika=razlika.slo,
                                         prirast=prirastslo)

priseljeni.minus.odseljeni.order <- priseljeni.minus.odseljeni[order(priseljeni.minus.odseljeni$razlika),]

priseljeni.slovenci <- data.frame("leto"=as.numeric(priseljeni.minus.odseljeni [,1]),
                                "starostna.skupina"=as.character(priseljeni.minus.odseljeni [,2]),
                                "razlika skupaj"=as.numeric(priseljeni.minus.odseljeni [,5]))

#graf za negativen prirast slovenskega prebivalstva:
ggplot(data=priseljeni.minus.odseljeni%>%filter(starostna.skupina !="Starostne skupine - SKUPAJ"),
       aes(x=leto, y=razlika,color=starostna.skupina)) + geom_point(size=6) +
       coord_flip() 

#graf za odseljene prebivalce leta 2014 po državljanstvu in vsi skupaj:
ggplot(data=ods.2014%>%filter(starostna.skupina !="Starostne skupine - SKUPAJ")%>%filter(spol=="Spol - SKUPAJ"),
       aes(starostna.skupina,stevilka))+ geom_bar(stat="identity",fill="seagreen3",size=3) + 
       coord_flip()+ facet_wrap(~ državljanstvo)

odseljeni2 <- filter(odseljeni,starostna.skupina =="Starostne skupine - SKUPAJ")
odseljeni3 <- filter(odseljeni2,spol != "Spol - SKUPAJ")
odseljeni4 <- filter(odseljeni3,državljanstvo =="Selitve - SKUPAJ")

maxodseljeni <- sort(filter(odseljeni4,"stevilka">0),"stevilka",decreasing = TRUE)

#graf za odseljene prebivalce po starostnih skupinah skupaj in državljanstvu skupaj:
ggplot(data=odseljeni4,
       aes(leto,stevilka,fill=spol))+ geom_bar(stat="identity",size=6) + coord_flip()

odseljeni5 <- filter(odseljeni3,državljanstvo!="Selitve - SKUPAJ")

#graf za odseljene prebivalce po starostnih skupinah skupaj in spolu:
ggplot(data=odseljeni5,
       aes(leto,stevilka,fill=spol))+ geom_bar(stat="identity",size=6) + coord_flip()+
       facet_wrap(~ državljanstvo)





#2.tabela: PRESELJENI V TUJINO-PO REGIJAH:

#uvozimo html:
library(rvest)
html <- file("podatki/preseljevanje-v-tujino-po-regijah") %>% read_html(encoding = "UTF-8")
tabela2 <- html %>% html_nodes(xpath="//table[1]") %>%
  html_table(fill = TRUE) %>% .[[1]] %>%
  apply(1, function(x) c(x[is.na(x)], x[!is.na(x)])) %>% t() %>% data.frame(stringsAsFactors = FALSE)

colnames(tabela2)<- c("regija","leto","Priseljeni.iz.tujine.skupaj","Priseljeni.iz.tujine.moški",
                  "Priseljeni.iz.tujine.ženske","Odseljeni.v.tujino.skupaj","Odseljeni.v.tujino.moški","Odseljeni.v.tujino.ženske",
                  "Priseljeni.iz.tujine.na.1000.prebivalcev","Odseljeni.v.tujino.na.1000.prebivalcev")

#uredimo šumnike:
Encoding(tabela2[,"regija"]) <- "UTF-8"

#znebimo se določenih vrstic:
tabela2<-tabela2[-1,]
tabela2<-tabela2[-241,]

#funkcija za podvajanje regije:
podvoji<-function(tab, x, y, z, max = nrow(tab)){
  s <- seq(x, max, z+1)
  tab[t(matrix(x:max, ncol=length(s))), y] <- tab[s, y]
  return(tab)
}

#uredimo prazna mesta:
tabela2<-podvoji(tabela2,1,1,19)

#oblika izpisa:
tabela2[2:10]<-apply(tabela2[2:10], 2, as.numeric)

#tabele:
regije2014 <- razberi(2014,"leto",tabela2)
Goriska <- razberi("Goriška","regija",tabela2)

#graf za leto 2014 za vse regije, priseljeni skupaj:
ggplot(data=regije2014,
       aes(regija,Priseljeni.iz.tujine.skupaj))+ geom_bar(stat="identity",fill="deeppink3",size=10)+
       coord_flip() 

#graf za odseljene v tujino za regijo Goriška:
ggplot(data=Goriska,
       aes(x=leto, y=Odseljeni.v.tujino.skupaj,alpha=Odseljeni.v.tujino.na.1000.prebivalcev)) + 
       geom_point(size=10,color="firebrick3")




#zemljevidi:
source("lib/uvozi.zemljevid.r", encoding = "UTF-8")

pretvori.zemljevid <- function(zemljevid) {
  fo <- fortify(zemljevid)
  data <- zemljevid@data
  data$id <- as.character(0:(nrow(data)-1))
  return(inner_join(fo, data, by="id"))
}

# 1. Slovenske občine

obcine <- uvozi.zemljevid("http://e-prostor.gov.si/fileadmin/BREZPLACNI_POD/RPE/OB.zip",
                          "OB/OB", encoding = "Windows-1250")
obcine$povrsina <- obcine$POVRSINA / 1000000
ob <- pretvori.zemljevid(obcine)