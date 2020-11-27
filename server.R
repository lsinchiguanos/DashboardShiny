#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

#install.packages("DBI")
#install.packages("odbc")
#install.packages("pool")
#install.packages("rjson")
#install.packages("plotly")
#install.packages("DT")
#install.packages("RPostgreSQL")

library(shiny)

library(odbc)
library(pool)
library(rjson)
#library(plotly)
library(DT)
#library(RPostgreSQL)

# Defino el Driver de PostgreSQL
sort(unique(odbcListDrivers()[[1]]))

con <- DBI::dbConnect(odbc::odbc(),
                      Driver   = "PostgreSQL Unicode",
                      Server   = "localhost",
                      Database = "dashboard",
                      uid = "postgres",
                      pwd = "12345",
                      Port     = 5432)

#pool = dbPool(
#    drv = dbDriver("PostgreSQL", max.con = 100),
#    dbname = "dashboard",
#    host = "localhost",
#    user = "postgres",
#    password = "12345",
#    idleTimeout = 3600000
#)

id_maxmin = c (round(dbGetQuery(con, "SELECT MAX(id), MIN(id) FROM plantacion")))

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$table = DT::renderDataTable({
        #query <- sqlInterpolate(ANSI(), "SELECT * FROM plantacion WHERE id <= ?id;", id = input$id_selector)
        query <- paste0("SELECT * FROM plantacion WHERE ", paste(input$id_selector), " <= ?id;")
        outp <- dbGetQuery(con, query)
        ret <- DT::datatable(outp)
        return(ret)
    })
})
