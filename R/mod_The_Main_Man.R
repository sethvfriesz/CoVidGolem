#' The_Main_Man UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
mod_The_Main_Man_ui <- function(id){
  ns <- NS(id)
  tabPanel(
    "CoVid-19 since patient zero across the U.S.",
    sidebarLayout(
      sidebarPanel(
        selectInput('date','Please select a date:', choices = colnames(raw_US_counties[,c(12:ncol(raw_US_counties))]))
      ),
      mainPanel(
        shinysky::busyIndicator(text = "Give me a sec brudda", wait = 1000 ),
        #add_busy_spinner(spin = "fading-circle"),
        h1("CoVid-19 since patient zero across the U.S."),
        plotly::plotlyOutput(outputId = "p", height = "800px")
      )
    )
  )
}
    
#' The_Main_Man Server Functions
#'
#' @noRd 
mod_The_Main_Man_server <- function(id, app_data, tab){
  moduleServer( id, function(input, output, session){
    ns <- session$ns
    #---------------------------------------
    output$p <- plotly::renderPlotly({
      dataplots = US_counties_map_plot(
        dataset = app_data$US_counties,
        date = input$date)
    })
  })
}
    
## To be copied in the UI
# mod_The_Main_Man_ui("The_Main_Man_ui_1")
    
## To be copied in the server
# mod_The_Main_Man_server("The_Main_Man_ui_1")
