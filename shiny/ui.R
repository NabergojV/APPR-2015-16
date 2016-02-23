library(shiny)

shinyUI(fluidPage(
  titlePanel("Graf izbranega leta za izbrane priseljene ali odseljene po spolu"),
  
  sliderInput(inputId ="izberi",label="Izberi leto:", value=1995, min=1995, max=2014),
  
  radioButtons(inputId="izberi2",label="Izberi željeno:", choices = list("Priseljeni iz tujine skupaj" = "Priseljeni.iz.tujine.skupaj", 
                                                                               "Priseljeni iz tujine-ženske" = "Priseljeni.iz.tujine.ženske",
                                                                               "Priseljeni iz tujine-moški" = "Priseljeni.iz.tujine.moški",
                                                                               "Odseljeni v tujino skupaj"="Odseljeni.v.tujino.skupaj" ,
                                                                               "Odseljeni v tujino-ženske"= "Odseljeni.v.tujino.ženske",
                                                                               "Odseljeni v tujino-moški"="Odseljeni.v.tujino.moški" )
                                                                               ,selected = "Priseljeni.iz.tujine.skupaj"),
  plotOutput(outputId="grefiregije")
))          
               





