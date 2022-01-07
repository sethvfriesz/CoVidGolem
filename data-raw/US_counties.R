## code to prepare `US_counties` dataset goes here
library(readr)
library(readxl)
raw_US_counties = read.csv('https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_US.csv')

usethis::use_data(raw_US_counties, overwrite = TRUE)
