
library(shiny)

ui <- fluidPage(
  
  titlePanel("Student' t Density Distribution"),
  
  sidebarLayout(

    sidebarPanel(
      numericInput(inputId = "sd",
        label = "Choose a degree of freedom.",
        min = 1, max = 1000, value = 1)
      ),

    mainPanel(
      plotOutput(outputId = "densityPlot")
      )
    )
  )


server <- function(input, output){
  
  output$densityPlot <- renderPlot({
    curve(dt(x, input$sd), -3, 3,
      ylim = c(0, 0.4), lwd = 2,
      main = paste("Random t value distribution with df =", input$sd),
      xlab = "t", ylab = "density", cex.main = 1.5, cex.axis = 1.2)
    curve(dnorm(x), lty = 2, lwd = 2, col = "red", add = T)
    legend("topright", c("Normal", "Student' t"), lty = 1:2, col = c(2, 1), 
      pch = 15:16, cex = 1.5)
    })
  }

shinyApp(ui = ui, server = server)