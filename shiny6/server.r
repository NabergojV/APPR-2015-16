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
    
    kv <- lm(data = priseljeniizb, stevilka ~  leto + I(leto^2))
    
    ggplot(priseljeniizb, aes(x=leto, y=stevilka)) + geom_point() +
                            facet_wrap(~spol) +       
                            geom_smooth(method = "gam", formula = y ~ s(x)) +
                            geom_smooth(method = "lm", formula = y ~ x + I(x^2), 
                                        color="firebrick3", alpha=0.2, fill = "indianred3")
    
  })
  
})