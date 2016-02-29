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
zemljevid$priseljeni.skupaj <- reg2014$Priseljeni.iz.tujine.skupaj
zemljevid$priseljeni.iz.tujine.na.1000.prebivalcev <-reg2014$Priseljeni.iz.tujine.na.1000.prebivalcev
zemljevid$priseljeni.ženske <- reg2014$Priseljeni.iz.tujine.ženske
zemljevid$priseljeni.moški <- reg2014$Priseljeni.iz.tujine.moški
zemljevid$odseljeni.skupaj <- reg2014$Odseljeni.v.tujino.skupaj
zemljevid$odseljeni.ženske <- reg2014$Odseljeni.v.tujino.ženske
zemljevid$odseljeni.moški <- reg2014$Odseljeni.v.tujino.moški
zemljevid$odseljeni.v.tujino.na.1000.prebivalcev <- reg2014$Odseljeni.v.tujino.na.1000.prebivalcev
zemljevid$prise.min.odse.sku <-zemljevid$priseljeni.skupaj-zemljevid$odseljeni.skupaj
zemljevid$prise.min.odse.z <-zemljevid$priseljeni.ženske-zemljevid$odseljeni.ženske
zemljevid$prise.min.odse.m <-zemljevid$priseljeni.moški-zemljevid$odseljeni.moški

reg14 <- pretvori.zemljevid(zemljevid)

# Zemljevid 1:
zem.reg2014.priseljeni<- ggplot() + geom_polygon(data = reg14, aes(x=long, y=lat, group=group,
                                              fill=priseljeni.skupaj),
                                              color = "grey35") +
                        scale_fill_gradient(low="violetred4", high="violet") +
                        guides(fill = guide_colorbar(title = "Priseljeni iz tujine v letu 2014"))
#print(zem.reg2014.priseljeni)

# Zemljevid 1:
zem.reg2014.priseljeni2 <- ggplot() + geom_polygon(data = reg14, aes(x=long, y=lat, group=group,
                                                  fill=priseljeni.skupaj,
                                                  alpha=priseljeni.iz.tujine.na.1000.prebivalcev),
                                                  color = "grey35") +
                        scale_fill_gradient(low="violetred4", high="violet") +
                        guides(fill = guide_colorbar(title = "Priseljeni iz tujine v letu 2014"))
#print(zem.reg2014.priseljeni2)

# Zemljevid 2:
zem.reg2014.odseljeni <- ggplot() + geom_polygon(data = reg14, aes(x=long, y=lat, group=group,
                                                        fill=odseljeni.skupaj),
                                                        color = "grey35") +
  scale_fill_gradient(low="aquamarine4", high="aquamarine") +
  guides(fill = guide_colorbar(title = "Odseljeni v tujino v letu 2014"))
#print(zem.reg2014.odseljeni)

# Zemljevid 2.2, dodan še alpha:
zem.reg2014.odseljeni2 <- ggplot() + geom_polygon(data = reg14, aes(x=long, y=lat, group=group,
                                                                   fill=odseljeni.skupaj,
                                                                   alpha=odseljeni.iz.tujine.na.1000.prebivalcev),
                                                                   color = "grey35") +
  scale_fill_gradient(low="aquamarine4", high="aquamarine") +
  guides(fill = guide_colorbar(title = "Odseljeni v tujino v letu 2014"))
#print(zem.reg2014.odseljeni2)

# Zemljevid 3: odšteto priseljeni-odseljeni
zem.reg2014.odsteto<- ggplot() + geom_polygon(data = reg14, aes(x=long, y=lat, group=group,
                                                                   fill=prise.min.odse),
                                                 color = "grey35") +
  scale_fill_gradient(low="olivedrab4", high="olivedrab1") +
  guides(fill = guide_colorbar(title = "Priseljeni minus odseljeni v letu 2014"))
#print(zem.reg2014.odsteto)
