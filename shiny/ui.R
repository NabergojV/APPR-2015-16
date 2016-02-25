library(shiny)

shinyUI(fluidPage(
  
  sidebarLayout(
    
    sidebarPanel(
      
        helpText("Izberi kategorije in za animacijo, ki pokaže pregled čez vsa leta klikni play."),
      
        sliderInput(inputId ="izberi",label="Izberi leto:", value=1995, min=1995, max=2014,
                    animate = animationOptions(interval = 1500, loop = FALSE, playButton = NULL)),
  
        radioButtons(inputId="izb",label="Izberi željeno kategorijo:", 
                    choices = list("Priseljeni iz tujine skupaj" = "Priseljeni.iz.tujine.skupaj", 
                                   "Priseljeni iz tujine - ženske" = "Priseljeni.iz.tujine.ženske",
                                   "Priseljeni iz tujine - moški" = "Priseljeni.iz.tujine.moški",
                                   "Odseljeni v tujino skupaj"="Odseljeni.v.tujino.skupaj" ,
                                   "Odseljeni v tujino - ženske"= "Odseljeni.v.tujino.ženske",
                                   "Odseljeni v tujino - moški"="Odseljeni.v.tujino.moški",
                                   "Prirast - skupaj"="prise.min.odse.sku",
                                   "Prirast - ženske"="prise.min.odse.z",
                                   "Prirast - moški"="prise.min.odse.m"),
                                    selected = "Priseljeni.iz.tujine.skupaj")
    
    ),
  mainPanel(
  plotOutput(outputId="grafiregije")
  )
)))        
               





