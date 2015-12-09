# 2. faza: Uvoz podatkov

# Če bi imeli več funkcij za uvoz in nekaterih npr. še ne bi
# potrebovali v 3. fazi, bi bilo smiselno funkcije dati v svojo
# datoteko, tukaj pa bi klicali tiste, ki jih potrebujemo v
# 2. fazi. Seveda bi morali ustrezno datoteko uvoziti v prihodnjih
# fazah.

#odpremo pakete:
library(dplyr)

#1.tabela: PODATKI O PRESELJEVANJU - STAROSTNE SKUPINE:

#poimenujemo stolpce:

stolpci<-c("priseljeni_ali_odseljeni","starostna_skupina","leto","državljanstvo","skupaj","moški","ženske")

#uvozimo podatke:

uvozi<-function(){
  return(read.csv2(file="podatki/podatki-o-preseljevanju-starostneskupine",
                   skip=4,
                   col.names=stolpci,
                   header=FALSE,
                   fileEncoding = "UTF-8"))
}

tabela<-uvozi()

uredi <- function(tabela, x, y, z, max = nrow(tabela)) {
  s <- seq(x, max, z+1)
  tabela[t(matrix(x:max, ncol=length(s))), y] <- tabela[s, y]
  tabela <- tabela[-s,]
  return(tabela)
}

#uredimo prazna mesta:

tabela <- uredi(tabela, 1, 1, 1539)
tabela <- uredi(tabela, 1, 2, 80)
tabela <- uredi(tabela, 1, 3, 3)


tabela[2:1540,1]<-tabela[1,1]
tabela[1541:length(tabela[,1]),1]<-tabela[1541,1]

#funkcija za preseljene:
uredi<-function(x,y,z){
  while(x<1540){ 
    tabela[x:(x+z),y]<-tabela[x,y]
    x<-x+z+1
  }
  return(tabela)
}

#preseljeni:
#2. stolpec:
tabela<-uredi(2,2,80)

#3. stolpec:
tabela<-uredi(3,3,3)


#funkcija za odseljene:
uredi2<-function(x,y,z){
  while(x<3080){ 
    tabela[x:(x+z),y]<-tabela[x,y]
    x<-x+z+1
  }
  return(tabela)
}

#odseljeni:
#2.stolpec:
tabela<-uredi2(1542,2,80)

#odstranimo vmesne prazne vrstice:
tabela<-tabela[-(1:3),]


#funkcija za prazne vrstice:
briši<-function(x){
  while(x<1540){
    tabela<-tabela[-x,]seq[1,nrow,81]-
    x<-x+81
  }
}
briši(2)

#oblika izpisa:
tabela[,5]<-as.integer(tabela[,5])
tabela[,6]<-as.integer(tabela[,6])
tabela[,7]<-as.integer(tabela[,7])

