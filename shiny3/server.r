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
    
    končnipodatki$prise.min.odse.sku <-končnipodatki$priseljeni.skupaj-končnipodatki$odseljeni.skupaj
    končnipodatki$prise.min.odse.z <-končnipodatki$priseljeni.ženske-končnipodatki$odseljeni.ženske
    končnipodatki$prise.min.odse.m <-končnipodatki$priseljeni.moški-končnipodatki$odseljeni.moški
    
    
    if((input$prosojnost)=="nič" ) {ggplot() + 
                                    geom_polygon(data = končnipodatki, 
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