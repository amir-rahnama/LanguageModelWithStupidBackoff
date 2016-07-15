library(shiny)
source('backoff.R')
source('utils.R')

shinyServer(function(input, output) {
  output$prediction <- renderText({
    trimmed <- toString(input$sentence)
    text <- strsplit(trimmed, split= " ")[[1]]
    if (length(text) > 0) {
      sentence <- tolower(trimws(clean(paste(text[(length(text) - 2): (length(text))], collapse=" "))))
      result <- predict(sentence)$value
    }
  })
})