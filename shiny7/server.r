library(shiny)

if ("server.r" %in% dir()) {
  setwd("..")
}

shinyServer(function(input, output){
  
  output$napredna2 <- renderPlot({
    
    tabelazpo <- filter(tabelazan,priseljeni.ali.odseljeni == input$po)

    končna <- tabelazpo %>% filter(starostna.skupina == input$star) 
    
    loess(data = končna, moski ~ zenske)
    
    kv <- lm(data = končna, moski ~ zenske + I(zenske^2))

    ggplot(končna, aes(x=zenske, y=moski, color=leto)) + geom_point(size=10) + 
                          scale_color_distiller(palette = "RdPu") + 
                          geom_smooth(method = "loess",alpha=0.2)+ 
                          geom_smooth(method = "lm", formula = y ~ x + I(x^2), 
                                      color="firebrick3", alpha=0)
    
  })

})