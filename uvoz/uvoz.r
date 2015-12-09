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

#funkcija za urejanje vrstic:
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

#oblika izpisa:
tabela[,5]<-as.integer(tabela[,5])
tabela[,6]<-as.integer(tabela[,6])
tabela[,7]<-as.integer(tabela[,7])
tabela[,1]<-as.character(tabela[,1])
tabela[,2]<-as.character(tabela[,2])
tabela[,3]<-as.character(tabela[,3])
tabela[,4]<-as.character(tabela[,4])

priseljeni<-data.frame(priseljeni=table("priseljeni_ali_odseljeni"["priseljeni"]),starostna.skupina=tabela[["starostna_skupina"]],leto=tabela[["leto"]],državljanstvo=tabela[["državljanstvo"]])

