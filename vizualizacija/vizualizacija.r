# 3. faza: Izdelava zemljevida

source("lib/uvozi.zemljevid.r", encoding = "UTF-8")
library(ggplot2)
library(dplyr)

# Uvozimo zemljevid.
zemljevid <- uvozi.zemljevid("http://biogeo.ucdavis.edu/data/gadm2.8/shp/SVN_adm_shp.zip",
                             "SVN_adm1", encoding = "UTF-8")

# Preuredimo podatke, da jih bomo lahko izrisali na zemljevid.
rownames(regije2014) <- regije2014$regija
reg2014 <- preuredi(regije2014, zemljevid, "NAME_1")


pretvori.zemljevid <- function(zemljevid) {
  fo <- fortify(zemljevid)
  data <- zemljevid@data
  data$id <- as.character(0:(nrow(data)-1))
  return(inner_join(fo, data, by="id"))
}

# Dodani stolpci:
zemljevid$priseljeniskupaj <- reg2014$Priseljeni.iz.tujine.skupaj
zemljevid$priseljeni.iz.tujine.na.1000.prebivalcev <-reg2014$Priseljeni.iz.tujine.na.1000.prebivalcev
reg14 <- pretvori.zemljevid(zemljevid)

# Zemljevid 1:
zem.reg2014 <- ggplot() + geom_polygon(data = reg14, aes(x=long, y=lat, group=group,
                                              fill=priseljeniskupaj,
                                              alpha=priseljeni.iz.tujine.na.1000.prebivalcev),
                                              color = "grey30") +
  scale_fill_gradient(low="violetred4", high="violet") +
  guides(fill = guide_colorbar(title = "Priseljeni iz tujine v letu 2014"))
print(zem.reg2014)

