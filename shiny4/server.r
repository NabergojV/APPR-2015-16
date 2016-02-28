library(shiny)

if ("server.r" %in% dir()) {
  setwd("..")
}

shinyServer(function(input, output){
  output$regijepike <- renderPlot({
    
    regizberi <- razberi(input$izbreg,"regija",tabela2.2)
    
    if((input$pozelji)=="nič" ) {ggplot(data=regizberi,
                                  aes_string("leto", input$izberikat)) + 
                                  geom_bar(stat="identity", fill = "firebrick3")}
    else{ggplot(data=regizberi,
                aes_string("leto", input$izberikat, alpha= input$pozelji)) + 
        geom_bar(stat="identity", fill = "firebrick3")}
    
  })
  
})

