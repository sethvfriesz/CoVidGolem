library(tidyr)
library(anytime)
library(dplyr)
#' Get Data 
#'
#' @description A fct function that gets the necessary data
#'
#' @return The return value, if any, from executing the function.
#'
#' @noRd

get_the_data <- function() {
  US_counties <- raw_US_counties
  for (x in 1:length(US_counties$UID)){
    US_counties[x,5] = as.character(substr(US_counties[x,1], 4, 8))
  }
  
  US_counties[2586,6] = "Shannon"
  US_counties[87,6] = "Wade Hampton"
  
  US_counties[2586,5] ='46113'
  US_counties[87,5]  = '02270'
  US_counties_dates <- US_counties[,c(12:ncol(US_counties))]
  
  US_states_14_days_final = Census[6:nrow(Census), 'NAME']
  
  US_counties_14_days = US_counties[, seq_len(ncol(US_counties)) %% 14 == 7]
  for (x in unique(Census$NAME)){
    for (y in 2:ncol(US_counties_14_days)){
      US_states_14_days_final[US_states_14_days_final$NAME == x,y] = sum(US_counties_14_days[US_counties_14_days$Province_State == x, y])
    }
    
  }

  list_of_names = c('State', '01/31/2020','02/14/2020','02/28/2020','03/13/2020','03/27/2020','04/10/2020','04/24/2020','05/08/2020','05/22/2020','06/05/2020','06/19/2020','07/3/2020'
                    ,'07/17/2020','07/31/2020','08/14/2020','08/28/2020','09/11/2020','09/25/2020','10/9/2020','10/23/2020','11/6/2020','11/20/2020','12/4/2020',
                    '12/18/2020','01/01/2021','01/15/2021','01/29/2021','2/12/2021','2/26/2021','3/12/2021','3/26/2021','4/9/2021','4/23/2021','5/7/2021','5/21/2021'
                    ,'6/4/2021','6/18/2021','7/2/2021','7/16/2021','7/30/2021','8/13/2021','8/27/2021','9/10/2021','9/24/2021', '10/8/2021', '10/22/2021'
                    ,'11/5/2021', '11/19/2021','12/3/2021', '12/17/2021','12/31/2021')
  
  colnames(US_states_14_days_final)<- list_of_names
  
  states_longer = US_states_14_days_final %>% pivot_longer(!State, names_to = "date", values_to = "overall")
  states_longer$date <- anydate(states_longer$date)
  
  # for loop to get per 100,000
  for (x in unique(states_longer$State)){
    states_longer[states_longer$State == x, "state_population"] = Census[Census$NAME == x, "POPESTIMATE2019"]
  }
  
  states_longer$per_hundred_thousand = (states_longer$overall / (states_longer$state_population/100000))
  return(
    list(US_counties = US_counties,
         US_counties_dates = US_counties_dates,
         states_longer = states_longer
    )
  )
}

