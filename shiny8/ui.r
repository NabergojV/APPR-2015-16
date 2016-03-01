library(shiny)

shinyUI(fluidPage(
  sidebarLayout(
    
    sidebarPanel(
      
      sliderInput(inputId ="leto",label="Izberi leto:", value=1995, min=1995, max=2014,
                  animate = animationOptions(interval = 15000, loop = FALSE, playButton = NULL))
    ),
    
    mainPanel(
      
      plotOutput(outputId="napzemljevid")
      
    ))
  
))
