library(shiny)

server <- function(input, output){
  
  output$abcd <- renderUI({
    checkboxGroupInput('abcd.in', 'sample',
                       choices = c('wowe'= 1,
                                   'such' = 2,
                                   'choice' = 3,
                                   'very' = 4,
                                   'programe' = 5))
  })
  
  output$value <- renderPrint({input$abcd.in})
  
  output$result <- renderUI({
    set_output_automatically(input$abcd.in, arg.info)
  })
  
}
