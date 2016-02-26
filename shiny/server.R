library(shiny)

if ("server.R" %in% dir()) {
  setwd("..")
}

shinyServer(function(input, output){
  output$grafiregije <- renderPlot({
    
    regijeleto <- razberi(input$izberi,"leto",tabela2.2)
    
    podatek <-input$izb
    
    reg1 <- subset(regijeleto,podatek >= 0)
    reg2 <- subset(regijeleto,podatek < 0)
    
    ggplot()+ 
      geom_bar(data=reg1,aes_string("regija", podatek), 
               stat="identity",fill="deeppink3",size=10)+
      geom_bar(data=reg2,aes_string("regija", podatek), 
               stat="identity",fill="deeppink3",size=10)+
      coord_flip()

  })
})



