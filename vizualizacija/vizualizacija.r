# 3. faza: Izdelava zemljevida

source("lib/uvozi.zemljevid.r", encoding = "UTF-8")
library(ggplot2)
library(dplyr)

# Uvozimo zemljevid.
zemljevid <- uvozi.zemljevid("http://biogeo.ucdavis.edu/data/gadm2.8/shp/SVN_adm_shp.zip",
                             "SVN_adm1", encoding = "UTF-8")

# Preuredimo podatke, da jih bomo lahko izrisali na zemljevid.
reg2014 <- preuredi(regije2014, zemljevid, "NAME_1")


pretvori.zemljevid <- function(zemljevid) {
  fo <- fortify(zemljevid)
  data <- zemljevid@data
  data$id <- as.character(0:(nrow(data)-1))
  return(inner_join(fo, data, by="id"))
}

#regije:
reg14 <- pretvori.zemljevid(reg2014)

zem.reg2014 <- ggplot() + geom_polygon(data = reg2014, aes(x=long, y=lat, group=group,
                                              fill=Priseljeni.iz.tujine.skupaj),
                               color = "grey") +
  scale_fill_gradient(low="#3F7F3F", high="#00FF00") +
  guides(fill = guide_colorbar(title = "Površina"))
print(zem.reg2014)
