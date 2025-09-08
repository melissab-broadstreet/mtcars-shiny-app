# Load Shiny
library(shiny)

# UI
ui <- fluidPage(
  titlePanel("mtcars Scatterplot"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("xvar", "X-axis:",
                  choices = names(mtcars),
                  selected = "wt"),
      selectInput("yvar", "Y-axis:",
                  choices = names(mtcars),
                  selected = "mpg"),
      checkboxInput("colourByCyl", "Colour by cylinders (cyl)", TRUE),
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
