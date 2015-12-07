# Podatki

Tukaj bomo zbirali vse podatke (datoteke v obliki CSV, XML, ...), ki jih bo naš
program uvozil.

#1.tabela: PODATKI O PRESELJEVANJU - STAROSTNE SKUPINE:

##poimenujemo stolpce:

stolpci<-c("priseljeni ali odseljeni","starostna-skupina","leto","državljanstvo","skupaj","moški","ženske")

##uvozimo podatke:

uvozi<-function(){
    return(read.csv2(file="podatki/podatki-o-preseljevanju-starostneskupine",
                    skip=4,
                    col.names=stolpci,
                    header=FALSE,
                    fileEncoding = "UTF-8"))
                    }
tabela<-uvozi()             
                    
                    