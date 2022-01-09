#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # Your application server logic 
  tab <- reactive(input$navbar)
  app_data <- get_the_data()
  browser()
  mod_The_Main_Man_server(id = "The_Main_Man_ui_1",
                          app_data = app_data,
                          tab = tab)
  mod_US_States_Infections_server(id = "US_States_Infections_ui_1",
                                  app_data = app_data,
                                  tab = tab)
  
}
