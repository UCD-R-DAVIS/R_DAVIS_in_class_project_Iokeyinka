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

countries <- c("Brazil", "China", "El Salvador", "Niger", "United States") 
#create a vector with just the countries we are interested in

gapminder %>% 
  filter(country %in% countries) %>% 
  ggplot(aes(x = country, y = lifeExp))+
  geom_boxplot() +
  geom_jitter(alpha = 0.3, color = "blue")+
  theme_minimal() +
  ggtitle("Life Expectancy of Five Countries") + #title the figure
  theme(plot.title = element_text(hjust = 0.5)) +#centered the plot title
  xlab("Country") + ylab("Life Expectancy") #how to change axis names
