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
        selectInput('date','Please select a date:', choices = colnames(US_counties_dates))
      ),
      mainPanel(
        h1("CoVid-19 since patient zero across the U.S."),
        plotlyOutput(outputId = "p", height = "900px")
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
      plot_ly(text = ~paste(US_counties$Combined_Key,'infection count:',US_counties[,input$date])) %>%
        add_trace(
          type="choropleth",
          geojson=rjson::fromJSON(file='https://raw.githubusercontent.com/plotly/datasets/master/geojson-counties-fips.json'),
          locations=US_counties$FIPS,
          z=US_counties[,input$date],
          colorscale="heat",
          zmin= min(US_counties[,input$date]),
          zmax=(quantile(US_counties[,input$date])[4]) + (6*((quantile(US_counties[,input$date])[4])-(quantile(US_counties[,input$date])[2]))), 
          marker=list(line=list(
            width=0)
            
          )
        ) %>% 
        colorbar(title = "Total Number of COVID-19 infections") %>%
        layout(
          geo = list(
            scope = 'usa',
            projection = list(type = 'albers usa'),
            showlakes = TRUE,
            lakecolor = toRGB('blue')
          )
        )
      
    })
  })
}
    
## To be copied in the UI
# mod_The_Main_Man_ui("The_Main_Man_ui_1")
    
## To be copied in the server
# mod_The_Main_Man_server("The_Main_Man_ui_1")
