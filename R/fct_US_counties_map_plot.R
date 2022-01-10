# library(tidyr)
# library(dplyr)
# library(plotly)
#' @name US_counties_map_plot 
#'
#' @description A fct function
#'
#' @return The return value, if any, from executing the function.
#'
#' @noRd
NULL
US_counties_map_plot <- function(dataset,date) {
  print(date)
  plotly::plot_ly(text = ~paste(dataset$Combined_Key,'infection count:',dataset[,date])) %>%
    plotly::add_trace(
      type="choropleth",
      geojson=rjson::fromJSON(file='https://raw.githubusercontent.com/plotly/datasets/master/geojson-counties-fips.json'),
      locations=dataset$FIPS,
      z=dataset[,date],
      colorscale="heat",
      zmin= min(dataset[,date]),
      zmax=(quantile(dataset[,date])[4]) + (6*((quantile(dataset[,date])[4])-(quantile(dataset[,date])[2]))),
      marker=list(line=list(
        width=0)
        
      )
    ) %>%
    plotly::colorbar(title = "Total Number of COVID-19 infections") %>%
    plotly::layout(
      geo = list(
        scope = 'usa',
        projection = list(type = 'albers usa'),
        showlakes = TRUE,
        lakecolor = plotly::toRGB('blue')
      )
    )
}