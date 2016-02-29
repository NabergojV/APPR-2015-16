library(shiny)

shinyUI(fluidPage(
  sidebarLayout(
    
    sidebarPanel(
      
      sliderInput(inputId ="leto",label="Izberi leto:", value=2014, min=1995, max=2014,
                  animate = animationOptions(interval = 1800, loop = FALSE, playButton = NULL))
    ),
    
    mainPanel(
      
      plotOutput(outputId="napzemljevid")
      
    ))
  
))
