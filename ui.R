#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Sinchiguano Cacao"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("id_selector", "select ID",
                        min = id_maxmin$min,
                        max = id_maxmin$max,
                        value = id_maxmin$max,
                        step = 1
            )
        ),

        # Show a plot of the generated distribution
        mainPanel(
            DT::dataTableOutput("table")
        )
    )
))
