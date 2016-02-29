library(shiny)

if ("server.r" %in% dir()) {
  setwd("..")
}

shinyServer(function(input, output){
  
  slov <- pretvori.zemljevid(obcine)
  
  output$napzemljevid <- renderPlot({
    
    podatki <- tabelanapr2 %>% filter(leto == input$leto)
    podatki <- podatki[,-2]
    
    obcine <- uvozi.zemljevid("http://e-prostor.gov.si/fileadmin/BREZPLACNI_POD/RPE/OB.zip",
                              "OB/OB", encoding = "Windows-1250")
    obcine <- obcine[order(as.character(obcine$OB_UIME)),]
    
    podatki.normalizirani <- scale(podatki[-1])
    row.names(podatki.normalizirani) <- podatki[,1]
    k <- kmeans(podatki.normalizirani, 5)
    
#    head(k$cluster, n = 15)
#    table(k$cluster)
    
    k <- kmeans(podatki.normalizirani, 5, nstart = 1000)
    k$tot.withinss
    
    obcine$skupina <- factor(preuredi(k$cluster, obcine, "OB_UIME", novi = "Ankaran"))
    
    ggplot(slov, aes(x=long, y=lat, group=group, fill=skupina)) + geom_polygon(color="grey55")
    
  })
  
})