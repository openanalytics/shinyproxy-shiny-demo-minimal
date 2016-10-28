library(shiny)
library(Rmpfr)


shinyServer(function(input, output){
      
 
      output$result <- renderText({
            
            precisionBits <- input$precision
            one <- mpfr(1, precBits = precisionBits) 
            e <- exp(one)
            # TODO fix printing...
            x <- capture.output(print(e, ndigits = precisionBits))[2]
            gsub("^\\[1\\] (.+)$", "\\1", x)
            
            
          })
      
    })
