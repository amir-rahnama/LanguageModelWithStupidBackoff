library(shiny)

shinyUI(fluidPage(
  titlePanel("Shannon Game: Case Study with SwiftKey Data"),
  br(),
  br(),
  sidebarLayout(
    sidebarPanel(
      textInput("sentence", "Enter a sentence here:", ""),
      submitButton("Submit")
    ),
    mainPanel(
      strong("We predict the next word using a Stupid Backoff Approach"),
      br(),
      br(),
      div("Due to Limitations on computation resources, we have built this model using 60% of original data as training data"),
      br(),
      div("We set 20, 30 and 40 as n-gram thresholds for 1-3 grams respectively."),
      br(),
      strong("This will of course increases the chance of unseen words however the tradeoff is made due to memoty limitations of Shiny."),
      br(),
      br(),
      strong("The predicted word to appear is:"),
      br(),
      br(),
      verbatimTextOutput("prediction")
    )
  )
))