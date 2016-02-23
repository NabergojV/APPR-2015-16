library(shiny)

if ("server.R" %in% dir()) {
  setwd("..")
}

shinyServer(function(input, output){
  output$grafiregije <- renderPlot({
    title <- "Graf"
    regijeleto <- razberi(input$izberi,"leto",tabela2)
    ggplot(data=regijeleto,
    aes(regija,input$izberi2))+ geom_bar(stat="identity",fill="deeppink3",size=10)+
    coord_flip()

  })
  
})



