library(shiny)
source("GeneAnalysis.R")

shinyServer(function(input,output) {

    values <- reactiveValues(variable = NA)
    
    observe({
        if(input$submit) {
          
          values$fileInput <- isolate(input$fileInput)
          fileInput <- as.character(input$fileInput)
          values$run <- GeneAnalysis(fileInput)
        }
    })
    
    output$text <- renderTable({values$run})
})
