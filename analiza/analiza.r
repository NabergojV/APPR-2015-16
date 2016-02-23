# 4. faza: Analiza podatkov

library(mgcv)
library(RColorBrewer)

## Priseljeni, starost 25-29 let, državljanstvo skupaj, ločeno po spolu:

priseljenimoski <- priseljeni %>% filter(starostna.skupina == "25-29 let") %>% 
                    filter(državljanstvo=="Selitve - SKUPAJ")  %>%
                    filter(spol=="Moški")

g <- ggplot(priseljenimoski, aes(x=leto, y=stevilka)) + geom_point()
print(g)

z <- lowess(priseljenimoski$leto, priseljenimoski$stevilka)
z <- g + geom_line(data=as.data.frame(z), aes(x=x, y=y), color="green")
print(z)

mls <- loess(data = priseljenimoski, stevilka ~ leto)
mls <- g + geom_smooth(method = "loess")
print(mls)

mgam <- gam(data = priseljenimoski, stevilka ~ s(leto))
mgam <- g + geom_smooth(method = "gam", formula = y ~ s(x))
print(mgam)

# Priseljeni, državljanstvo skupaj, po spolu, po letih:

priseljenispol <- prinapr %>% filter(starostna.skupina == "Starostne skupine - SKUPAJ") %>%
  filter(državljanstvo=="Selitve - SKUPAJ") 

h <- ggplot(priseljenispol, aes(x=zenske, y=moski,color=leto)) + geom_point(size=10)+ 
                            scale_color_distiller(palette = "RdPu")
print(h)

mls2 <- loess(data = priseljenispol, moski ~ zenske)
mls2<- h + geom_smooth(method = "loess",alpha=0.2)
print(mls2)


mgam2 <- gam(data = priseljenispol, moski ~ s(zenske))
mgam2 <- h + geom_smooth(method = "gam", formula = y ~ s(x),alpha=0.2)
print(mgam2)
