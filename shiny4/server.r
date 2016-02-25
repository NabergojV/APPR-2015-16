library(shiny)

if ("server.r" %in% dir()) {
  setwd("..")
}

shinyServer(function(input, output){
  output$regijepike <- renderPlot({
    
    regizberi <- razberi(input$izbreg,"regija",tabela2)
    
    ggplot(data=regizberi,
           aes_string("leto", input$izberikat, alpha=Odseljeni.v.tujino.na.1000.prebivalcev)) + 
                                                  geom_histogram(stat="identity", fill="firebrick3")
    
  })
  
})

