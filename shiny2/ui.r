library(shiny)

shinyUI(fluidPage(
  
  titlePanel(""),
  
  fluidRow(
    
    column(width=7, sliderInput(inputId ="izbleto",label="Izberi leto:", value=1995, min=1995, max=2014,width='500px',
                                animate = animationOptions(interval = 1500, loop = FALSE, playButton = NULL))),
    
    column(width=4,selectInput(inputId="Izbpris",label="Izberi priseljevanje ali odseljevanje:",
                               choices = list("Priseljeni" = "Priseljeni iz tujine", 
                                              "Odseljeni" = "Odseljeni v tujino"), 
                               selected = "Priseljeni iz tujine"))
    
  ),
  
  hr(),
  
  plotOutput(outputId="podrzavljanstvu",width = "700", height = "400px")
))

