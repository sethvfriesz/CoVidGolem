#' US_counties_map_plot 
#'
#' @description A fct function
#'
#' @return The return value, if any, from executing the function.
#'
#' @noRd
NULL
US_counties_map_plot <- function(dataset,date) {
  plotly::plot_ly(text = ~paste(US_counties$Combined_Key,'infection count:',US_counties[,date])) %>%
    plotly::add_trace(
      type="choropleth",
      geojson=rjson::fromJSON(file='https://raw.githubusercontent.com/plotly/datasets/master/geojson-counties-fips.json'),
      locations=US_counties$FIPS,
      z=US_counties[,date],
      colorscale="heat",
      zmin= min(US_counties[,date]),
      zmax=(quantile(US_counties[,date])[4]) + (6*((quantile(US_counties[,date])[4])-(quantile(US_counties[,date])[2]))),
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
        lakecolor = plotly::toRGB('blue')
      )
    )
}
