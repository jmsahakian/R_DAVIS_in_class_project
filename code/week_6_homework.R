#Week 6 Homework

library(tidyverse)
gapminder <- read_csv("data/raw_data/gapminder.csv")

#Problem 1
#First calculates mean life expectancy on each continent. 
#Then create a plot that shows how life expectancy has changed over time in each continent. 

gapminder %>%
  group_by(year, continent) %>% 
  mutate(avg_lifeExp = mean(lifeExp)) %>% 
  ggplot(mapping = aes(x=year, y=avg_lifeExp)) +
  geom_point(aes(color = continent)) + 
  geom_line(aes(color = continent))

#Problem 2
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent), size = .25) + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw()
#The scale_x_log10() scales the gdpPercap.  I would expect there to be great variation in gdp per capitia and this will 
#allow for patterns and differences between the orders of magnititude to be seen better.
#I would expect geom_smooth to create a line based upon these data for each continent in order to see any trends.

gapminder %>% 
  mutate(prop_lifeExp = lifeExp/pop) %>% 
  ggplot(aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent, size = prop_lifeExp)) + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw() 

gapminder %>% 
  ggplot(aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent, size = pop)) + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw()   

#Problem 3
  gapminder %>%
    filter(country %in% c("Brazil", "China", "El Salvador", "Niger", "United States")) %>% 
    ggplot(aes(x = country, y = lifeExp)) +
    geom_jitter()+
    geom_boxplot(aes(color = country), alpha = 0.5)+ 
    labs(color = "Country") +
    labs(x = "Country", y = "Life Expectancy")+
    labs(title = "Life Expectancy of Five Countries") 
  ggsave(filename = "lifeExp5.png", plot=last_plot())

  