# 3. faza: Izdelava zemljevida

# Uvozimo zemljevid.
zemljevid <- uvozi.zemljevid("http://biogeo.ucdavis.edu/data/gadm2.8/shp/SVN_adm_shp.zip",
                             "SVN_adm1", encoding = "UTF-8")

# Preuredimo podatke, da jih bomo lahko izrisali na zemljevid.
druzine <- preuredi(druzine, zemljevid, "OB_UIME", c("Ankaran", "Mirna"))


pretvori.zemljevid <- function(zemljevid) {
  fo <- fortify(zemljevid)
  data <- zemljevid@data
  data$id <- as.character(0:(nrow(data)-1))
  return(inner_join(fo, data, by="id"))
}

# 1. Slovenske občine

obcine <- uvozi.zemljevid("http://e-prostor.gov.si/fileadmin/BREZPLACNI_POD/RPE/OB.zip",
                          "OB/OB", encoding = "Windows-1250")
obcine$povrsina <- obcine$POVRSINA / 1000000
ob <- pretvori.zemljevid(obcine)
