library(shiny)

if ("server.r" %in% dir()) {
  setwd("..")
}

shinyServer(function(input, output){
  
  output$obratno <- renderPlot({
    
    prod<-filter(tabelc,priseljeni.ali.odseljeni== input$izberipo)
    
    tabelc <-razberi(input$izbstarost,"starostna.skupina",prod)
    
    ggplot(data=tabelc %>%
             group_by_("leto", input$držspol) %>%
             summarise(stevilo = sum(stevilka)),
           aes_string("leto","stevilo",fill=input$držspol))+ 
      geom_bar(stat="identity",size=4)
    
  })
})