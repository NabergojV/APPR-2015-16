library(shiny)

if ("server.r" %in% dir()) {
  setwd("..")
}

shinyServer(function(input, output){
  
  output$naprednaanliza <- renderPlot({
    
    priseljeniizb <- input$palio %>% filter(starostna.skupina == input$starost) %>% 
      filter(drzavljanstvo=="Selitve - SKUPAJ")  %>%
      filter(spol== input$spol)
    
    gam <- gam(data = priseljeniizb, stevilka ~ s(leto))
    
    ggplot(priseljeniizb, aes(x=leto, y=stevilka)) + geom_point() +
            geom_smooth(method = "gam", formula = y ~ s(x))
    
  })
  
})