library(tidyverse)
gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv")
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent), size = .25) + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw()


library(tidyverse)

#Problem 01:

gapminder %>%
  group_by(continent, year) %>% 
  summarize(mean_lifeExp = mean(lifeExp)) %>% #calculate the mean life expectancy for each continent and year
  ggplot()+
  geom_point(aes(x = year, y = mean_lifeExp, color = continent))+ #scatter plot
  geom_line(aes(x = year, y = mean_lifeExp, color = continent)) #line plot



#PROBLEM 02:

#challenge answer
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent, size = pop)) + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw()


#PROBLEM 03: 

library(ggplot2)
library(dplyr)
library(gapminder)

# Filter the data for the specified countries
gapminder %>%
  filter(country %in% c("Brazil", "China", "El Salvador", "Niger", "United States")) %>%
  ggplot(aes(x = country, y = lifeExp)) +
  geom_boxplot(outlier.shape = NA, color = "darkblue") +  # Draw boxplots
  geom_jitter(width = 0.2, alpha = 0.5, color = "tomato") +  # Add jittered data points
  labs(title = "Life Expectancy of Five Countries",
       x = "Country",
       y = "Life Expectancy") +
  theme_minimal()


