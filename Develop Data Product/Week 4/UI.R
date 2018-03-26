---
title: "ui.R"
author: "Sayak"
date: "March 25, 2018"
output: html_document
runtime: shiny
---

# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#
```{R} 
library(shiny)

shinyUI (fluidPage(
   # Application title
   titlePanel(title = h3("GISS Surface Temperature Analysis", align="center")),
   br(),   br(),
   sidebarLayout(
           sidebarPanel(
                   #------------------------------------------------------------------
                   # Add radio button to choice for north pole or south pole data
                   radioButtons("poleInput", 
                                label = "Select Data: ",
                                choices = list("North Pole data" = 'NHem', "South Pole Data" = 'SHem', "Global Data" = 'Glob'),
                                selected = 'Glob'),
                   br(),   br(),
                   #------------------------------------------------------------------
                   # Add Variable for Year Selection
                   sliderInput("YearRange", "Select Year Range : ", min=1880, max=2016, value=c(1880, 1900), step=1
                   
                   ),
                   
                   br(),   br(),
                   #------------------------------------------------------------------
                   # Add Variables selection option from January to December : 
                   selectInput("var", "Select Variable from Dataset", 
                               choices=c("Jan"=2, "Feb"=3, "Mar"=4, "Apr"=5, 
                                         "May"=6, "Jun"=7, "Jul"=8, "Aug"=9, 
                                         "Sep"=10, "Oct"=11, "Nov"=12, "Dec"=13),
                               multiple=TRUE, selected = "Jan"
                               ),
                   
                   br(),   br()
                   #------------------------------------------------------------------
                   # Change background color for body
                   #tags$style("body{background-color:lightyellow; color:brown}")
           ),
           
           mainPanel(
                   #------------------------------------------------------------------
                   # Create tab panes
                   tabsetPanel(type="tab",
                               tabPanel("Summary",verbatimTextOutput("sumry")),
                               tabPanel("Structure", verbatimTextOutput("struct")),
                               tabPanel("Data", tableOutput("displayData")),
                               tabPanel("Plot", plotOutput("mygraph"))
                   )
                   
                   #------------------------------------------------------------------
           )
   )
    
)
)
  
``` 

