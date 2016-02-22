library(shiny)

if ("server.R" %in% dir()) {
  setwd("..")
}
source("lib/libraries.r", encoding = "UTF-8")
source("uvoz/uvoz.r", encoding = "UTF-8")
source("vizualizacija/vizualizacija.r", encoding = "UTF-8")
source("analiza/analiza.r", encoding = "UTF-8")


shinyServer(function(input, output){
  output$grafiregije <- renderPlot({ 
    regijeleto <- razberi(input$izberi,"leto",tabela2)
    ggplot(data=regijeleto,
    aes(regija,"input$izberi2"))+ geom_bar(stat="identity",fill="deeppink3",size=10)+
    coord_flip()

  })
  
})



