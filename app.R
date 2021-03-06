library(shiny)

arg.info <-  list(
  list(choices = c("Yes" = T, "No" = F),
       prompt = quote(paste("Remove Missing Values for analysis?")),
       type = "radioButtons"),
  list(choices = c("not" = 0, "some" = 1, "very" = 3),
       prompt = quote(paste("how cool are you?")),
       type = "checkboxGroupInput"))


set_output_automatically <- function(input, arg.info){
  if(input[1] > 3){
    arg.info <- arg.info[[1]]
  } else {
    arg.info <- arg.info[[2]]
  }
  do.call(arg.info$type, args=list(inputId=paste0("in", input), label = arg.info$prompt,
                                   choices = arg.info$choices))
  
}

ui <- fluidPage(
  uiOutput('abcd'),
  textOutput('value'),
  uiOutput('result')
)

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

shinyApp(ui = ui, server = server)
