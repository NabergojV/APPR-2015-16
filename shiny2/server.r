library(shiny)

if ("server.r" %in% dir()) {
  setwd("..")
}

shinyServer(function(input, output){
  output$podrzavljanstvu <- renderPlot({
    
    prialiod<-filter(tabelc2,priseljeni.ali.odseljeni== input$Izbpris)
    
    tabelc2 <-razberi(input$izbleto,"leto",prialiod)
    
    ggplot(data=tabelc2,
           aes(starostna.skupina,stevilka,fill=spol))+ geom_bar(stat="identity",size=3) + 
      coord_flip()+ facet_wrap(~ drzavljanstvo)
  })
})

