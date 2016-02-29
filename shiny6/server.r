library(shiny)

if ("server.r" %in% dir()) {
  setwd("..")
}

shinyServer(function(input, output){
  
  output$naprednaanaliza <- renderPlot({
    
    tabelazapo <- filter(tabela,priseljeni.ali.odseljeni == input$palio)
    
    priseljeniizb <- tabelazapo %>% filter(starostna.skupina == input$starost) %>% 
      filter(drzavljanstvo == input$drzavlj) 
    
    gam <- gam(data = priseljeniizb, stevilka ~ s(leto))
    
    ggplot(priseljeniizb, aes(x=leto, y=stevilka)) + geom_point() +
                            facet_wrap(~spol) +       
                            geom_smooth(method = "gam", formula = y ~ s(x))
    
  })
  
})