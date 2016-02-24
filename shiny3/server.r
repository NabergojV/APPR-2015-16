library(shiny)

if ("server.r" %in% dir()) {
  setwd("..")
}

shinyServer(function(input, output){
  
  output$zemljevid <- renderPlot({
    
    letozem <- razberi(input$letoizberi,"leto",tabela2)
    
    rownames(letozem) <- letozem$regija
    regleto <- preuredi(letozem, zemljevid, "NAME_1")
    
    zeml$priseljeni.skupaj <- regleto$Priseljeni.iz.tujine.skupaj
    zeml$priseljeni.iz.tujine.na.1000.prebivalcev <-regleto$Priseljeni.iz.tujine.na.1000.prebivalcev
    zeml$priseljeni.ženske <- regleto$Priseljeni.iz.tujine.ženske
    zeml$priseljeni.moški <- regleto$Priseljeni.iz.tujine.moški
    zeml$odseljeni.skupaj <- regleto$Odseljeni.v.tujino.skupaj
    zeml$odseljeni.ženske <- regleto$Odseljeni.v.tujino.ženske
    zeml$odseljeni.moški <- regleto$Odseljeni.v.tujino.moški
    zeml$odseljeni.v.tujino.na.1000.prebivalcev <- regleto$Odseljeni.v.tujino.na.1000.prebivalcev
    zeml$priseljeni.minus.odseljeni <-zeml$priseljeni.skupaj-zeml$odseljeni.skupaj
    
    končnipodatki <- pretvori.zemljevid(zeml)
    
    ggplot() + geom_polygon(data = končnipodatki, 
                            aes(x=long, y=lat, group=group,
                            fill=input$priods),
                            color = "grey35") +
                            scale_fill_gradient(low="violetred4", high="violet")
 })
})

