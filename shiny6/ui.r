library(shiny)

shinyUI(fluidPage(
  sidebarLayout(
    
    sidebarPanel(
      
      selectInput(inputId="starost", label = "Izberi starostno skupino:", 
                  choices = list("0-4 let" = "0-4 let",
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
                                 "85 + let"="85 + let"), selected = "0-4 let"),
      
      
      radioButtons(inputId="palio",label="Izberi: ",
                  choices = list("Priseljeni" = "Priseljeni iz tujine", 
                                 "Odseljeni" = "Odseljeni v tujino"), 
                  selected = "Priseljeni iz tujine"),
      
      radioButtons(inputId="spol",label="Izberi spol:", 
                   choices = list("Moški" = "Moški", 
                                  "Ženske" = "Ženske",
                                  "Spol - SKUPAJ" ="Spol - SKUPAJ" ),
                   selected = "Moški")
      
    ),
  
  mainPanel(
    
    plotOutput(outputId="naprednaanaliza")
  )
  
)))