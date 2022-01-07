## code to prepare `Census` dataset goes here
library(readr)

Census = readr::read_csv("https://raw.githubusercontent.com/sethvfriesz/CoVidGolem/main/Census.csv")

usethis::use_data(Census, overwrite = TRUE)
