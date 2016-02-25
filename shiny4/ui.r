library(shiny)

shinyUI(fluidPage(
  
  sidebarPanel(
  
  selectInput(inputId="izbreg", label = "Izberi regijo:", 
              choices = list("Goriška" = "Goriška",
                             "Obalno-kraška" = "Obalno-kraška",
                             "Gorenjska" = "Gorenjska",
                             "Notranjsko-kraška" ="Notranjsko-kraška" ,
                             "Osrednjeslovenska" = "Osrednjeslovenska",
                             "Jugovzhodna Slovenija" = "Jugovzhodna Slovenija",
                             "Spodnjeposavska" = "Spodnjeposavska", 
                             "Zasavska" = "Zasavska", 
                             "Savinjska" = "Savinjska", 
                             "Koroška" = "Koroška", 
                             "Podravska" = "Podravska", 
                             "Pomurska" = "Pomurska"), selected = "Goriška"),
  
  selectInput(inputId="izberikat", label = "Izberi kategorijo:", 
              choices = list("Priseljeni iz tujine skupaj" = "Priseljeni.iz.tujine.skupaj", 
                              "Priseljeni iz tujine - ženske" = "Priseljeni.iz.tujine.ženske",
                              "Priseljeni iz tujine - moški" = "Priseljeni.iz.tujine.moški",
                              "Odseljeni v tujino skupaj" = "Odseljeni.v.tujino.skupaj" ,
                              "Odseljeni v tujino - ženske" = "Odseljeni.v.tujino.ženske",
                              "Odseljeni v tujino - moški" = "Odseljeni.v.tujino.moški",
                              "Prirast - skupaj"="prise.min.odse.sku",
                              "Prirast - ženske"="prise.min.odse.z",
                              "Prirast - moški"="prise.min.odse.m"),
                             selected = "Priseljeni.iz.tujine.skupaj"),
  
  helpText("Če izbereš priseljeni iz tujine - skupaj ali odseljeni v tujino - skupaj, lahko v spodnjem okvirčku izbereš še kriterij, ki bo viden s prosojnostjo na zemljevidu."),
  
  
  radioButtons(inputId="pozelji", label="",
              choices = list("Odseljeni v tujino na 1000 prebivalcev"="Odseljeni.v.tujino.na.1000.prebivalcev",
                             "Priseljeni iz tujine na 1000 prebivalcev"="Priseljeni.iz.tujine.na.1000.prebivalcev",
                             "Brez kriterija"="nič"), 
              selected ="nič")),
  
  
  mainPanel(plotOutput(outputId="regijepike"))
  
))

