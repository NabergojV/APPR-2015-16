# 4. faza: Analiza podatkov

library(mgcv)
library(RColorBrewer)

## Priseljeni, starost 25-29 let, državljanstvo skupaj, ločeno po spolu:

odseljenezenske <- odseljeni %>% filter(starostna.skupina == "25-29 let") %>% 
                    filter(drzavljanstvo=="Selitve - SKUPAJ")  %>%
                    filter(spol=="Ženske")

leto <-odseljenezenske$leto

#g <- plot(leto, odseljenezenske$stevilka, xlim=c(1995,2020),ylim=c(0,1300),
#    xlab="Leto",ylab="Odseljene zenske",
#    pch=20,col="black",type="p",lwd=1)

loep<-loess(odseljenezenske$stevilka~leto)
#curve(predict(loep, data.frame(leto=x)),add=TRUE,col="slateblue3")

kvadratna<-lm(odseljenezenske$stevilka~I(leto^2)+leto)
#curve(predict(kvadratna, data.frame(leto=x)), add = TRUE, col = "deeppink")

# NAPREDNA ANALIZA z občinami - zemljevid:

obcine <- uvozi.zemljevid("http://e-prostor.gov.si/fileadmin/BREZPLACNI_POD/RPE/OB.zip",
                          "OB/OB", encoding = "Windows-1250")
obcine <- obcine[order(as.character(obcine$OB_UIME)),]

