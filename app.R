library(shiny)

ui <- fluidPage(
  
  titlePanel("Student' t Density Distribution"),
  
  sidebarLayout(

    sidebarPanel(
      numericInput(inputId = "sd",
        label = "Choose a degree of freedom.",
        min = 1, max = 1000, value = 10)
      ),

    mainPanel(
      plotOutput(outputId = "densityPlot")
      )
    )
  )


server <- function(input, output){
  
  output$densityPlot <- renderPlot({
    curve(dt(x, input$sd), -3, 3,
      ylim = c(0, 0.4),
      main = paste("Random t value distribution with df =", input$sd),
      xlab = "t", ylab = "density")
    curve(dnorm(x), lty = 2, col = "navy", add = T)
    })
  }

shinyApp(ui = ui, server = server)