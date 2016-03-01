library(shiny)

if ("server.r" %in% dir()) {
  setwd("..")
}

shinyServer(function(input, output){
  
  obc <- as.character(unique(tabelanapr2$občina))
  obcine$ime <- preuredi(setNames(obc, obc), obcine, "OB_UIME", novi = "Ankaran")
  
  slov <- pretvori.zemljevid(obcine)
  
  output$napzemljevid <- renderPlot({
    
    podatki <- tabelanapr2 %>% filter(leto == input$leto)
    podatki <- podatki[,-2]
    
    podatki.normalizirani <- scale(podatki[c(-1, -2)]) 
    row.names(podatki.normalizirani) <- podatki[,1]
    podatki.na <- apply(podatki.normalizirani, 1, . %>% is.na() %>% all())
    podatki.normalizirani <- podatki.normalizirani[!podatki.na]
    
    k <- kmeans(podatki.normalizirani, 5, nstart = 1000)
    k$tot.withinss
    
    slov$skupina <- factor(k$cluster[slov$ime])
    ggplot(slov, aes(x=long, y=lat, group=group, fill=skupina)) + geom_polygon(color="grey47") +
                  geom_text(data = slov %>% 
                  filter(OB_IME %in% c("LJUBLJANA", "MARIBOR","NOVA GORICA","KOPER","CELJE")),
                  aes(x = Y_C, y = X_C, label = OB_IME), size = 3, vjust = 0, color="black")
  })
  
})