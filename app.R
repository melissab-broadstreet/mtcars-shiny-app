# Load Shiny
library(shiny)
library(ggplot2)
library(ggbernie)

# UI
ui <- fluidPage(
  titlePanel("mtcars Bernie Sanders Scatterplot"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("xvar", "X-axis:",
                  choices = names(mtcars),
                  selected = "wt"),
      selectInput("yvar", "Y-axis:",
                  choices = names(mtcars),
                  selected = "mpg")
    ),
    mainPanel(
      plotOutput("scatterPlot")
    )
  )
)

# Server
server <- function(input, output) {
  output$scatterPlot <- renderPlot({
    x <- mtcars[[input$xvar]]
    y <- mtcars[[input$yvar]]

    ggplot(mtcars, aes_string(input$xvar, input$yvar)) +
      geom_bernie(bernie = "sitting") +
      xlab(input$xvar) +
      ylab(input$yvar) +
      ggtitle(paste("mtcars:", input$yvar, "vs", input$xvar)) +
      theme_minimal()
  })
}

# Run app
shinyApp(ui = ui, server = server)
