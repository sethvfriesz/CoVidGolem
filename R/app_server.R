#' The application server-side
#' 
#' @param input,output,session Internal parameters for {shiny}. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function( input, output, session ) {
  # Your application server logic 
  tab <- reactive(input$navbar)
  data_call <- get_the_data()
  mod_The_Main_Man_server(id = "The_Main_Man_ui_1",
                          app_data = data_call$US_counties,
                          tab = tab)
  print("Done")
  #View(app_data$US_counties)
  mod_US_States_Infections_server(id = "US_States_Infections_ui_1",
                                  app_data = data_call$states_longer,
                                  tab = tab)
  
}
