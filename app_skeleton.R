# Load Shiny
library(shiny)

# UI
ui <- fluidPage(
  # 1. Add a titlePanel here with your app's title
  # Use an ID that corresponds to the IDs you can see in the server
  # YOUR CODE HERE
  
  sidebarLayout(
    sidebarPanel(
      # 2. Add a selectInput here to choose the x-axis variable
      # Use an ID that corresponds to the IDs you can see in the server
      # YOUR CODE HERE
      
      # 3. Add a selectInput here to choose the y-axis variable
      # Use an ID that corresponds to the IDs you can see in the server
      # YOUR CODE HERE
      
      # 4. Add a checkbox here to colour your plot by cylinders
      # Use an ID that corresponds to the IDs you can see in the server
      # YOUR CODE HERE
      
      sliderInput("ptsize", "Point size:", min = 1, max = 6, value = 3, step = 0.5)
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
    
    if (input$colourByCyl) {
      cols <- as.numeric(as.factor(mtcars$cyl))
      plot(x, y,
           col = cols, pch = 19, cex = input$ptsize,
           xlab = input$xvar, ylab = input$yvar,
           main = paste("mtcars:", input$yvar, "vs", input$xvar))
      legend("topright",
             legend = levels(as.factor(mtcars$cyl)),
             col = seq_along(levels(as.factor(mtcars$cyl))),
             pch = 19, title = "cyl")
    } else {
      plot(x, y,
           pch = 19, cex = input$ptsize,
           xlab = input$xvar, ylab = input$yvar,
           main = paste("mtcars:", input$yvar, "vs", input$xvar))
    }
  })
}

# Run app
shinyApp(ui = ui, server = server)
