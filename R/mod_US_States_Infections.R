#' US_States_Infections UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_US_States_Infections_ui <- function(id){
  ns <- NS(id)
  tabPanel("CoVid-19 infections over time by State",
           sidebarLayout(
             sidebarPanel(
               radioButtons(
                 inputId = "measurement",
                 label = "Please pick a way to measure CoVid-19 infections:",
                 choices = c("Overall infections over 2 week periods", "Overall infections per 100,000 population over 2 week periods")),
               shinyWidgets::pickerInput(
                 inputId = "state",
                 label = "Please select one or more state(s):",
                 choices=unique(states_longer['State']),
                 selected = 'South Dakota',
                 options = list(`actions-box` = TRUE),
                 multiple = T)
             ),
             mainPanel(
               shinysky::busyIndicator(text = "Give me a sec brudda", wait = 1000 ),
               h1("CoVid-19 infections over time by State"),
               plotly::plotlyOutput(
                 outputId = 'state_plot',
                 height = "800px",
                 width = "1150px")
             )
           )
  )
}
    
#' US_States_Infections Server Functions
#'
#' @noRd 
mod_US_States_Infections_server <- function(id, app_data, tab){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    output$state_plot <- plotly::renderPlotly({
      dataplot = infections_plot(
        dataset = app_data$states_longer,
        plot_choice = input$measurement,
        states = input$state)
    })
  })
}
    
## To be copied in the UI
# mod_US_States_Infections_ui("US_States_Infections_ui_1")
    
## To be copied in the server
# mod_US_States_Infections_server("US_States_Infections_ui_1")
