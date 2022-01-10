## code to prepare `US_counties` dataset goes here
library(readr)
library(readxl)
raw_US_counties = read.csv('https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_US.csv')
for (x in 1:length(raw_US_counties$UID)){
  raw_US_counties[x,5] = as.character(substr(raw_US_counties[x,1], 4, 8))
}

raw_US_counties[2586,6] = "Shannon"
raw_US_counties[87,6] = "Wade Hampton"

raw_US_counties[2586,5] ='46113'
raw_US_counties[87,5]  = '02270'
usethis::use_data(raw_US_counties, overwrite = TRUE)
