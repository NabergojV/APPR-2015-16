library(shiny)

shinyUI(fluidPage(
  titlePanel("Graf izbranega leta za izbrane priseljene ali odseljene po spolu"),
  
  sidebarLayout(
    
    sidebarPanel(
        sliderInput(inputId ="izberi",label="Izberi leto:", value=1995, min=1995, max=2014,
                    animate = animationOptions(interval = 1500, loop = FALSE, playButton = NULL)),
  
        radioButtons(inputId="izb",label="Izberi željen kriterij:", 
                    choices = list("Priseljeni iz tujine skupaj" = "Priseljeni.iz.tujine.skupaj", 
                                   "Priseljeni iz tujine - ženske" = "Priseljeni.iz.tujine.ženske",
                                   "Priseljeni iz tujine - moški" = "Priseljeni.iz.tujine.moški",
                                   "Odseljeni v tujino skupaj"="Odseljeni.v.tujino.skupaj" ,
                                   "Odseljeni v tujino - ženske"= "Odseljeni.v.tujino.ženske",
                                   "Odseljeni v tujino - moški"="Odseljeni.v.tujino.moški" ),
                                    selected = "Priseljeni.iz.tujine.skupaj"),
    
        helpText("Izberi katergorije in za pregled čez vsa leta klikni play.")
    ),
  mainPanel(
  plotOutput(outputId="grafiregije")
  )
)))        
               





