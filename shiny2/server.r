library(shiny)

if ("server.r" %in% dir()) {
  setwd("..")
}

shinyServer(function(input, output){
  output$podrzavljanstvu <- renderPlot({
    prialiod<-filter(tabela,priseljeni.ali.odseljeni== input$Izbpris)
    tabelca <-razberi(input$izbleto,"leto",prialiod)
    ggplot(data=tabelca%>%filter(starostna.skupina !="Starostne skupine - SKUPAJ")%>%filter(spol=="Spol - SKUPAJ"),
           aes(starostna.skupina,stevilka))+ geom_bar(stat="identity",fill="seagreen3",size=3) + 
      coord_flip()+ facet_wrap(~ drzavljanstvo)
  })
})
