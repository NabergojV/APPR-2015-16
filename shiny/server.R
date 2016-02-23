library(shiny)

if ("server.R" %in% dir()) {
  setwd("..")
}

shinyServer(function(input, output){
  output$grafiregije <- renderPlot({
    title <- "Graf za leto : "
    regijeleto <- razberi(input$izberi,"leto",tabela2)
    podatek <-input$izb
    ggplot(data=regijeleto,aes_string("regija", podatek))+ 
      geom_bar(stat="identity",fill="deeppink3",size=10)+
      coord_flip()

  })
})



