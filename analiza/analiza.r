# 4. faza: Analiza podatkov

library(mgcv)
library(RColorBrewer)

## Priseljeni, starost 25-29 let, državljanstvo skupaj, ločeno po spolu:

priseljenimoski <- priseljeni %>% filter(starostna.skupina == "25-29 let") %>% 
                    filter(drzavljanstvo=="Selitve - SKUPAJ")  %>%
                    filter(spol=="Moški")

leto <-priseljenimoski$leto

g <- plot(leto, priseljenimoski$stevilka, xlim=c(1995,2020),ylim=c(-1000,4000),
     xlab="Leto",ylab="priseljeni moški",
     pch=20,col="lightblue",type="p",lwd=3.5)
print(g)

loep<-loess(priseljenimoski$stevilka~leto)
curve(predict(loep, data.frame(leto=x)),add=TRUE,col="blue")


g <- ggplot(priseljenimoski, aes(x=leto, y=stevilka)) + geom_point()
#print(g)

z <- lowess(priseljenimoski$leto, priseljenimoski$stevilka)
z <- g + geom_line(data=as.data.frame(z), aes(x=x, y=y), color="green")
print(z)

kv <- lm(data = priseljenimoski, stevilka ~ leto + I(leto^2))
kv <- g + geom_smooth(method = "lm", formula = y ~ x + I(x^2))
print(kv) 

mls <- loess(data = priseljenimoski, stevilka ~ leto)
mls <- g + geom_smooth(method = "loess")
print(mls)

mgam <- gam(data = priseljenimoski, stevilka ~ s(leto))
mgam <- g + geom_smooth(method = "gam", formula = y ~ s(x))
print(mgam)

sapply(list(kv,mls, mgam), function(x) sum(x$residuals^2))


# Priseljeni, državljanstvo skupaj, po spolu, po letih:

priseljenispol <- prinapr %>% filter(starostna.skupina == "Starostne skupine - SKUPAJ") %>%
  filter(drzavljanstvo=="Selitve - SKUPAJ") 

h <- ggplot(priseljenispol, aes(x=zenske, y=moski, color=leto)) + geom_point(size=10)+ 
                            scale_color_distiller(palette = "RdPu")
#print(h)

mls2 <- loess(data = priseljenispol, moski ~ zenske)
mls2<- h + geom_smooth(method = "loess",alpha=0.2)
#print(mls2)

mgam2 <- gam(data = priseljenispol, moski ~ s(zenske))
mgam2 <- h + geom_smooth(method = "gam", formula = y ~ s(x),alpha=0.2)
#print(mgam2)


# NAPREDNA ANALIZA z občinami:

podatki <- tabelanapr2 %>% filter(leto==2014)
podatki <- podatki[,-2]

obcine <- uvozi.zemljevid("http://e-prostor.gov.si/fileadmin/BREZPLACNI_POD/RPE/OB.zip",
                          "OB/OB", encoding = "Windows-1250")
obcine <- obcine[order(as.character(obcine$OB_UIME)),]

podatki.normalizirani <- scale(podatki[-1])
row.names(podatki.normalizirani) <- podatki[,1]
k <- kmeans(podatki.normalizirani, 5)

head(k$cluster, n = 15)
table(k$cluster)

k <- kmeans(podatki.normalizirani, 5, nstart = 1000)
k$tot.withinss

obcine$skupina <- factor(preuredi(k$cluster, obcine, "OB_UIME", novi = "Ankaran"))
slov <- pretvori.zemljevid(obcine)
zemlj <- ggplot(slov, aes(x=long, y=lat, group=group, fill=skupina)) + geom_polygon(color="grey55")
#print(zemlj)

