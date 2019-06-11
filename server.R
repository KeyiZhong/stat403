#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)
library(usmap)
library(ggplot2)
data = read.csv("HoneyProduction9816.csv")
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$map <- renderPlot({
    filtered_data = data %>% filter(year == input$year) %>% select_("state",input$att)
    plot_usmap(data = filtered_data, values = input$att, lines = "black") + 
      scale_fill_continuous(low = "yellow", high = "black",name = paste0(input$att,"(",input$year,")"), label = scales::comma) + 
      theme(legend.position = "right")
  })
  
  output$anim <- renderImage(
    return(list(
      src = paste0(input$att1,".gif"),
      filetype = "gif",
      alt = "This is a gif"
    ))
    ,deleteFile=FALSE)
})

