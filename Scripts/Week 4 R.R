library(tidyverse)

surveys <- read_csv("data/portal_data_joined.csv")

surveys01 <- surveys %>%
  filter(weight < 60 & weight > 30) %>%
  print(n=6)  

biggest_critters <-surveys %>%
  group_by(species_id,sex) %>% 
  filter(!is.na(weight)) %>%
  summarize(largest = max(weight)) %>%
  arrange(desc(largest))

biggest_critters

surveys %>%
  group_by(species) %>%
  summarise(count_na_weight = sum(is.na(weight), na.rm = TRUE)) %>%
  arrange(desc(count_na_weight))

surveys_avg_weight <- surveys %>%
  summarise(count_na_weight = sum(is.na(weight), na.rm = TRUE)) %>%
  mutate(avg_weight = mean(weight)) %>%
  select(species_id, sex, weight, avg_weight)

surveys_avg_weight <- surveys_avg_weight %>%
  mutate(above_avg = weight > avg_weight)

surveys_avg_weight
  
