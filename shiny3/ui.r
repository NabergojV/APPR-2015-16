library(shiny)

shinyUI(fluidPage(
  sidebarLayout(
  
  sidebarPanel(
    sliderInput(inputId ="letoizberi",label="Izberi leto:", value=1995, min=1995, max=2014),
    
    selectInput(inputId="priods",label="Izberi željeno:", 
                choices = list("Priseljeni iz tujine skupaj" = "priseljeni.skupaj", 
                               "Priseljeni iz tujine-ženske" = "priseljeni.ženske",
                               "Priseljeni iz tujine-moški" = "priseljeni.moški",
                               "Odseljeni v tujino skupaj"="odseljeni.skupaj" ,
                               "Odseljeni v tujino-ženske"= "odseljeni.ženske",
                               "Odseljeni v tujino-moški"="odseljeni.moški",
                               "Prirast"="priseljeni.minus.odseljeni"),
                                selected = "priseljeni.skupaj")),
  mainPanel(
    plotOutput(outputId="zemljevid")
  )
  
)))

