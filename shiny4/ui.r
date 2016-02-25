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
                              "Odseljeni v tujino - moški" = "Odseljeni.v.tujino.moški"),
                             selected = "Priseljeni.iz.tujine.skupaj")),
  
  
  mainPanel(plotOutput(outputId="regijepike"))
  
))

