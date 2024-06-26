library(shiny)
library(Rmpfr)

ui <- fluidPage(
    titlePanel("Euler's e in arbitrary precision", "Euler's e"),
    tags$br(),
    
    fluidRow(
        column(2, sliderInput("precision", "Number of Precision Bits", min = 2, max = 256, value = 10))
    ),
    fluidRow(
        column(12, tags$h1(textOutput("result")))
    
    ),
    tags$br(),
    tags$p("We would like to acknowledge Leonhard Euler for his number and Martin Maechler for his Rmpfr package.")
)

server <- function(input, output) {
  
  output$result <- renderText({
        
        precisionBits <- input$precision
        one <- mpfr(1, precBits = precisionBits) 
        e <- exp(one)
        formatMpfr(e)
        
      })
  
}

shinyApp(ui, server)
