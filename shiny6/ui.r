library(shiny)

shinyUI(fluidPage(
  sidebarLayout(
    
    sidebarPanel(
      
      selectInput(inputId="starost", label = "Izberi starostno skupino:", 
                  choices = list("Starostne skupine - SKUPAJ" = "Starostne skupine - SKUPAJ",
                                 "0-4 let" = "0-4 let",
                                 "5-9 let" = "5-9 let",
                                 "10-14 let" = "10-14 let",
                                 "15-19 let" ="15-19 let" ,
                                 "20-24 let" = "20-24 let",
                                 "25-29 let" = "25-29 let",
                                 "30-34 let" = "30-34 let", 
                                 "35-39 let" = "35-39 let", 
                                 "40-44 let" = "40-44 let", 
                                 "45-49 let" = "45-49 let", 
                                 "50-54 let" = "50-54 let", 
                                 "55-59 let" = "55-59 let",
                                 "60-64 let"="60-64 let",
                                 "65-69 let"="65-69 let",
                                 "70-74 let"="70-74 let",
                                 "75-79 let"="75-79 let",
                                 "80-84 let"="80-84 let",
                                 "85 + let"="85 + let"), selected = "Starostne skupine - SKUPAJ"),
      
      
      radioButtons(inputId="palio",label="Izberi: ",
                  choices = list("Priseljeni" = "Priseljeni iz tujine", 
                                 "Odseljeni" = "Odseljeni v tujino"), 
                  selected = "Priseljeni iz tujine"),
      
      radioButtons(inputId="drzavlj",label="Izberi državljanstvo:", 
                   choices = list("Državljani Republike Slovenije" = "Državljani Republike Slovenije", 
                                  "Tuji državljani" = "Tuji državljani",
                                  "Selitve - SKUPAJ" ="Selitve - SKUPAJ" ),
                   selected = "Selitve - SKUPAJ"),
      
      helpText("Rdeča krivulja je kvadratna metoda,", 
               "modra pa je metoda loess.")
      
    ),
  
  mainPanel(
    
    plotOutput(outputId="naprednaanaliza")
  )
  
)))