library(tidyverse)

survey <- read.csv("data/portal_data_joined.csv")

colnames()

surveys_base <- surveys[1:5000, c(6, 9, 13)]

surveys_base <- surveys_base[complete.cases(surveys_base), ]

surveys_base$species_id <- factor(surveys$species_id)

surveys_base$plot_type <- factor(surveys$plot_type)

### Factors categorize data! Factors let R know what values some variables can have.

# 


getwd()

setwd("path/to/your/directory")

setwd("C:/Users/hp/Documents/my_project")


