# 2. faza: Uvoz podatkov

# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.

##odpremo pakete:
library(dplyr)

#1.tabela: PODATKI O PRESELJEVANJU - STAROSTNE SKUPINE:

##poimenujemo stolpce:

stolpci<-c("priseljeni_ali_odseljeni","starostna_skupina","leto","državljanstvo","skupaj","moški","ženske")

##uvozimo podatke:

uvozi<-function(){
  return(read.csv2(file="podatki/podatki-o-preseljevanju-starostneskupine",
                   skip=4,
                   col.names=stolpci,
                   header=FALSE,
                   fileEncoding = "UTF-8"))
}

tabela<-uvozi()

###uredimo prazna mesta:

####funkcija: 
uredi<-function(x,y,z){
  tabela[x:(x+z), y] <- tabela[x, y]
  return(tabela)
}

for (i in 2:1221){
  tabela[i,1]<-tabela[1,1]
} 

for (i in 1223:2442){
  tabela[i,1]<-tabela[1222,1]
} 

uredi(2,2,60)

uredi(63,2,60)