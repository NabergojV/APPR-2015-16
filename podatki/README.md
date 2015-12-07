# Podatki

Tukaj bomo zbirali vse podatke (datoteke v obliki CSV, XML, ...), ki jih bo naš
program uvozil.

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

for (i in 2:1221){tabela[i,1]<-"Priseljeni iz tujine"} 

for (i in 1223:2442){
tabela[i,1]<-"Odseljeni iz tujine"
} 
                    