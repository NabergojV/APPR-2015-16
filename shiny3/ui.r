library(shiny)

shinyUI(fluidPage(
  sidebarLayout(
  
  sidebarPanel(
    
    sliderInput(inputId ="letoizberi",label="Izberi leto:", value=1995, min=1995, max=2014),
    
    selectInput(inputId="priods",label="Izberi željen kriterij:", 
                choices = list("Priseljeni iz tujine skupaj" = "priseljeni.skupaj", 
                               "Priseljeni iz tujine - ženske" = "priseljeni.ženske",
                               "Priseljeni iz tujine - moški" = "priseljeni.moški",
                               "Odseljeni v tujino skupaj"="odseljeni.skupaj" ,
                               "Odseljeni v tujino - ženske"= "odseljeni.ženske",
                               "Odseljeni v tujino - moški"="odseljeni.moški",
                               "Prirast"="priseljeni.minus.odseljeni"),
                                selected = "priseljeni.skupaj"),
  
    helpText("Če izbereš priseljeni iz tujine - skupaj ali odseljeni v tujino - skupaj, lahko v spodnjem okvirčku izbereš še kriterij, ki bo viden s prosojnostjo na zemljevidu."),
    
    selectInput(inputId="prosojnost",label="Izberi želen kriterij:", 
                choices = list("Odseljeni v tujino na 1000 prebivalcev"="odseljeni.v.tujino.na.1000.prebivalcev",
                               "Priseljeni iz tujine na 1000 prebivalcev"="priseljeni.iz.tujine.na.1000.prebivalcev",
                               "Brez kriterija"="nič"), 
                                selected ="nič")
    ),
  
  
      mainPanel(
        
    plotOutput(outputId="zemljevid")
  )
  
)))

