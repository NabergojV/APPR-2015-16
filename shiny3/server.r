library(shiny)

if ("server.r" %in% dir()) {
  setwd("..")
}

shinyServer(function(input, output){
  zeml <- pretvori.zemljevid(zemljevid)
  
  output$zemljevid <- renderPlot({
    
    letozem <- razberi(input$letoizberi,"leto",tabela2)
    
    končnipodatki <- letozem %>%
      right_join(zeml, by = c("regija" = "NAME_1")) %>%
      rename(priseljeni.skupaj = Priseljeni.iz.tujine.skupaj,
             priseljeni.iz.tujine.na.1000.prebivalcev = Priseljeni.iz.tujine.na.1000.prebivalcev,
             priseljeni.ženske = Priseljeni.iz.tujine.ženske,
             priseljeni.moški = Priseljeni.iz.tujine.moški,
             odseljeni.skupaj = Odseljeni.v.tujino.skupaj,
             odseljeni.ženske = Odseljeni.v.tujino.ženske,
             odseljeni.moški = Odseljeni.v.tujino.moški,
             odseljeni.v.tujino.na.1000.prebivalcev = Odseljeni.v.tujino.na.1000.prebivalcev)
    zeml$prise.min.odse.sku <-zeml$priseljeni.skupaj-zeml$odseljeni.skupaj
    zeml$prise.min.odse.z <-zeml$priseljeni.ženske-zeml$odseljeni.ženske
    zeml$prise.min.odse.m <-zeml$priseljeni.moški-zeml$odseljeni.moški
    
    
    if((input$prosojnost)=="nič" ) {ggplot() + geom_polygon(data = končnipodatki, 
                                                                        aes_string(x="long", y="lat",
                                                                                  group="group",
                                                                                  fill=input$priods),
                                                                                  color = "grey35") +
                                                          scale_fill_gradient(low="aquamarine4", high="aquamarine")}
    else{ggplot() + geom_polygon(data = končnipodatki, 
                                 aes_string(x="long", y="lat", group="group",
                                            fill=input$priods,
                                            alpha=input$prosojnost),
                                            color = "grey35") +
                    scale_fill_gradient(low="aquamarine4", high="aquamarine")}
      
  })
})