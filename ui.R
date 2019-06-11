## install.packages("shinythemes")
library(shinythemes)
library(shiny)
library(shinyWidgets)
library(markdown)
## Define UI for application that draws a histogram
shinyUI(
  navbarPage(
    title = "Stat403",
    theme = shinytheme("cosmo"),
    ## first tab
    tabPanel(
      "Heat Map",
      fluidPage(
        titlePanel("Heat Map"),
        sidebarLayout(
          sidebarPanel(
            ## radio buttons
            radioButtons(
              "att",
              "Select Attribute",
              choices = list("Number of Colony" = "numcol", "Yield per Colony" = "yieldpercol"
                             , "Total Production" = "totalprod", "Price per pound" = "priceperlb")
            ),
            ## select input box
            sliderInput(
              "year",
              "Select a year",1998,2016,1998
            )
          ),
          mainPanel(
            tabsetPanel(
              tabPanel("Map", plotOutput("map"))
            )
          )
        )
      )
    ),
    tabPanel(
      "Time Trend",
      fluidPage(
        titlePanel("Time Trend"),
        sidebarLayout(
          sidebarPanel(
            ## radio buttons
            radioButtons(
              "att1",
              "Select Attribute",
              choices = list("Number of Colony" = "numcol", "Yield per Colony" = "yieldpercol"
                             , "Total Production" = "totalprod", "Price per pound" = "priceperlb")
            )
          ),
          mainPanel(
            tabsetPanel(
              tabPanel("Map", plotOutput("anim"))
            )
          )
        )
      )
    ),setBackgroundColor(color = c("yellow", "black"),
                         gradient = "radial",
                         direction = c("top"))
  )
)