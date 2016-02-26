library(shiny)

shinyUI(fluidPage(
  sidebarLayout(
  
  sidebarPanel(
    
    sliderInput(inputId ="letoizberi",label="Izberi leto:", value=1995, min=1995, max=2014,
                animate = animationOptions(interval = 1500, loop = FALSE, playButton = NULL)),
    
    selectInput(inputId="priods",label="Izberi željeno kategorijo:", 
                choices = list("Priseljeni iz tujine skupaj" = "priseljeni.skupaj", 
                               "Priseljeni iz tujine - ženske" = "priseljeni.ženske",
                               "Priseljeni iz tujine - moški" = "priseljeni.moški",
                               "Odseljeni v tujino skupaj"="odseljeni.skupaj" ,
                               "Odseljeni v tujino - ženske"= "odseljeni.ženske",
                               "Odseljeni v tujino - moški"="odseljeni.moški",
                               "Prirast - skupaj"="prise.min.odse.sku",
                               "Prirast - ženske"="prise.min.odse.z",
                               "Prirast - moški"="prise.min.odse.m"),
                                selected = "priseljeni.skupaj"),
  
    helpText("Če izbereš priseljeni iz tujine - skupaj ali odseljeni v tujino - skupaj, lahko v spodnjem okvirčku izbereš še kriterij, ki bo viden s prosojnostjo na zemljevidu."),
    
    radioButtons(inputId="prosojnost",label="Izberi željen kriterij:", 
                choices = list("Odseljeni v tujino na 1000 prebivalcev"="odseljeni.v.tujino.na.1000.prebivalcev",
                               "Priseljeni iz tujine na 1000 prebivalcev"="priseljeni.iz.tujine.na.1000.prebivalcev",
                               "Brez kriterija"="nič"), 
                                selected ="nič")
    ),
  
  
      mainPanel(
        
    plotOutput(outputId="zemljevid")
  )
  
)))

