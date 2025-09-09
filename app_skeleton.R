# SHINY APP SKELETON -----------------------------------------------------------
# Fill in the missing code chunks with your code!

# Load Shiny
library(shiny)
library(ggplot2)
library(ggbernie)

# UI
ui <- fluidPage(
  # 1. Add a titlePanel for a title for your Shiny app
  # YOUR CODE HERE
  
  sidebarLayout(
    sidebarPanel(
      # 2. Add a selectInput for your x-axis variable
      # Hint: Look at the ID used in the server and make sure your ID matches
      # YOUR CODE HERE
      
      # 3. Add a selectInput for your y-axis variable
      # Hint: Look at the ID used in the server and make sure your ID matches
      # YOUR CODE HERE
    ),
    mainPanel(
      # 4. Add a plotOutput for your plot
      # Hint: Look at the ID used in the server and make sure your ID matches
      # YOUR CODE HERE
    )
  )
)

# Server
server <- function(input, output) {
  output$scatterPlot <- renderPlot({
    x <- mtcars[[input$xvar]]
    y <- mtcars[[input$yvar]]
    
    ggplot(mtcars, aes(.data[[input$xvar]], .data[[input$yvar]])) +
      geom_bernie(bernie = "sitting") +
      xlab(input$xvar) +
      ylab(input$yvar) +
      ggtitle(paste("mtcars:", input$yvar, "vs", input$xvar)) +
      theme_minimal()
  })
}

# Run app
shinyApp(ui = ui, server = server)
