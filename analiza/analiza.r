# 4. faza: Analiza podatkov

library(mgcv)
library(RColorBrewer)

## Priseljeni, starost 25-29 let, državljanstvo skupaj, ločeno po spolu:

priseljenimoski <- priseljeni %>% filter(starostna.skupina == "25-29 let") %>% 
                    filter(drzavljanstvo=="Selitve - SKUPAJ")  %>%
                    filter(spol=="Moški")

g <- ggplot(priseljenimoski, aes(x=leto, y=stevilka)) + geom_point()
#print(g)

z <- lowess(priseljenimoski$leto, priseljenimoski$stevilka)
z <- g + geom_line(data=as.data.frame(z), aes(x=x, y=y), color="green")
#print(z)

mls <- loess(data = priseljenimoski, stevilka ~ leto)
mls <- g + geom_smooth(method = "loess")
#print(mls)

mgam <- gam(data = priseljenimoski, stevilka ~ s(leto))
mgam <- g + geom_smooth(method = "gam", formula = y ~ s(x))
#print(mgam)

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
                          "OB/OB", encoding = "UTF-8")
obcine <- obcine[order(as.character(obcine$OB_UIME)),]

podatki.normalizirani <- scale(podatki[-1])
names(podatki.normalizirani) <- podatki[,1]
k <- kmeans(podatki.normalizirani, 5)

head(k$cluster, n = 15)
table(k$cluster)

k <- kmeans(podatki.normalizirani, 5)
k$tot.withinss

k <- kmeans(podatki.normalizirani, 5, nstart = 1000)
k$tot.withinss

slovenija <- row.names(podatki)
m <- match(obcine$OB_UIME, slovenija)
obcine$skupina <- factor(k$cluster[slovenija[m]])
slov <- pretvori.zemljevid(obcine)
zemlj <- ggplot(slov, aes(x=long, y=lat, group=group, fill=skupina)) + geom_polygon(color="grey")
print(zemlj)
