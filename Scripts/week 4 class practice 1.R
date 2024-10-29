install.packages("tidyverse")

library(tidyverse)
survey <- read.csv("data/portal_data_joined.csv")
#select  columns
month_day_year <- select(survey, year == 1981)
#filtering by equals
year_1981 <- filter(surveys, year ==1981)



year_1981_baser <- surveys[surveys$year == 1981,]
identical(year_1981, year_1981_baser)

sum(year_1981$year != 1981, na.rm = T)




#filtering by range
the80s <- surveys <- surveys[surveys$year%in% 1981:1983]
the80stidy <- filter(surveys, year %in% 1981:1983)
#5083 results




#review: why should









#filtering by multiple conditions
small_animals <- filter(surverys, weight < 5)
small_animals-ids <- select(filter(surveys, weight < 5), record_id, plot_id, species_id)

#same process, using a pipe
#cmd Shift M

  

  
  
  
    

  
#how to do line 
#breaks with pipes
surveys %>% filter(
  month == 1)



#line break rukes: after open 





mini <- surveys[190:209,]
tablw(mini$species_id)
#how many rows have a species ID that's either DM or NL?
nrow(mini)



text <- mini %>% filter(species_id == c('DM' , NL""))
nrow(test)





















  
  
  
  
  
  
  
  
  
    
  
  
  
  
  




