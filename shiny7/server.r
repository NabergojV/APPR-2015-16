library(shiny)

if ("server.r" %in% dir()) {
  setwd("..")
}

shinyServer(function(input, output){
  
  output$napredna2 <- renderPlot({
    
    tabelazpo <- filter(tabelanapr,priseljeni.ali.odseljeni == input$po)

    končna <- tabelazpo %>% filter(starostna.skupina == input$star) %>%
      filter(drzavljanstvo=="Selitve - SKUPAJ") 
    
    #gam(data = končna, moski ~ s(zenske))  , formula = y ~ s(x)
    loess(data = končna, moski ~ zenske)
    
    ggplot(končna, aes(x=zenske, y=moski, color=leto)) + geom_point(size=10) + 
                          scale_color_distiller(palette = "RdPu") + 
                          geom_smooth(method = "loess",alpha=0.2)
    
  })

})